#######################################################################
# $Id: is_T.t,v 1.3 2010-06-30 03:52:51 dpchrist Exp $
#
# Test script for Math::TriangularNumbers::is_T.
#
# Copyright 2010 by David Christensen <dpchrist@holgerdanske.com>
#######################################################################

use Test::More tests => 39;

use Math::TriangularNumbers qw(is_T);

$| = 1;

ok( is_T(  0));							#  1
ok( is_T(  1));							#  2
ok(!is_T(  2));							#  3
ok( is_T(  3));							#  4
ok(!is_T(  4));							#  5
ok(!is_T(  5));							#  6
ok( is_T(  6));							#  7
ok(!is_T(  7));							#  8
ok(!is_T(  8));							#  9
ok(!is_T(  9));							# 10
ok( is_T( 10));							# 11
ok(!is_T( 14));							# 12
ok( is_T( 15));							# 13
ok(!is_T( 16));							# 14
ok(!is_T( 20));							# 15
ok( is_T( 21));							# 16
ok(!is_T( 22));							# 17
ok(!is_T( 54));							# 18
ok( is_T( 55));							# 19
ok(!is_T( 56));							# 20
ok(!is_T(209));							# 21
ok( is_T(210));							# 22
ok(!is_T(211));							# 23
ok(!is_T(464));							# 24
ok( is_T(465));							# 25
ok(!is_T(466));							# 26
ok(!is_T(819));							# 27
ok( is_T(820));							# 28
ok(!is_T(821));							# 29
map {ok(is_T(-$_) == is_T($_))} 1..10;				# 30-39

#######################################################################
