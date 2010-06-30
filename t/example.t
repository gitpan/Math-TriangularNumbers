#######################################################################
# $Id: example.t,v 1.5 2010-06-30 03:52:51 dpchrist Exp $
#
# Test script for example code given in module pod documentation.
#
# Copyright 2010 by David Christensen dpchrist@holgerdanske.com
#######################################################################

use Test::More tests => 1;

$| = 1;

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

ok(1);

#######################################################################
