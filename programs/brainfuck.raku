my $program = $*IN.slurp;
brainfuck($program);

sub brainfuck($program) {
    my @program = $program.comb('');
    my $program_pointer = 0;
    my @data_memory;
    my $data_pointer = 0;

    while $program_pointer < @program.elems {
        given @program[$program_pointer] {
            when '>' {$data_pointer++}
            when '<' {$data_pointer--}
            when '+' {@data_memory[$data_pointer]++}
            when '-' {@data_memory[$data_pointer]--}
            when '.' {
                print @data_memory[$data_pointer].chr
            }
            when '[' {
                $program_pointer = _move_forward(@program, $program_pointer)
                    unless @data_memory[$data_pointer];
            }
            when ']' {
                $program_pointer = _move_back(@program, $program_pointer)
                    if @data_memory[$data_pointer];
            }
        }
        $program_pointer++;
    }
}

sub _move_back(@program, $program_pointer is copy) {
    my $level = 1;
    while $level && $program_pointer >= 0 {
        $program_pointer--;
        given @program[$program_pointer] {
            when '[' {$level--}
            when ']' {$level++}
        }
    }
    return $program_pointer - 1;
}

sub _move_forward(@program, $program_pointer is copy) {
    my $level = 1;
    while $level && $program_pointer < @program.elems {
        $program_pointer++;
        given @program[$program_pointer] {
            when '[' {$level++}
            when ']' {$level--}
        }
    }
    return $program_pointer - 1;
}