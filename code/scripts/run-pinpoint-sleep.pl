#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use lib qw(lib ../lib ../../lib);
use Utils qw(process_pinpoint_output);

my $dir = shift || "data/";
my $ITERATIONS = 15;
my ($mon,$day,$hh,$mm,$ss) = localtime() =~ /(\w+)\s+(\d+)\s+(\d+)\:(\d+)\:(\d+)/;
my $suffix = "$day-$mon-$hh-$mm-$ss";

open my $fh, ">", "$dir/sleep-$suffix.csv";
say $fh "Platform,size,GPU,PKG,seconds";

for my $l ( qw(0.5 1 2 4) ) {
  my $total_seconds;
  my $successful = 0;
  my @results;
  do {
    my $command = "sleep $l";
    say $command;
    my $output = `pinpoint $command 2>&1`;
    say $output;
    my ( $gpu, $pkg, $seconds ) = process_pinpoint_output $output;
    if ($gpu != 0 ) {
      $successful++;
      $total_seconds += $seconds;
      say "$l, $gpu ,$pkg";
      push @results, [$gpu, $pkg,$seconds];
    }
  } while ( $successful < $ITERATIONS );

  foreach  my $row (@results) {
    say join(", ", @$row);
    say $fh "sleep, $l, ", join(", ", @$row);
  }
}
close $fh;
