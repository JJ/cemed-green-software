#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

sub process_pinpoint_output {
  my $output = shift;
  if ($output !~ /0.00\s+J/) {
      my ( $gpu, $pkg ) = $output =~ /(\d+\.\d+)\s+J/g;
      my ( $seconds ) = $output =~ /(\d+\.\d+) seconds/;
      return $gpu, $pkg,$seconds;
    } else {
      return 0,0,0;
    }
}

my $preffix = shift || die "I need a preffix for output files";

my $data_dir = shift || "../data";
my $node = shift || "/home/jmerelo/.nvm/versions/v22.14.0/bin/node";
my $script = shift || "bin/sacrypt.js";
my $platform = shift || "node";
my $ITERATIONS = 30;
my ($mon,$day,$hh,$mm,$ss) = localtime() =~ /(\w+)\s+(\d+)\s+(\d+)\:(\d+)\:(\d+)/;
my $suffix = "$day-$mon-$hh-$mm-$ss";

open my $fh, ">", "$data_dir/$preffix-$suffix.csv";

say $fh "Platform,File,PKG,seconds";

for my $f ( qw( manzoni_i_promessi_sposi_1840 malavoglia 3romanzi ) ) {
  my @results;
  for ( my $i = 0; $i < $ITERATIONS; $i++ ) {
    my $command = "$node $script $data_dir/$f.txt";
    say $command;
    my $output = `pinpoint $command 2>&1`;
    say $output;
    my ( $gpu, $pkg, $seconds ) = process_pinpoint_output $output;
    say "$pkg $seconds";
    say $fh "$platform; $f; ",$pkg,"; $seconds";
  }
}
close $fh;
