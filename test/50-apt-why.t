#!/usr/bin/env perl
## Copyright © 2010 by Daniel Friesel <derf@finalrewind.org>
## License: WTFPL <http://sam.zoy.org/wtfpl>
use strict;
use warnings;
use 5.010;
use Test::Command tests => 6;

my $aw = 'bin/apt-why';

my $re_usage =
	qr{Usage: \S*apt-why \[options\] <package>; see \S*apt-why --help};

my $cmd = Test::Command->new(cmd => "$aw");

$cmd->exit_isnt_num(0);
$cmd->stdout_is_eq('');
$cmd->stderr_like($re_usage);

$cmd = Test::Command->new(cmd => "$aw does-not-exist");

$cmd->exit_isnt_num(0);
$cmd->stdout_is_eq('');
$cmd->stderr_is_eq("No such package: does-not-exist\n");
