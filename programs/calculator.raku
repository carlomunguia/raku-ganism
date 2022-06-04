grammar calc {
    rule TOP {
        <value> <operator> <value> {
            given $<operator> {
                when '+' {say $<value>[0] + $<value>[1]}
                when '-' {say $<value>[0] - $<value>[1]}
                when '*' {say $<value>[0] * $<value>[1]}
                when '/' {say $<value>[0] / $<value>[1]}
            }
        }
    }
    token value {
        '-'?\d+ [ '.' \d+]?
    }
    token operator {
        '+' | '-' | '*' | '/'
    }
}

my $expression = "14 * 16.2";
calc.parse($expression);