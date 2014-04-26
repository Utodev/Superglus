Welcome to glulxa v0.51

This new version of glulxa has been released once glulxa has become a GPL 
application. This package has been made by Carlos Sanchez under permission 
of original coder and copyright holder: Simon Stapleton (see license_change_details 
file for details about that). This version just include new license and some minor 
bug fixes (see 'version' file for more details), so no new documentation is need. 
Please find below original Glulxa v0.45 instructions.

Also, some changes has been added by Carlos Sánchez and Jesee McGrew on version 0.51 (see 'version' file)

Anyway, if this document disagrees somehow with COPYNG file contents (GPL license)
please don't take care of it, Glulxa has become GPL and it does not matter what 
this (older) document may say.

Contact information
===================

To contact Simon: simon.stapleton@gmail.com
To contact Carlos: csanchez71@gmail.com

[============================================================================]

Welcome to glulxa v0.45

This is version 0.45 of glulxa, the first assembler for the glulx virtual 
machine.  This is early beta quality software, so don't blame me if your 
precious computer catches fire trying to compile this.  Requests,
complaints, suggestions and, best of all, patches, can be emailed to
me at [lost e-mail address, se "Contact information" above].

The code has so far been compiled properly under Solaris 2.5.1, LinuxPPC,
SGI/IRIX, Darwin (a bit of a coup, really - glulxa was the *only* app
which compiled 'out of the box' on Darwin), Windows, DOS and, with some 
changes, Macintosh.

The assembler takes the following syntax.

Comments
--------

Comments are signified by a semicolon, followed by any amount of text.
Semicolons *anywhere* in an input line will be considered the start of a 
comment, and the rest of the line will be ignored.  This is a problem 
that may well be ironed out later.

Signifiers
----------

Once the comments have been stripped from the code, the rest is 
assembled.  The various signifiers (described below) all follow these
rules.

1) All signifiers are delimited by whitespace
2) Leading whitespace is ignored
3) No signifiers (except strings - see later) may contain whitespace
4) No signifiers may contain semicolons
5) Some signifiers take a postfix size declaration.  this is of the 
   form '.b', '.w' or '.l' for byte, word or long sizes respectively.
   i.e.  0x001000.l 

Labels
------

Labels are of the form :xxxxx where the xxxxx is the label name. 
If the label appears at the start of a line, it is the definition of
the label.  If in the operand list of an opcode, it is a reference to
the definition.  All labels used in the code must be defined elsewhere.
The special label :main must also be defined, and is the starting point
of the code.

Opodes
------

Glulxa opcodes are of the form xxxxx where xxxxx is the opcode.  
i.e. nop.

The opcodes must be followed by their operands ON THE SAME LINE.
If too few operands are specified, an error will be flagged.
Extraneous operands will be ignored WITHOUT WARNING

Opcodes may follow a label - i.e.

:null  nop  ;This is a valid source line
       nop  ;So is this
nop         ;And this

Special Opcodes
---------------

Certain special opcodes have been implemented.  These follow the 
same placement rules as glulx opcodes described above.

The special opcodes are these - 'section', 'stack', 'ext', 'dc', 
'ds'.

The 'section' opcode sets the section of memory which the following
operands will be assembled into.  This takes one operand, one of
'code', 'data', 'vcode' or 'vdata'.  When the final file is 
assembled, the ROM section will consist of the 'code' and 'data'
sections, and the RAM section will contain the 'vcode' and 'vdata'
sections.  Apart from ordering in memory, there is no real difference
between 'code' and 'data', or between 'vcode' and 'vdata'.

The 'stack' opcode takes one operand, the size of the stack.  This 
may be in hex or decimal, with no size postfix 

The 'ext' opcode takes one operand, the size of the extended RAM
area for the final file.  Operand as per the 'stack' opcode.

The 'dc' opcode deeclares initialised memory.  It takes a size postfix.  
It may take as many as 8 operands, all of which must be numbers, 
without postfix.  The dc.b opcode may also take a SINGLE string 
operand of the form 

dc.b "blah blah blah blah"

This is the only time an operand may include spaces.  Strings also 
support c-style \n sequences (only \n for now).

