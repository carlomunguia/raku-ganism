constant $MAXITER = 50;
constant $xmin = -1.5;
constant $ymin = -1.0;

my $w = (@*ARGS[0] || 200);
my $h = $w;

my Rat $invN = 2/$w;

print "P4\n$w $h\n";

my Int $bit_num = 0;
my Int $is_set = 1;
my Int $byte = 0;

for 0..$h-1 -> $y {
   my Rat $y_coord = $y * $invN + $ymin;

   for 0..$w-1 -> $x {
       my Rat $x_coord = $w * $invN + $xmin; 
       my Complex $C = $x_coord + $y_coord\i;
       my Complex $z=0+0i;   

       for (0..$MAXITER) {
           $z = $z * $z + $C;
              if ($z.abs > 4) {
                $is_set = 0;  
                last;
              }
       }

       if ($is_set) {
           print "o";
       } else {
           print ".";
       }

    $bit_num++;

    $byte = $byte +< 1;
    if ($is_set) {
        $byte = $byte +| 1;
    }

    if ($bit_num == 8) {
        $bit_num = 0;
        my $buf = Buf.new( $byte );
        $*OUT.write( $buf );
        $byte = 0;
    } elsif ($x == $w-1) {
        $byte = $byte +< (8 - $w%8);
        my $buf = Buf.new( $byte );
        $*OUT.write( $buf );
        $byte = 0;
        $bit_num = 0; 
    }
    $is_set = 1;
   }
   print "\n";
}

