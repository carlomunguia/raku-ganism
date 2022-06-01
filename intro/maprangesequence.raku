#maps

my @l7 = 1,2,3;
my @map1 = map {$_ * 2}, @l7; # [2, 4, 6]
say @map1;

my @l8 = 4,5,6;
say @l7 <<+>> @l8; # [5, 7, 9] - hyper operator!!!

my $japaneseFam = Map.new:
    'Dad', 'Otousan',
    'Mom', 'Okaasan',
    'Son', 'Oniisan',
    'Daughter', 'Onnaisan';
say $japaneseFam<Dad>; # Otousan

say $japaneseFam{'Mom'}:exists; # True
for $japaneseFam.kv -> $key, $item {
    put "$key => $item";
}
#ranges

my $r1 = 1..5; # 1..5
my $r1l = $r1.list; # [1, 2, 3, 4, 5]
my $r2 = 1 ^..5; # 1, 3, 5
my $r3 = 1 ..^5; # 1, 2, 3, 4

# sequences

my $seq1 := 1 ... 100; # 1, 2, 3, ..., 99, 100
my $seq2 := 10 ... 1; # 10, 9, 8, ..., 2, 1

my $fib := 0, 1, -> $a, $b { $a + $b } ... *; 
put $fib[^10].join(','); # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

put "Lazy : ", $fib.is-lazy; # Lazy : True

#sets

my $mySet = set(1,2,3,3);
say $mySet;

#hashes

my $japaneseColor = Hash.new:
'Blue', 'Aoo',
'Red', 'Aka',
'Green', 'Midori';

$japaneseColor<Blue> = 'Ao';

$japaneseColor<Blue>:delete;

$japaneseColor<White> = "Shiro";
for $japaneseColor.kv -> $key, $item {
    put "$key => $item";
}

