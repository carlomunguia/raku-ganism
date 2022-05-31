#Conditional Operators > < > <= >= == !=
#Logical Operators : && and, || or, ! not

my $age = 12;

# simple if statement
if $age >= 5 && $age <= 6 {
    put "Go to Kindergarten\n";
} elsif 7 <= $age <= 13 {
    put "Go to Middle School\n";
} elsif $age >= 14 && $age <= 18 {
    put "Go to High School\n";
} else {
    put "Go to College\n";
}

# put conditionals in a string
put "Old enough for school" if $age >= 5;

#unless
my $k = 0;
unless $k == 5 {
    put $k;
}

# ternary operators
put "Can vote : ", $age >= 18 ?? 'True' !! 'False';