my $f1 = open "mydata", :w;

$f1.print("file stuff\n");
my $myName = "Angela";
$f1.print("My name is %s\n", $myName);
$f1.close();

spurt "mydata", "stuff\n", :append;

my $f2 = open "mydata", :r;

my $myData = $f2.slurp;
say $myData;
$f2.close;

if "mydata".IO.e {
    say "Exists";    
}

say "mydata".IO.modified.DateTime;
say "mydata".IO.accessed.DateTime;
say "mydata".IO.s;

rename "mydata", "mydata2";
copy "mydata2", "mydataBU";
mkdir "Raku Stuff";
say "Raku Stuff".IO.d;
say dir;
rmdir "Raku Stuff" or die "$1";
shell('ls -l');
my $shellOp = Q:x{ls - l};
say $shellOp;
