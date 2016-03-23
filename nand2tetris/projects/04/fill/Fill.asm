// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(INIT)
  @last      // last = 0
  M=0
  @BLANK     // goto BLANK
  0;JMP

(POLL)
  @KBD       // tmp = KBD
  D=M
  @tmp
  M=D

  @last     // if ((last - tmp) == 0)
  D=M-D

  @POLL     // goto POLL
  D;JEQ

  @tmp      // last = tmp
  D=M
  @last
  M=D

  @BLANK    // if (last == 0) goto BLANK
  D;JEQ

  @FILL     // goto FILL
  0;JMP


(FILL)
  @8192     // D=8192
  D=A

(FLOOP)
  D=D-1
  @SCREEN   // SCREEN[D] = -1 (0xFFFF)
  A=D+A
  M=-1

  @POLL
  D;JEQ

  @FLOOP
  0;JMP
  

(BLANK)
  @8192
  D=A

(BLOOP)
  D=D-1
  @SCREEN
  A=D+A
  M=0

  @POLL
  D;JEQ

  @BLOOP
  0;JMP
