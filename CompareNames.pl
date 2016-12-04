#i/usr/bin/perl
#FixMedSchool.pl
use warnings;
use strict;

my @linefields = ();
my $linetxt = "";
my @oldnamefield = (1,2); #the indices (counting zero) of the field where the name field is
my @newnamefield = (1,2);
my $name = "";
my @oldnames = ();

open OLD, shift(@ARGV) or die $!;
open NAMES, "> $ARGV[0].missingnames";
open NEW, shift(@ARGV) or die $!;

while (defined($linetxt = <OLD>)) {
	chomp $linetxt;
	@linefields = split(/\|/, $linetxt);
	$name = join(' ', @linefields[@oldnamefield]);	
	push(@oldnames, $name);
}

while (defined($linetxt = <NEW>)) {
	chomp $linetxt;
	@linefields = split(/\|/, $linetxt);
	$name = join(' ', @linefields[@newnamefield]);	
	if (not (grep { $name eq $_ } @oldnames)) {
		print NAMES $name, "\n";
	}
}


