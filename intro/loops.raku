loop (my $i = 1; $i < 20; $i++) { #loop through the first 20 iterations
    if $i mod 2 == 0 { #if the iteration is even
        put $i; #print the iteration
        next; #skip to the next iteration
    }
    if $i >= 10 { # if the iteration is greater than or equal to 10
        last; #stop the loop
    }
} 

loop {
    state $j = 0; #initialize the state variable
    put $j++; #increment the state variable
    last if $j == 5; #stop the loop if the state variable is 5
}

my $i1 = 0;
while $i1 < 5 { #while the state variable is less than 5
    put $i1++;

}

repeat while $i1 < 5 { #repeat the loop while the state variable is less than 5
    put $i1++;
}

loop {
    state $k = 0;
    put $k++;
    last if $k == 5;

    FIRST {say "starting"}; #phaser 
    LAST {say "ending"}; #phaser 2
}

#for loops 
my @l3 = <Carlo Angela Peter Roberto>;
for @l3 {
    say "$_";
}

for @l3 -> $x, $y { # $x is the index, $y is the value
    say "$x, $y";
}

for @l3.kv -> $index, $item { # grab key and value
    say "index: $index, item: $item"; # index: 0, item: Peter
}

#blocks

my $sayHello := {say "Hello $_"}; #create a block
$sayHello("Carlo");

my $addNums := {$^a + $^b}; #create a block with math
say $addNums(1,2);

my $plus2 = * + 2; #create a block with a function
say $plus2(5);

subset EvenInt of Int where {$^a mod 2 == 0}; #subset of integers that are even
my EvenInt $eVal = 5; # this will fail
say $eVal; # and it does lol

