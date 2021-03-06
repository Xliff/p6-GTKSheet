#!/usr/bin/env perl6

use File::Find;

use GTK::Raw::Types;
use GTKSheet::Raw::Types;

sub MAIN ($pattern is copy, :$prefix!) {
  $pattern ~~ s/\*//;
  my @files = find
    dir     => 'lib',
    name    => /{$pattern}/,
    type    => 'file',
    exclude => /'Types.pm6'$/,
    exclude => /'.precomp'/;


  my %seen;
  my %seen-enum;
  for @files -> $filename {
    say "Checking { $filename }...";
    my $f = $filename.IO.slurp;
    for $f ~~ m:g/({ $prefix }<[A..Za..z]>+)/ {
      next unless $_.Str.starts-with($prefix);
      my $prospect = $_[0].Str;
      next if %seen{$prospect};
      if / 'Mode' | 'Result' | 'Flags' | 'Reason' / {
        %seen-enum{$prospect} = True;
      } else {
        %seen{$prospect} = True;
      }
    }
  }

  say "\n\n------- MISSING CLASSES -------";
  for %seen.keys.sort {
    my $is-there = False;
    try {
      my $a := ::($_);
      $is-there = True;
      CATCH { default { 1; } }
    }
    say
      "class $_ is repr(\"CPointer\") is export does GTK::Roles::Pointers \{ \}"
    unless $is-there;
  }

  say "\n\n------- MISSING ENUMS -------";
  for %seen-enum.keys {
    my $is-there = False;
    try {
      my $a := ::($_);
      $is-there = True;
      CATCH { default { 1; } }
    }
    say "our enum $_ is export <\n>;" unless $is-there;
  }
}
