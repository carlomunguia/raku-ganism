#promises

my $p1 = Promise.new; #creates a new promise 
say $p1.status; #PLANNED
$p1.keep('Result'); #keeps the result of the promise
say $p1.status; #KEPT
say $p1.result; #RESULT

# my $p2 = Promise.new;
# $p2.break('Dang....'); #breaks the promise
# say $p2.status; #BROKEN
# say $p2.result; #Dang....
# CATCH { default { say .^name, ": ", .Str} }; #prints the exception Dang...

my $promise1 = Promise.new();
my $promise2 = $promise1.then(
    -> $v { say $v.result; "Second Result" }
);
$promise1.keep("First Result");
say $promise2.result; 

my $promise3 = Promise.start(
    { my $i = 0; for 1..10 { $i += $_}; $i}
);
say $promise3.result;

my $promise4 = start {
    my $i = 0;
    for 1..10 {
        $i += $_;
    }
    $i;
};
my $result = await $promise4;
say $result;

my @promises;

# for 1..5 -> $t {
#     push @promises, start {
#         sleep $t;
#         Bool.pick;
#     };
# }
# say await Promise.allof(@promises).then({ so all (@promises>>.result) });

sub get_promise {
    my $promise = Promise.new();
    my $vow = $promise.vow;
    Promise.in(10).then({$vow.keep});
    $promise;
}

my $promise5 = get_promise();
# $promise5.keep;

#suppliers

my $supplier = Supplier.new;
my $supply = $supplier.Supply;

$supply.tap( -> $v { say $v });

for 1..10 {
    $supplier.emit($_);
}

my $supplier2 = Supplier.new;
my $supply2 = $supplier2.Supply;

my $tap2 = $supply2.tap( -> $v { say $v });

$supplier2.emit("Ok");
$tap2.close;
$supplier2.emit("Won't trigger the tap");

my $bread-supplier = Supplier.new;
my $veggie-supplier = Supplier.new;

my $supply3 = supply {
    whenever $bread-supplier.Supply {
        emit("WE GOT THE BREAD!!! WOOOOOO: " ~ $_);
    };
    whenever $veggie-supplier.Supply {
        emit("WE GOT THE VEGGIE!!! WOOOOOO: " ~ $_);
    };
}

$supply3.tap( -> $v { say $v });
$veggie-supplier.emit("Rhubarb");
$bread-supplier.emit("Dutch Potato Roll");    

#reactive

react {
    whenever Supply.interval(2) -> $v {
        say $v;
        done() if $v == 4;
    };
}

#channels

my $channel = Channel.new;
await (^10).map: -> $r {
    start {
        sleep $r;
        $channel.send($r);
    }
}
$channel.close;
for $channel.list -> $r {
    say $r;
}

my $c = Channel.new;

^3 .map: -> $v {
    start {
        sleep 3 - $v;
        $c.send: "$v from thread {$*THREAD.id}";
    }
}

Promise.in(3).then: { $c.close };

my $is-closed = $c.closed;
loop {
    if $c.poll -> $item {
        say "$item received after {now - INIT now} seconds";
    } elsif $is-closed {
        last;
    }

    say 'Doing unrelated things...';
    sleep .6;
}

