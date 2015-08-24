/**
 * Copyright (c) 2006-2015 LOVE Development Team
 *
 * This software is provided 'as-is', without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 **/

#include "delay.h"

#if defined(__LIBRETRO__)

#if defined(__CELLOS_LV2__) && !defined(__PSL1GHT__)
#elif defined(PSP)
#elif defined(_WIN32)
#  define WIN32_LEAN_AND_MEAN
#  include <windows.h>
#elif defined(XENON)
#elif defined(GEKKO) || defined(__PSL1GHT__) || defined(__QNX__)
#else
#endif

static void SDL_Delay(unsigned int ms)
{
#if defined(__CELLOS_LV2__) && !defined(__PSL1GHT__)
  sys_timer_usleep(1000 * ms);
#elif defined(PSP)
  sceKernelDelayThread(1000 * ms);
#elif defined(_WIN32)
  Sleep(ms);
#elif defined(XENON)
  udelay(1000 * ms);
#elif defined(GEKKO) || defined(__PSL1GHT__) || defined(__QNX__)
  usleep(1000 * ms);
#else
  struct timespec tv = {0};
  tv.tv_sec = ms / 1000;
  tv.tv_nsec = (ms % 1000) * 1000000;
  nanosleep(&tv, NULL);
#endif
}

#else

#include <SDL_timer.h>

#endif

namespace love
{

void delay(unsigned int ms)
{
	SDL_Delay(ms);
}

} // love
