my $str1 = "Hello"; # string
say "$str1"; # Hello
say "I like \"quotes\""; # I like "quotes"
say "Num: ", $str1.chars; # Num: 5
say "Has Value: ", ?$str1; # Has Value: True
say Q/$str1 is ok here/; # "Hello is ok here"

say '$str1 is ok here'; # $str1 is ok here

say "one " ~ "string";

my $str2 = join "  ", "a", "long", "string";
say $str2; # a  long  string 

my $str3 = q :heredoc/END/; # heredoc
I 
go 
for 
many
lines
END
say $str3; # I go for many lines

say "Long? ", $str2.fc.contains("long"); # Long? True
say "Long? ", $str2.fc.contains("long", :i); # Long? True

my $sI = $str2.index("long"); # 2
say $str2.substr: $sI, 5; # long
say "Bye whitespace : ", "              lol        ".trim; # Bye whitespace : lol
say "ABC".lc; # lowercase
say "abc".uc; # uppercase
say "abc".tclc; #first letter uppercase

say "Dog".lc eq "dog"; # true
say "GT : ", "abc" gt "d"; # GT : true
say "abc".chop; # ab
say "abc\n".chomp; # abc sans new line

#interpolation
say "{$str1}, Carlo"; # Hello, Carlo
say "5 * 4 = {5 * 4}"; # 5 * 4 = 20
say q :c "1 : 2 = {1+2}";  # 1 : 2 = 3
say "\x[40]"; # @
say $str1 x 5; # HelloHelloHelloHelloHello

#split & regex intro
say split(',', "a,b,c"); # a b c
say split(/<[;,]>/, "a,b;c"); # a b c
say "a b c".split: /\s/;
my $str5 = "Carlo is terrible";
put $str5.subst: /terrible/, "acceptable", :g;  # Carlo is acceptable
