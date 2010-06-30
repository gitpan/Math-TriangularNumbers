#######################################################################
# $Id: TriangularNumbers.pm,v 1.12 2010-06-30 03:59:57 dpchrist Exp $

=head1 NAME

Math::TriangularNumbers - Perl extension for Triangular numbers.


=head1 SYNOPSIS

See the script t/example.t:

    use Math::TriangularNumbers qw(T Ti Tli Tri is_T);

    ##### triangular numbers 1, 3, 6, 10, 15, 21, 28, 36, 45, 55
    print STDERR join(", ", map({T($_)}   1..10)), "\n";

    ##### triangular indices: 1, 1.x, 2, 2.x, 2.x, 3, 3.x, 3.x, 3.x, 4
    print STDERR join(", ", map({Ti($_)}  1..10)), "\n";

    ##### left triangular indices: 1, 1, 2, 2, 2, 3, 3, 3, 3, 4
    print STDERR join(", ", map({Tli($_)} 1..10)), "\n";

    ##### right triangular indices 1, 2, 2, 3, 3, 3, 4, 4, 4, 4
    print STDERR join(", ", map({Tri($_)} 1..10)), "\n";

    ##### determines if the number 666 is triangular (it is):
    print STDERR "the number 666 ",
		is_T(666) ? "is " : "is not",
		"triangular\n";

Output:

    1, 3, 6, 10, 15, 21, 28, 36, 45, 55
    1, 1.56155281280883, 2, 2.37228132326901, 2.70156211871642, 3, 3.27491721763537, 3.53112887414927, 3.77200187265877, 4
    1, 1, 2, 2, 2, 3, 3, 3, 3, 4
    1, 2, 2, 3, 3, 3, 4, 4, 4, 4
    the number 666 is triangular


=head1 DESCRIPTION

I was using the following function for games:

    T(n) = 1 + 2 + ... + (n-1) + n

         = n * (n+1) / 2

For example:

    T(1) =  1
    T(2) =  3
    T(3) =  6
    T(4) = 10
    T(5) = 15
    T(6) = 21
    etc.

These are called Triangular numbers, after Pascal's Triangle:

				1
			    1       1
			1       2       1
		    1       3       3       1
		1       4       6       4       1
	    1       5      10      10       5       1
	1       6      15      20      15       6       1
    1       7      21      35      35      21       7       1

Observe the diagonal numbers starting at the third row:
1, 3, 6, 10, 15, 21.

The inverse is given by:

    n = -0.5 +- sqr(0.25 + 2*T)


=head2 EXPORT

None by default.

=cut

#######################################################################
# package:
#----------------------------------------------------------------------

package Math::TriangularNumbers;

#######################################################################
# uses/ requires:
#----------------------------------------------------------------------

use 5.010;
use strict;
use warnings;

use constant DEBUG => 0;

use Carp;
use POSIX qw(ceil floor);

require Data::Dumper if DEBUG;

require Exporter;

#######################################################################
# global variables:
#----------------------------------------------------------------------

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
    T
    Ti
    Tli
    Tri
    is_T
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw();

our $VERSION = sprintf("%d.%03d", q$Revision: 1.12 $ =~ /(\d+)/g);

#######################################################################
# preloaded methods:
#----------------------------------------------------------------------

=head2 FUNCTIONS

=head3 T($n)

Returns the $n-th Triangular number.
Note that T(0) = 0, and T(-$n) = -T($n).

=cut

sub T
{
    my $n = shift;
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$n], [qw(n)]), "\n"
	if DEBUG;

    my $T = 0 < $n
	?  $n * ( $n+1) / 2
	:  $n * (-$n+1) / 2;		##### let T(-n) = -T(n)
    
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$T], [qw(T)]), "\n"
	if DEBUG;
    return $T;
}

#----------------------------------------------------------------------

=head3 Ti($N)

Returns triangular inverse (floating point) of $N.
Note that Ti(0) = 0, and Ti(-$N) = -Ti($N).

=cut

sub Ti
{
    my $N = shift;
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$N], [qw(N)]), "\n"
	if DEBUG;

    my $n = ($N == 0)
	    ? 0
	    : ($N < 0)
	      ?  +0.5 - sqrt(0.25 - 2 * $N)
	      :  -0.5 + sqrt(0.25 + 2 * $N);

    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$n], [qw(n)]), "\n"
	if DEBUG;
    return $n;
}

#----------------------------------------------------------------------

=head3 Tli($N)

Returns left triangular index (integer) of $N.
Note that Tli(0) = 0, and Tli(-$N) = -Tli($N).

=cut

sub Tli
{
    my $N = shift;
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$N], [qw(N)]), "\n"
	if DEBUG;

    my $n = ($N == 0)
	    ? 0
	    : ($N < 0)
	      ? ceil (Ti($N))
	      : floor(Ti($N));

    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$n], [qw(n)]), "\n"
	if DEBUG;
    return $n;
}

#----------------------------------------------------------------------

=head3 Tri($N)

Returns right triangular index (integer) of $N.
Note that Tri(0) = 0, and Tri(-$N) = -Tri($N).

=cut

sub Tri
{
    my $N = shift;
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$N], [qw(N)]), "\n"
	if DEBUG;

    my $n = ($N == 0)
	    ? 0
	    : ($N < 0)
	      ? floor(Ti($N))
	      : ceil (Ti($N));

    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$n], [qw(n)]), "\n"
	if DEBUG;
    return $n;
}

#----------------------------------------------------------------------

=head3 is_T($N)

Returns true if $N is a triangular number,
if $N is zero,
or if -$N is a triangular number,
otherwise returns false.

=cut

sub is_T
{
    my $N = shift;
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$N], [qw(N)]), "\n"
	if DEBUG;

    my $r = (T(Tri($N)) == $N);
    
    print STDERR __FILE__, ' ', __LINE__, ' ', (caller(0))[3], ": ",
	Data::Dumper->Dump([$r], [qw(r)]), "\n"
	if DEBUG;
    return $r;
}

#######################################################################
# end of code:
#----------------------------------------------------------------------

1;
__END__

#######################################################################
# remaining pod:
#----------------------------------------------------------------------

=pod

=head1 INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install


=head1 SEE ALSO

http://mathforum.org/dr.math/faq/faq.pascal.triangle.html

http://mathworld.wolfram.com/TriangularNumber.html

http://en.wikipedia.org/wiki/Triangular_numbers


=head1 AUTHOR

David Paul Christensen dpchrist@holgerdanske.com


=head1 COPYRIGHT AND LICENSE

Copyright 2010 by David Paul Christensen dpchrist@holgerdanske.com

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.


=cut

#######################################################################
