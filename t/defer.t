BEGIN {
    $INFILE  = $0;
    $OUTFILE = $0;
    $LEN     = 42;
    $H       = 2;
    $W       = -10;
    $TIMEOUT = 7;

    @ARGV = (
        "-i   $INFILE",
        "-out=",
        $OUTFILE,
        "-lgth $LEN",
        "size ${H}x${W}",
        '-no-fudge',
        '-v',
        "--timeout $TIMEOUT",
        '-w',
        's p a c e s',
        7,
    );

    chmod 0644, $0;
}

use Getopt::Euclid qw( :defer );
use Test::More 'no_plan';

is scalar @ARGV, 11 => '@ARGV processing was defered';
is keys %ARGV, 0 => '%ARGV processing was defered';

Getopt::Euclid->process_args(\@ARGV);

is scalar @ARGV, 0 => '@ARGV was processed';
is keys %ARGV, 19 => '%ARGV was processed';

__END__

=head1 NAME

orchestrate - Convert a file to Melkor's .orc format

=head1 VERSION

This documentation refers to orchestrate version 1.9.4

=head1 USAGE

    orchestrate  -in source.txt  --out dest.orc  -verbose  -len=24

=head1 REQUIRED ARGUMENTS

=over

=item  -i[nfile]  [=]<file>    

Specify input file

=for Euclid:
    file.type:    readable
    file.default: '-'

=item  -o[ut][file]= <out_file>    

Specify output file

=for Euclid:
    out_file.type:    writable
    out_file.default: '-'

=back

=head1 OPTIONS

=over

=item  size <h>x<w>

Specify height and width

=item  -l[[en][gth]] <l>

Display length [default: 24 ]

=for Euclid:
    l.type:    int > 0
    l.default: 24

=item  -girth <g>

Display girth [default: 42 ]

=for Euclid:
    g.default: 42

=item -v[erbose]

Print all warnings

=item [-]-timeout [<min>] [<max>]

=for Euclid:
    min.type: int
    max.type: int
    max.default: -1

=item -w <space>

Test something spaced

=item [-]-no[-fudge]

Automaticaly fudge the factors.

=for Euclid:
    false: [-]-no[-fudge]

=item <step>

Step size

=item --version

=item --usage

=item --help

=item --man

Print the usual program information

=back

=begin remainder of documentation here...

=end

=head1 AUTHOR

Damian Conway (damian@conway.org)

=head1 BUGS

There are undoubtedly serious bugs lurking somewhere in this code.
Bug reports and other feedback are most welcome.

=head1 COPYRIGHT

Copyright (c) 2002, Damian Conway. All Rights Reserved.
This module is free software. It may be used, redistributed
and/or modified under the terms of the Perl Artistic License
  (see http://www.perl.com/perl/misc/Artistic.html)
