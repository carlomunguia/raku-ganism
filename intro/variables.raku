#You can define type or not
# Common types: Bool, Int, Num, Str, Date, Time, DateTime, ArrayRef, HashRef, CodeRef, RegexpRef, GlobRef, Undef, ScalarRef, Object, ClassName, Ref, and more.

# my Int $x;
# $x = "Dog";
#Nah this isn't allowed

my $y = 6;
$y = "Dog";
#This totally works

my $z := $y; #bind
put $z;
#This is also allowed

my Bool $can-vote = True;
put $can-vote;
#boolean

my $thousand = 1e3;
put "10: ", 10.^name; #10^name is the exponent operator & int
put "10.5 : ", (10.5).^name; #10.5 is a float (rational)
put "10 : ", "10".^name; #10 is a string

say '65'.chr; #65 is the ascii code for A
say "Type : ", (10.Str).^name; #10 is a string
say "Type : ", (+"123").^name; #123 is a integer
say "1 + 2 = ", "1" + 2;