The 'ds' opcode declares uninitialised memory.  It takes a postfix.
It may only have one operand. This is the size of the area of memory
to reserve.  i.e. 'ds.l 400' reserves 400 longwords of memory.

Operands
--------

The operands for a glulx opcode have an addressing mode and a postfix
length.  They are coded as follows:

nnnnn.b     Absolute Number, byte
nnnnn.w     --------"------- word
nnnnn.l     --------"------- long
nnnnn				Absolute only, will attempt to get a 'best fit' optimisation
            of the value.  Use with caution.

(nnnnn).b   Indirect Memory Adress, byte
(nnnnn).w   -----------"----------- word
(nnnnn).l   -----------"----------- long

[nnnnn].b   Indirect RAM Address, byte
[nnnnn].w   ----------"---------- word
[nnnnn].l   ----------"---------- long

{nnnnn}.b   Call Frame Local, byte
{nnnnn}.w   ---------"------- word
{nnnnn}.l   ---------"------- long

(sp)        Indirect, off stack.  No length modifier.

~						Discard (null addressing mode).  No length modifier.

In the above, nnnnn may be replaced by either a hex number, a decimal
number, or a label.  Bear in mind that labels equate to the absolute
value of that label (except in RAM addressing mode, where they are the
absolute value minus Ramstart).

You can add an offset onto a label using the form :label:number where
number is the number of bytes further on.  This may or may not be useful.

Important other stuff
---------------------

Function headers must be constructed by hand.  See the attached
Hello.ula file for an example.  This must be carried out for the
:main label.  I might automate this in a later version.

The 'jump' operands, which take a relative offset to jump to,
will do fancy math on the offset for you.  But only if you specify
the operand in absolute addressing mode.  Any other addressing mode
will be ignored - the assembler assumes that you have calculated 
the addressing mode yourself.  Therefore, 

jump :mylocation.l

will compute the location of mylocation for you, but

jump (:mylocation).l

assumes that mylocation contains a precomputed offset.  Also, offsets
of 0 and 1 are special cases and will not be touched.

Calling the glk opcodes is hard at the moment.  You have to push
the arguments onto the stack and call the glk opcode. The 3rd
operand  must be in RAM or on the stack, as it is the return code 
of tHE GLK call, and must therefore be modifiable.
Again, see Hello.ula

Ah, yes.  What *are* the glk opcodes?  Two places to look.  One is
Zarf's site, which can be seen as the canonical reference.
http://www.eblong.com/zarf/glk, since you ask.  The other is to 
look in gi_dispa.c from your friendly local glk implementation.  
Don't got one of those?  You're buggered, then.

Other stuff
-----------

Use glulxdump.  It is useful.  Well, sort of.  It currently only
really understands inform-generated code, which is why some
stuff doesn't get disassembled.  I am working on a generic
disassembler based on glulxdump but it's not finished yet.
Maybe later, eh.

New to release 0.2 were files 'gass' and glkops.ula.
These provide new functionality - gass runs the cpp precompiler 
over the file, allowing the use of #define and #include.

glkops.ula is a file designed to be #include'd, which contains
#defines for all the glk operands and types.  You will still 
need to push the glk parameters onto the stack manually, but 
the call will look like this:

original call format for glk_window_open 

				copy 0x01.l (sp) 
				copy 0x03.l (sp) 
				copy 0x00.l (sp) 
				copy 0x00.l (sp) 
				copy 0x00.l (sp) 
				glk 0x23.b 0x05.b (:glk_winnum).l

new format 

				copy 0x01.l (sp) 
				copy wintype_TextBuffer (sp) 
				copy 0x00.l (sp) 
				copy 0x00.l (sp) 
				copy 0x00.l (sp) 
				glk_window_open 0x05.b (:glk_winnum).l

For the moment (this release), I have left the number of parameters
to be passed manual - i.e. you have to code it.  Next release will
incorporate the number of parameters (and possibly allow calls of the 
format 
'glk_window_open(blah,blah,blah,blah,blah) (result).l'

For a future release is a program to auto-generate glkops.ula from 
your friendly local gi_dispa.c.

Anyway.  Have fun.
