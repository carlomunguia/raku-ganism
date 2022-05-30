use v6;

say "Tournament Results:\n";

my $file = open 'scores.txt';

my %matches;
my %sets;

for $file.lines -> $line {
    next unless $line;

    my ($pairing, $result) = $line.split(' | ');
    my ($p1, $p2) = $pairing.words;
    my ($r1, $r2) = $result.split(':');

    %sets{$p1} += $r1;
    %sets{$p2} += $r2;

    if $r1 > $r2 {
        %matches{$p1}++;
    } else {
        %matches{$p2}++;
    }
}

my @sorted = %sets.keys.sort({ %sets{$_} }).sort({ %matches{$_} }).reverse;

for @sorted -> $n {
    my $match-noun = %matches{$n} == 1 ?? 'match' !! 'matches';
    my $set-noun = %sets{$n} == 1 ?? 'set' !! 'sets';
    say "$n has won %matches{$n} $match-noun and %sets{$n} $set-noun";
}