use v6;

sub roll-dice { (1..6).roll($^rolls) };

sub round {
    my @roll = roll-dice(5);
    my $rolls = 1;
    repeat {
        say "Dice: { @roll }";
        my @dice = prompt("Which dice do you want to roll again (1-5)? ").split(/\s+/);
        if @dice[0] eq "" {
            $rolls = 3;
        }
        else {
            @roll[map { $^index - 1 }, @dice] = roll-dice(@dice.elems);
            $rolls++;
        }

    } until $rolls == 3;
    say "Which box?";
    map { say $^a.key ~ ".\t" ~ $^a.value }, (1 => 'Aces'), (2 => 'Twos');
    if @roll[0] == 1 {
        say "ACES it is"
    }
    else {
        say "TWOS it is"
    }
    return @roll;
}

my @round = round;