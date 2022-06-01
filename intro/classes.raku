class Animal { # class of Animals
    has $!name = ''; # name of the animal
    has Real $.height is rw = 0.0;
    has $.weight is rw = 0.0;
    method BUILD(:$name!, :$height, :$weight) { # BUILD method
        $!name = $name;
        if $height {
            $!height = $height;
        } else {
            $.height = 0.0;
        }
        if $weight {
            $.weight = $weight;
        } else {
            $.weight = 0.0;
        }
    }
    method name { $!name; } # getter
    method info { # info method
        return "{self.name} is {self.height} cm tall and weighs {self.weight} kg";
    }
    method makeSound { !!! } # abstract method
}

my $paco = Animal.new: # create a new Animal
    :name<Paco>,
    :height<66>,
    :weight<50>;

say $paco.name;
$paco.height = 63;
$paco.weight = 45;
say $paco.info;    # Paco is 63 cm tall and weighs 45 kg

class Dog is Animal {
    has $.sound is rw = "Woof!";
    method info {
        my $origMsg = callsame;
        return $origMsg ~ " and says {self.sound} "
    }
    method makeSound {
        return self.sound;
    }
}

my $carlo = Dog.new:
    :name<Carlo>,
    :height<77>,
    :weight<50>,
    :sound<Arf!>;
say $carlo.name;
say $carlo.weight;
say $carlo.info;    # Carlo is 77 cm tall and weighs 50 kg and says Arf!    