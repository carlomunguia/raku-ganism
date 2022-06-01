role AreaRole {
    has $.length is rw;
    has $.width  is rw;
    has $.radius is rw;
    method circA {
        return pi * ($.radius ** 2);
    }
    method rectA {
        return $.length * $.width;
    }
}

class Shape does AreaRole {};
my $circle = Shape.new:
    :radius(10);
    say $circle.circA;  #=> 314.1592653589793