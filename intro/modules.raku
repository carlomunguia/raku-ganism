use HTTP::UserAgent; # for LWP::UserAgent

my $uA = HTTP::UserAgent.new; 

$uA.timeout = 10;
my $url = "https://carlomunguia.com";
my $response = $uA.get($url);
my $dw;
if $response.is-success {
    $dw = $response.content;
}
else {
    say "Error: {$response.status_line}";
    exit;
}

for $dw.lines(10) -> $text {
    say $text;
}