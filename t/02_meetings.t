use strict;
use warnings;

use Test::More;
use Acme::PM::Hachioji::Meetings;

my $meetings = Acme::PM::Hachioji::Meetings->new();
my $a_day    = DateTime->new( year => 2010, month => 12, day => 24 );

isa_ok( $meetings, 'Acme::PM::Hachioji::Meetings' );
isa_ok( $meetings->days, 'DateTime::Set' );

is( $meetings->days->previous( $a_day )->ymd, '2010-12-11', 'previous' );
is( $meetings->days->next( $a_day )->ymd,     '2011-01-22', 'next' );

$meetings->current_day( $a_day );

diag( 'previous' );

while ( my $meeting = $meetings->previous ) {
    isa_ok( $meeting, 'DateTime', $meeting->ymd );
}

$meetings->current_day( $a_day );

diag( 'next' );

while ( my $meeting = $meetings->next ) {
    isa_ok( $meeting, 'DateTime', $meeting->ymd  );
}


done_testing();
