#list
my $l1 = List.new: 1, 2, 3; # [1, 2, 3]
my @l2 = (1, 2, 3); # [1, 2, 3]

say $l1.elems; # 3
say @l2.elems; # 3

#arrays
my @l3 = <Carlo Angela Peter Roberto>;
say @l3.elems; # 4

put @l3[0]; # Carlo
put @l3[0, 1]; # [Carlo, Angela]
@l3[2] = 'Pam'; # [Carlo, Angela, Pam]
put @l3.shift; # Carlo
@l3.unshift: <Peter Roberto>; # [Peter, Roberto, Carlo, Angela, Pam]
put @l3.pop; # Pam
@l3.push: <Zack>; # [Peter, Roberto, Carlo, Angela, Zack]

@l3.splice: 0, 2; # [Peter, Roberto]
say "Pam :", @l3.grep("Pam"); # [Pam]
say "Evens :", (1..10).grep: { $_ %% 2 }; # [2, 4, 6, 8, 10]

say sort @l3; 
my $l4 = (<1 2>, <3 4>); # [1, 2, 3, 4]
say "00 : ", $l4[0][0]; # 1

say zip(<a b>, <1 2>); # [a, 1, b, 2]

my ($val2, $val3) = <a b>;
my $l5 = <<$val2 $val3>>;

put $l5.join(','); # a,b

my $str4 = "a b c d"; # a b c d
my $l6 = $str4.words; # [a, b, c, d]
put $l6; # a b c d
put $l6.reverse;


