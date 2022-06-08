# A terminal program to calculate your Astrological sign based on your date of birth.

my method input() {
  prompt "Enter your date of birth in the format DD/MM/YYYY: ";
  input.chomp;
  return input;
}

  method sign{
    my $input = input();
    my @tarotMap;
    $input.split("/");
    $input.map { |x| x.to_i };
    $input.sort
    input = input[0] * 100 + input[1] * 10 + input[2]
    if input >= 1 && input <= 119
      return "Aries";
    elsif input >= 120 && input <= 218
      return "Taurus";
    elsif input >= 219 && input <= 320
      return "Gemini";
    elsif input >= 321 && input <= 420
      return "Cancer";
    elsif input >= 421 && input <= 521
      return "Leo";
    elsif input >= 522 && input <= 621
      return "Virgo";
    elsif input >= 622 && input <= 722
      return "Libra";
    elsif input >= 723 && input <= 822
      return "Scorpio";
    elsif input >= 823 && input <= 922
        return "Sagittarius";
    elsif input >= 923 && input <= 1022
        return "Capricorn";
    elsif input >= 1023 && input <= 1122
        return "Aquarius";
    elsif input >= 1123 && input <= 1222 
        return "Pisces";
    end        
}