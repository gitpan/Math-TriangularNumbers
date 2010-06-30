#######################################################################
# $Id: Tli.t,v 1.2 2010-06-30 03:52:51 dpchrist Exp $
#
# Test script for Math::TriangularNumbers::Tli.
#
# Copyright 2010 by David Christensen <dpchrist@holgerdanske.com>
#######################################################################

use Test::More tests => 21;

use Math::TriangularNumbers qw(Tli);

$| = 1;

ok(Tli(  0)  ==   0);						#  1
ok(Tli(  1)  ==   1);						#  2
ok(Tli(  2)  ==   1);						#  3
ok(Tli(  3)  ==   2);						#  4
ok(Tli(  4)  ==   2);						#  5
ok(Tli(  5)  ==   2);						#  6
ok(Tli(  6)  ==   3);						#  7
ok(Tli(  7)  ==   3);						#  8
ok(Tli(  8)  ==   3);						#  9
ok(Tli(  9)  ==   3);						# 10
ok(Tli( 10)  ==   4);						# 11
map {ok(Tli(-$_) == -Tli($_))} 1..10;				#12-21

#######################################################################
