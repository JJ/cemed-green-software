#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

my $preffix = shift || die "I need a preffix for output files";

my $data_dir = shift || "../data";
my $platform = shift || "desktop-AMD";
my $version = shift || "";

my $ITERATIONS = 30;
my ($mon,$day,$hh,$mm,$ss) = localtime() =~ /(\w+)\s+(\d+)\s+(\d+)\:(\d+)\:(\d+)/;
my $suffix = "$day-$mon-$hh-$mm-$ss";

open my $fh, ">", "$data_dir/$preffix-$suffix.csv";

say $fh "Platform,File,PKG,seconds";

for my $f ( qw( manzoni_i_promessi_sposi_1840 malavoglia 3romanzi ) ) {
  my @results;
  for ( my $i = 0; $i < $ITERATIONS; $i++ ) {
    my $command = "./.venv/bin/python bin/sacrypt-energy.py ../data/$f.txt $version";
    say $command;
    my $output = `$command 2>&1`;
    say $output;
    my ($duration, $PKG) = ( $output =~ /duration : (\S+); package_0 : (\S+);/ );
    say "$duration $PKG";
    say $fh "$platform; $f; ",$PKG/1e6,"; $duration";
  }
}
close $fh;
