#sub name (argument)

sub addNums2($a = 1, $b = 1) { #default values
    return $a + $b;
}

say "1 + 3 = ", addNums2(1,3); #4

sub giveMe($arg?) {
    return $arg;
}

say giveMe();
say giveMe(1); #1

my &sub1 = &addNums2;
say &sub1(1,2); #3

sub addNums3(*@nums) { #* is a slurpee operator
    state $sum = 0;
    for @nums -> $num {
        $sum = $sum + $num;
    }
    return $sum;
}

say "Sum : ", addNums3 1, 2, 3, 4;

sub nextTwo($a) { 
    return $a + 1, $a + 2;
}

say nextTwo(1);

sub square($a) { $a * $a }; #square function
my @squareList = map &square, 1..5;
say join ', ', @squareList;

sub factorial($a) { #factorial function
    if ($a == 1) {
        return 1;
    } else {
        return $a * factorial($a - 1);
    }
}

say factorial(4);

