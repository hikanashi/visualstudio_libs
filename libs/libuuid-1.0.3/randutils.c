/*
 * General purpose random utilities
 *
 * Based on libuuid code.
 *
 * This file may be redistributed under the terms of the
 * GNU Lesser General Public License.
 */
#include <stdio.h>
#ifndef _WIN32
#include <unistd.h>
#endif
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#ifndef _WIN32
#include <sys/time.h>
#include <sys/syscall.h>
#else
#include <process.h>
#define getpid _getpid
#define getuid()   (100)
typedef int ssize_t;

#include <time.h>
#include <windows.h>
#include <stdint.h>
// MSVC defines this in winsock2.h!?
//typedef struct timeval {
//    long tv_sec;
//    long tv_usec;
//} timeval;
 
static 
int gettimeofday(struct timeval * tp, struct timezone * tzp)
{
    // Note: some broken versions only have 8 trailing zero's, the correct epoch has 9 trailing zero's
    // This magic number is the number of 100 nanosecond intervals since January 1, 1601 (UTC)
    // until 00:00:00 January 1, 1970 
    static const uint64_t EPOCH = ((uint64_t) 116444736000000000ULL);

    SYSTEMTIME  system_time;
    FILETIME    file_time;
    uint64_t    time;

    GetSystemTime( &system_time );
    SystemTimeToFileTime( &system_time, &file_time );
    time =  ((uint64_t)file_time.dwLowDateTime )      ;
    time += ((uint64_t)file_time.dwHighDateTime) << 32;

    tp->tv_sec  = (long) ((time - EPOCH) / 10000000L);
    tp->tv_usec = (long) (system_time.wMilliseconds * 1000);
    return 0;
}
#endif


#include "randutils.h"

#ifdef HAVE_TLS
#define THREAD_LOCAL static __thread
#else
#define THREAD_LOCAL static
#endif

#if defined(__linux__) && defined(__NR_gettid) && defined(HAVE_JRAND48)
#define DO_JRAND_MIX
THREAD_LOCAL unsigned short ul_jrand_seed[3];
#endif

int random_get_fd(void)
{
	int i, fd;
	struct timeval	tv;

	gettimeofday(&tv, 0);
#ifndef _WIN32
	fd = open("/dev/urandom", O_RDONLY);
	if (fd == -1)
		fd = open("/dev/random", O_RDONLY | O_NONBLOCK);
	if (fd >= 0) {
		i = fcntl(fd, F_GETFD);
		if (i >= 0)
			fcntl(fd, F_SETFD, i | FD_CLOEXEC);
	}
#else
	fd = 0;
#endif
	srand((getpid() << 16) ^ getuid() ^ tv.tv_sec ^ tv.tv_usec);

#ifdef DO_JRAND_MIX
	ul_jrand_seed[0] = getpid() ^ (tv.tv_sec & 0xFFFF);
	ul_jrand_seed[1] = getppid() ^ (tv.tv_usec & 0xFFFF);
	ul_jrand_seed[2] = (tv.tv_sec ^ tv.tv_usec) >> 16;
#endif
	/* Crank the random number generator a few times */
	gettimeofday(&tv, 0);
	for (i = (tv.tv_sec ^ tv.tv_usec) & 0x1F; i > 0; i--)
		rand();
	return fd;
}


/*
 * Generate a stream of random nbytes into buf.
 * Use /dev/urandom if possible, and if not,
 * use glibc pseudo-random functions.
 */
void random_get_bytes(void *buf, size_t nbytes)
{
	size_t i, n = nbytes;
	int fd = random_get_fd();
	int lose_counter = 0;
	unsigned char *cp = (unsigned char *) buf;
#ifndef _WIN32
	if (fd >= 0) {
		while (n > 0) {
			ssize_t x = read(fd, cp, n);
			if (x <= 0) {
				if (lose_counter++ > 16)
					break;
				continue;
			}
			n -= x;
			cp += x;
			lose_counter = 0;
		}

		close(fd);
	}
#endif
	/*
	 * We do this all the time, but this is the only source of
	 * randomness if /dev/random/urandom is out to lunch.
	 */
	for (cp = buf, i = 0; i < nbytes; i++)
		*cp++ ^= (rand() >> 7) & 0xFF;

#ifdef DO_JRAND_MIX
	{
		unsigned short tmp_seed[3];

		memcpy(tmp_seed, ul_jrand_seed, sizeof(tmp_seed));
		ul_jrand_seed[2] = ul_jrand_seed[2] ^ syscall(__NR_gettid);
		for (cp = buf, i = 0; i < nbytes; i++)
			*cp++ ^= (jrand48(tmp_seed) >> 7) & 0xFF;
		memcpy(ul_jrand_seed, tmp_seed,
		       sizeof(ul_jrand_seed)-sizeof(unsigned short));
	}
#endif

	return;
}

#ifdef TEST_PROGRAM
int main(int argc __attribute__ ((__unused__)),
         char *argv[] __attribute__ ((__unused__)))
{
	unsigned int v, i;

	/* generate and print 10 random numbers */
	for (i = 0; i < 10; i++) {
		random_get_bytes(&v, sizeof(v));
		printf("%d\n", v);
	}

	return EXIT_SUCCESS;
}
#endif /* TEST_PROGRAM */
