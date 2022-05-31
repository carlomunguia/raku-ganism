say (5 + 4).fmt("5 + 4 = %d"); # "5 + 4 = 9"
say (5 - 4).fmt("5 - 4 = %d"); # "5 - 4 = 1"
say (5 * 4).fmt("5 * 4 = %d"); # "5 * 4 = 20"
say (5 / 4).fmt("5 / 4 = %.2f"); # "5 / 4 = 1.25"
say (5 ** 4).fmt("5^4 = %d"); # "5^4 = 625"

say(1/4 + 1/2).fmt("1/4 + 1/2 = %.2f"); # "1/4 + 1/2 = 0.5"

say "Random: ", 20.rand.Int; # "Random: val"
say "Random Range : ", (5..20).rand.Int; # "Random Range : val"

my $floatNum = 1.1111111111111111111111111111111111111111111111111111;
my $floatNum2 = 1.2222222222222222222222222222222222222222222222222222;
say "Big Float : ", $floatNum + $floatNum2; # "Big Float : val"

say "(-1).abs = ", (-1).abs; #abs
say "1.exp = ", (1).exp; #exp
say "sqrt(9) = ", sqrt(9); #sqrt
say "log(2) = ", log(2); #log
say "log10(2) = ", log(100); #log10
say "round(2.45) = ", round(2.45); #round
say "floor(2.45) = ", floor(2.45); #floor
say "ceiling(2.45) = ", ceiling(2.45); #ceiling

say "sin(0) = ", sin(0); #sin
say "cos(0) = ", cos(0); #cos
say "tan(0) = ", tan(0); #tan
say "asin(0) = ", asin(0); #asin
say "acos(0) = ", acos(0); #acos
say "atan(0) = ", atan(0); #atan
say "cotan(0) = ", cotan(0); #cotan
say "acotan(0) = ", acotan(0); #acotan
say "sinh(0) = ", sinh(0); #sinh



