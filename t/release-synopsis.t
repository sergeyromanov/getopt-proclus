#!perl
#
# This file is part of Getopt-Proclus
#
# This software is copyright (c) 2011 by Damian Conway.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
use 5.008;
use strict;
use warnings;
use utf8;

BEGIN {
    unless ( $ENV{RELEASE_TESTING} ) {
        require Test::More;
        Test::More::plan(
            skip_all => 'these tests are for release candidate testing' );
    }
}

use Test::More;

eval "use Test::Synopsis";
plan skip_all => "Test::Synopsis required for testing synopses"
    if $@;
all_synopsis_ok('lib');
