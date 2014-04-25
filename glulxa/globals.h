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
#ifndef GLOBALS_H
#define GLOBALS_H 1

/*#include "opcodes.h"*/

int pass;
/*int errno;*/
#include <errno.h>

FILE *infilepointer, *outfilepointer;

char *infilename, *outfilename, filename[1280];

char *ramdatablock, *romdatablock, *ramroutblock, *romroutblock, *headerblock;
long ramdatasize, romdatasize, ramroutsize, romroutsize, headersize;
long ramrsize, ramdsize, romrsize, romdsize, headsize, extsize;
long BlockBase;

label *labeltable;
opcode *opcodes;
define *definetable;

int numlabels, asserrors;

char inputline[MAX_LINE];
char inputline_backup[MAX_LINE];

int section, segment, linenum;

#endif
