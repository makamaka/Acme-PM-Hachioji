use strict;
use warnings;

use Test::More;
use Acme::PM::Hachioji;

my $meetings = Acme::PM::Hachioji->meetings;

isa_ok( $meetings, 'Acme::PM::Hachioji::Meetings' );

done_testing();
