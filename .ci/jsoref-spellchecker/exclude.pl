#!/usr/bin/perl
# This script takes null delimited files as input
# it drops paths that match the listed exclusions
# output is null delimited to match input
$/="\0";
my @excludes=qw(
  (^|/)images/
  ^src/it/resources/
  ^src/test/resources/
  ^src/site/resources/styleguides/
  ^src/test/resources-noncompilable/
  /messages.*_..\.properties$
  /releasenotes_old.*\.xml$
  /releasenotes\.xml$
  /.*_..\.translation[^/]*$
  /jdk14-test-excluded-files\.list$
  /openjdk16-excluded\.files$
);
my $exclude = join "|", @excludes;
while (<>) {
  chomp;
  next if m{$exclude};
  print "$_$/";
}
