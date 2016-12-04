#i/usr/bin/perl
#FixMedSchool.pl
#
use warnings;
use strict;

my @linefields = ();
my $linetxt = "";
my $medfield = 4; #the index (counting zero) of the field where the med school is
my $medschool = "";

open IN, "$ARGV[0]" or die $!;
open OUT, "> $ARGV[0].new";

while (defined($linetxt = <IN>)){
	@linefields = split(/\|/, $linetxt);
	$linefields[$medfield] =~ s/([a-z])[A-Z].*$/$1/g;
	$linetxt = join('|', @linefields);
	print OUT $linetxt;

}
