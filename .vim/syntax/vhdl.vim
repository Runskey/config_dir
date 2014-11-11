" Vim syntax file
" Language:	picoVHD
" Maintainer:	Lin Yang <liny@picochip.com>
" $Id: picoVHD.vim,v 1.1 2010/04/13 15:34:56 vimboss Exp $

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" case is not significant
"syn case ignore

" picoVHD keywords
syn keyword vhdlStatement abs accumulators ADVANCED aligned all AP architecture array ASM asmunit
syn keyword vhdlStatement begin BEHAVIOURAL blocking
syn keyword vhdlStatement C C_DECL call CODE code_partition commport constant
syn keyword vhdlStatement downto
syn keyword vhdlStatement else elsif end ENDCODE entity EQ EQUAL error_mask exit external
syn keyword vhdlStatement for FP function
syn keyword vhdlStatement GE generate generic GREATERQEUAL 
syn keyword vhdlStatement HIGHERSAME HS
syn keyword vhdlStatement if im in initialize is LESSTHAN library LO loop LOWER LR LT
syn keyword vhdlStatement macro map memory mod
syn keyword vhdlStatement nand NE next nonblocking NONZERO nor not NOTEQUAL
syn keyword vhdlStatement of open others out
syn keyword vhdlStatement package port
syn keyword vhdlStatement re register regs rem rol ror
syn keyword vhdlStatement signal SIM_CASE SIM_CLOCK SIM_CONSTRUCTOR SIM_DATA SIM_DESTRUCTOR SIM_END 
syn keyword vhdlStatement SIM_HEADER SIM_START SIM_STATE SIM_TOP sla sll sra srl STRUCTURAL
syn keyword vhdlStatement then to type 
syn keyword vhdlStatement use
syn keyword vhdlStatement variable
syn keyword vhdlStatement when while
syn keyword vhdlStatement xnor
syn keyword vhdlStatement ZERO
syn match   vhdlStatement "and[ 	]"
syn match   vhdlStatement "or[ 	]"
syn match   vhdlStatement "xor[ 	]"

" Special match for "if" and "else" since "else if" shouldn't be highlighted.
" The right keyword is "elsif"
syn match   vhdlStatement "\<\(if\|else\)\>"
syn match   vhdlNone      "\<else\s\+if\>$"
syn match   vhdlNone      "\<else\s\+if\>\s"

" Predifined picoVHD types
syn keyword vhdlType integer integer8 integer16 integer32 integer64
syn keyword vhdlType complex complex8 complex16 complex32 complex64
syn keyword vhdlType integer8quad integer16pair complex8pair
syn keyword vhdlType integer8pair_complex8 integer16_complex8 integer16_integer8pair
syn keyword vhdlType string real

" for this vector values case is significant
syn case match
" Values for standard VHDL types
syn match vhdlVector "\'[0L1HXWZU\-\?]\'"
" Values for non standard VHDL types qsim_12state for Mentor Graphics Sys1076/QuickHDL
syn keyword vhdlVector S0S S1S SXS S0R S1R SXR S0Z S1Z SXZ S0I S1I SXI
syn case ignore

syn match  vhdlVector "B\"[01_]\+\""
syn match  vhdlVector "O\"[0-7_]\+\""
syn match  vhdlVector "X\"[0-9a-f_]\+\""
syn match  vhdlCharacter "'.'"
syn region vhdlString start=+"+  end=+"+

" label
syn match vhdlLabel "*:*\$"

" floating numbers
syn match vhdlNumber "-\=\<\d\+\.\d\+\(E[+\-]\=\d\+\)\>"
syn match vhdlNumber "-\=\<\d\+\.\d\+\>"
syn match vhdlNumber "0*2#[01_]\+\.[01_]\+#\(E[+\-]\=\d\+\)\="
syn match vhdlNumber "0*16#[0-9a-f_]\+\.[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="
" integer numbers
syn match vhdlNumber "-\=\<\d\+\(E[+\-]\=\d\+\)\>"
syn match vhdlNumber "-\=\<\d\+\>"
syn match vhdlNumber "0*2#[01_]\+#\(E[+\-]\=\d\+\)\="
syn match vhdlNumber "0*16#[0-9a-f_]\+#\(E[+\-]\=\d\+\)\="

" operators
syn keyword vhdlOperator add.0 addc.0 and.0 asr.0 copy.0 copysw.0 lsr.0 lsl.0 or.0 sub.0 subb.0
syn keyword vhdlOperator xor.0 adds adds8 asls brev byteswap cmpsn cmpsp copyeq copyne divstep
syn keyword vhdlOperator halt nop nopn rolc sbc subs subs8 tstport

syn keyword vhdlOperator add.1 addc.1 and.1 asr.1 copy.1 copysw.1 lsr.1 lsl.1 or.1 sub.1
syn keyword vhdlOperator subb.1 xor.1 put get ldb ldl ldw stb stl stw

syn keyword vhdlOperator beq bge bhs bl blo blt bmi bne bra bvs jl jr jmpeq jmpge jmphs jmpl jmplo
syn keyword vhdlOperator jmplt jmpne jmpra mac mac8 macsu msub msub8 mul mul8 muluu readacc
syn keyword vhdlOperator readacc32 readmac readmacsu readmsub readmul readmuluu readshmac readshmacsu
syn keyword vhdlOperator shmac shmacsu mulh mull muluh mulul bitmul cdsprd csprd csprdb

syn match   vhdlOperator "[&><=:+\-*\/|]"
syn match   vhdlOperator "add.[01]"
syn match   vhdlOperator "addc.[01][ 	]"
syn match   vhdlOperator "and.[01][ 	]"
syn match   vhdlOperator "asr.[01][ 	]"
syn match   vhdlOperator "copy.[01][ 	]"
syn match   vhdlOperator "copysw.[01][ 	]"
syn match   vhdlOperator "lsr.[01][ 	]"
syn match   vhdlOperator "lsl.[01][ 	]"
syn match   vhdlOperator "or.[01][ 	]"
syn match   vhdlOperator "sub.[01][ 	]"
syn match   vhdlOperator "subb.[01][ 	]"
syn match   vhdlOperator "xor.[01][ 	]"

syn match   vhdlSpecial  "[().,;]"

syn match vhdlComment "--.*$"
syn match vhdlComment "//.*$"

" syn match vhdlGlobal "[\'$#~!%@?\^\[\]{}\\]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vhdl_syntax_inits")
  if version < 508
    let did_vhdl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cDefine       PreProc
  HiLink vhdlSpecial   Special
  HiLink vhdlStatement Statement
  HiLink vhdlCharacter String
  HiLink vhdlString    String
  HiLink vhdlVector    String
  HiLink vhdlBoolean   String
  HiLink vhdlComment   Comment
  HiLink vhdlNumber    String
  HiLink vhdlTime      String
  HiLink vhdlType      Type
  HiLink vhdlOperator  Type
  HiLink vhdlGlobal    Error
  HiLink vhdlAttribute Type
  HiLink vhdlLabel     String

  delcommand HiLink
endif

let b:current_syntax = "picoVHD"

" vim: ts=8
