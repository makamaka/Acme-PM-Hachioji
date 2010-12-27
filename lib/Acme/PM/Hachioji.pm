package Acme::PM::Hachioji;

use strict;
use warnings;

our $VERSION = '201012.27';

sub meetings {
    require Acme::PM::Hachioji::Meetings;
    Acme::PM::Hachioji::Meetings->new( @_ );
}


1;
__END__

=pod

=head1 NAME

Acme::PM::Hachioji - Hachioji.pm in Japan

=head1 SYNOPSIS

 $ perldoc Acme::PM::Hachioji;
 
 # -----
 
 my $meetings = Acme::PM::Hachioji->meetings;
 
 while ( my $meeting = $meetings->previous ) {
    print $meeting->ymd, "\n";
 }
 
 while ( my $meeting = $meetings->next ) {
     print $meeting->ymd, "\n";
 }
 
 my $today = DateTime->new( year => 2010, month => 12, day => 24 );
 my $datetime;
 
 $datetime = $meetings->days->previous( $today );
 $datetime = $meetings->days->next( $today );


=head1 DESCRIPTION

Hachioji.pmの活動報告とかなんかじゃないのかしら？

=head1 METHODS

=head2 meetings

  $meetings = Acme::PM::Hachioji->meetings;

Returns L<Acme::PM::Hachioji::Meetings>.

=head1 SEE ALSO

L<Acme::PM::Hachioji::Meetings>

=head1 AUTHOR

Makamaka Hannyaharamitu, E<lt>makamaka[at]cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010 by Makamaka Hannyaharamitu

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

