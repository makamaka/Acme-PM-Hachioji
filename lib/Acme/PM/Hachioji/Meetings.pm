package Acme::PM::Hachioji::Meetings;

use strict;
use warnings;
use DateTime::Set;

our $VERSION = '201012.24';

my @MEETINGS = (
#    [2010, 1 , 11, 18, 0],
    [2010, 12, 11, 18, 0],
#    [2011, 1, 11, 18, 0],
);
my $TZ = 'Asia/Tokyo';


my $Set = _init_datetime_set();


sub new {
    my $self = bless {
        meetings => $Set->iterator,
    }, shift;

    $self->current_day();

    return $self;
}


sub days { $Set; }


sub current_day {
    my ( $self, $datetime ) = @_;
    $self->{ _idx } = $datetime ? $datetime : DateTime->now();
}


sub meetings {
    my ( $self, @args ) = @_;
    $Set->iterator( @args );
}


sub previous {
    my ( $self, @args ) = @_;
    my $datetime = $self->days->previous( $self->{ _idx } );

    return unless $datetime;

    $self->{ _idx } = $datetime;

    return $datetime;
#    $self->{ meetings }->previous( @args );
}


sub next {
    my ( $self, @args ) = @_;
    my $datetime = $self->days->next( $self->{ _idx } );

    return unless $datetime;

    $self->{ _idx } = $datetime;

    return $datetime;
    #    $self->{ meetings }->next( @args );
}

sub reset { shift->{ meetings } = $Set->iterator; }


sub _init_datetime_set {
    my @datetimes;

    for my $meeting_date ( @MEETINGS ) {
        my ( $year, $month, $day, $hour, $min ) = @$meeting_date;
        push @datetimes, DateTime->new(
            year => $year, month => $month, day => $day, hour => $hour, minute => $min, second => 0,
            time_zone => $TZ,
        );
    }

    return DateTime::Set->from_datetimes( dates => \@datetimes );
}


1;
__END__

=pod

=encoding utf8

=head1 NAME

Acme::PM::Hachioji::Meetings - Hachioji.pm in Japan

=head1 SYNOPSIS

 use Acme::PM::Hachioji::Meetings;
 
 my $meetings = Acme::PM::Hachioji::Meetings->new();
 my $today     = DateTime->new( year => 2010, month => 12, day => 24 );
 my $datetime;
 
 $datetime = $meetings->days->previous( $today );
 $datetime = $meetings->days->next( $today );
 
 $meetings->current_day( $today );
 
 while ( my $meeting = $meetings->previous ) {
    print $meeting->ymd, "\n";
 }
 
 $meetings->current_day( $a_day );
 
 while ( my $meeting = $meetings->next ) {
     print $meeting->ymd, "\n";
 }

=head1 DESCRIPTION

Hachioji.pmの集まりの日程とかじゃないかしら？

=head1 METHODS

=head2 days

 $datetime_set = $meetings->days;

Returns a L<DateTime::Set> object which presents days of Hachioji.pm meeting.

=head2 current_day

  $meetings->current_day( $datime );

Sets a current day L<DateTime>.

=head2 previous

Returns a DateTime which presents the previous meeting from current day set by C<current_day>.
This method is called again, its previous returned datetime is set as staring point.
If the previous day does not exist, returns undef.

=head2 next

Returns a DateTime which presents the next meeting from current day set by C<current_day>.
This method is called again, its previous returned datetime is set as staring point.
If the next day does not exist, returns undef.

=head1 SEE ALSO

L<DateTime::Set>, L<DateTime>

=head1 AUTHOR

Makamaka Hannyaharamitu, E<lt>makamaka[at]cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010 by Makamaka Hannyaharamitu

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

