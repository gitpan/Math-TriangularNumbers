#######################################################################
# $Id: Tri.t,v 1.2 2010-06-30 03:52:51 dpchrist Exp $
#
# Test script for Math::TriangularNumbers::Tri.
#
# Copyright 2010 by David Christensen dpchrist@holgerdanske.com
#######################################################################

use Test::More tests => 21;

use Math::TriangularNumbers qw(Tri);

$| = 1;

ok(Tri(  0)  ==   0);						#  1
ok(Tri(  1)  ==   1);						#  2
ok(Tri(  2)  ==   2);						#  3
ok(Tri(  3)  ==   2);						#  4
ok(Tri(  4)  ==   3);						#  5
ok(Tri(  5)  ==   3);						#  6
ok(Tri(  6)  ==   3);						#  7
ok(Tri(  7)  ==   4);						#  8
ok(Tri(  8)  ==   4);						#  9
ok(Tri(  9)  ==   4);						# 10
ok(Tri( 10)  ==   4);						# 11
map {ok(Tri(-$_) == -Tri($_))} 1..10;				#12-21

#######################################################################
