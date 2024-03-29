#######################################################################
# $Id: T.t,v 1.3 2010-06-30 03:52:51 dpchrist Exp $
#
# Test script for Math::TriangularNumbers::T.
#
# Copyright 2010 by David Christensen <dpchrist@holgerdanske.com>
#######################################################################

use Test::More tests => 25;

use Math::TriangularNumbers qw(T);

$| = 1;

ok(T(  0) ==    0);						#  1
ok(T(  1) ==    1);						#  2
ok(T(  2) ==    3);						#  3
ok(T(  3) ==    6);						#  4
ok(T(  4) ==   10);						#  5
ok(T(  5) ==   15);						#  6
ok(T(  6) ==   21);						#  7
ok(T(  7) ==   28);						#  8
ok(T(  8) ==   36);						#  9
ok(T(  9) ==   45);						# 10
ok(T( 10) ==   55);						# 11
ok(T( 20) ==  210);						# 12
ok(T( 30) ==  465);						# 13
ok(T( 40) ==  820);						# 14
ok(T(100) == 5050);						# 15
map {ok(T(-$_) + T($_) < 0.01)} 1..10;				#16-25

#######################################################################
