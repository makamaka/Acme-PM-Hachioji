require 5.008;
use strict;
use ExtUtils::MakeMaker;


WriteMakefile(
    'NAME'          => 'Acme::PM::Hachioji',
    'VERSION_FROM'  => 'lib/Acme/PM/Hachioji.pm', # finds $VERSION
    'PREREQ_PM'     => {
        'Test::More'  => '0.96',
    },
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Acme/PM/Hachioji.pm', # retrieve abstract from module
       AUTHOR     => 'Makamaka Hannyaharamitu, E<lt>makamaka[at]cpan.orgE<gt>') : ()),
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002 ? ('LICENSE' => 'perl', ) : () ),

    ( $ExtUtils::MakeMaker::VERSION >= 6.46 ? (
        'META_MERGE' => {
            resources => {
                repository  =>      'http://github.com/makamaka/Acme-PM-Hachioji',
            },
        } ) : ()
    ),
);

