// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//
//  r2 = 0
//  i = r0
//  while (i-- != 0)
//      r3 += r1
//

@R2      // R2 = 0
M=0

@R0      // i = R0
D=M
@i
M=D

(loop)
  @end   // if i == 0 goto end
  D;JEQ

  @R1    // R2 += R1
  D=M
  @R2
  M=D+M

  @i     // D = --i
  M=M-1
  D=M

  @loop  // goto loop
  0;JMP

(end)
  @end
  0;JMP
