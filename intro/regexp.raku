my $reStr1 = "Random words";

if $reStr1 ~~ m/word/ { put "Found word"}; #
if $reStr1 ~~ m/\s/ { put "Found space"}; 

# \n is a new line
# \h is a horizontal tab
# \t is a tab
# \s is a space
# \d is a digit
# \w is a word character, number or underscore
# . is any single character
# + is one or more of the previous
# * is zero or more of the previous
# ? is zero or one of the previous

my @nA1 = (1,2,3,4);
if @nA1 ~~ m/2/ { put "Found 2"}; # find 2

my $reg1 = rx/ <[a..d 1 2 3]>* /; 
say "c e b 4" ~~ $reg1;
say @nA1 ~~ $reg1;

my @matches = "cat and cat" ~~ m:global/cat/; # find all cat
say @matches;
say +@matches;

my $regstr2 = "cat rat mat fat pat dog"; 
my @matches2 = $regstr2 ~~ m:global/\w+at/; # find all words with at
say @matches2;

my @matches3 = $regstr2 ~~ m:global:i/ <[crm]>+at/; #find all with crm & at
say @matches3;

my $regstr3 = "F.B.I I.R.S CIA";
say $regstr3 ~~ m:global/ .\..\.. /; # find all words with 3 letters in between

my $regstr4 = " 12 12345 123";
say $regstr4 ~~ m:global/ \d ** 5 /; # find all 5 digit numbers

my $regstr5 = "412-555-1212 88";
say $regstr5 ~~ m:global/ \d ** 3\- \d**3\-\d**4 /; # find all phone numbers

my $regstr6 = "cat cats";
say $regstr6 ~~ m:global/ <[cat]>+s? /; # find all cat or cats

my $regstr7 = "doctor doctors doctor's";
say $regstr7 ~~ m:global/ <[doctr]>+<['s]>* /; # find all doctors or doctors'

my $regstr8 = "abcd";
say $regstr8 ~~ m:global/ (a)bc(d) /; # find just a and d

my $regstr9 = "ab cb db";
say $regstr9 ~~ m:global/ [a | c] b /; # find ab or cb

my $regstr10 = "catacatcat";
say $regstr10 ~~ m:global/ c .* t/; #greedy
say $regstr10 ~~ m:global/ c .? t/; #non-greedy


