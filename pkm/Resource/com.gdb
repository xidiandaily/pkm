shell rm before.cmp
shell rm after.cmp
shell rm temp.cmp
set logging on before.cmp
info registers
set logging off before.cmp
set logging on temp.cmp
print $ebp
x/30xw $esp
set logging off temp.cmp
shell perl getstack.pl < temp.cmp>>before.cmp
shell rm temp.cmp
si
set logging on after.cmp
info registers
set logging off after.cmp
set logging on temp.cmp
print $ebp
x/30xw $esp
set logging off temp.cmp
shell perl getstack.pl < temp.cmp>>after.cmp
