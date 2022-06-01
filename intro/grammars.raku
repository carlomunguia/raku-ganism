grammar Number {
    token TOP { \-? \d+ [\. \d+]? }
}

for <1 23 -456 2.35> -> $num {
    say Number.parse($num);
}

grammar Number2 {
    token TOP {
        <sign>?<value>

    }
    token sign {
        '-'
    }
    token number {
        \d+
    }
    token value {
        | <number>
        | "." <number>
        | <number> "."
        | <number> "." <number>
    }
}

for <1 23 -456 2.35> -> $num {
    say Number2.parse($num);
}
