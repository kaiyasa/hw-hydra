


start
  = _ Chip Body _

Chip
  = 'CHIP' ws Id

Body
  = COpen Declarations Implementation CClose

Declarations
  = InDeclaration+
  / OutDeclaration+

InDeclaration
  = In ConnectionList

OutDeclaration
  = Out ConnectionList

ConnectionList
  = Interface (Comma Interface)* End

Interface
  = Id BusInterface
  / Id

BusInterface
  = BOpen Integer BClose

Implementation
  = Parts Components*

Components
  = Id POpen ComponentConnectionList PClose End

ComponentConnectionList
  = ComponentConnection (Comma ComponentConnection)*

ComponentConnection
  = Reference Equals Reference

Reference
  = Id BOpen BusReference BClose
  / Id

BusReference
  = Integer
  / Integer _ '..' Integer
  / IntegerList

IntegerList
  = Integer (Comma Integer)*

In      = _ 'IN' ws

Parts   = _ 'PARTS' _ ':'

Out     = _ 'OUT' ws

Equals  = _ '='

Comma   = _ ','

End     = _ ';'

POpen   = _ '('

PClose  = _ ')'

COpen   = _ '{'

CClose  = _ '}'

BOpen   = _ '['

BClose  = _ ']'

Id      = _ text:[A-Za-z_][A-Za-z0-9_]* { return text; }

Integer = _ text:[0-9]+ { return parseInt(text, 10); }

_  = [ \n\r\t]*

ws = [ \n\r\t]+
