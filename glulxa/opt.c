/* (C) Simon Stapleton, some minor bug fixes (C) Julio Sangrador */

/*
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA. 
*/

#include <string.h>

char *optarg;
int optind;

int
getopt (int argc, char *argv[], char *format)
{
  int returnvalue;
  static int current = 0;
  current++;
  while ((current < argc) && (argv[current][0] != '-'))
    current++;
  if (current >= argc)
    return -1;
  returnvalue = argv[current][1];
  current++;
  optarg = strdup (argv[current]);
/*  curr++;*/
  return returnvalue;
}
