try { #try / catch with exception
    my $and = (10 %% 0);
    die 'Evil Stuff';

    CATCH {
        when X::Numeric::DivideByZero {
            say "Error : $_";
        }
        default {
            say "Default : $_";
        }
    }
}