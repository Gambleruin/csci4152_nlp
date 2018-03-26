# this is perl program

#!/usr/bin/perl
# Letter frequencies
#the required output: letters of the input text 
#with their frequencies and normalized frequencies 
#ordered from the most frequent to the least frequent
use warnings;
use strict;

# read in the contents of the file
my $str;
my $count;
my @l;
open(FILE, "<$ARGV[0]") or die ("Failed to open $ARGV[0]: $!");
{
	local($/) =undef;
}

# split the contents around each character
# my @words =split(//, $contents);
# tokenize all the words into an array called 'words'
my @words;
while (<FILE>) {
        $str =lc $_;
	# print "$str";
        $str =~s/[^a-zA-Z ]+//g;
        @l =split(/\s+/, $str);
	# print "@l\n\n\n       ";
        push @words, @l;
}
close FILE;  
# build the hash of each character with it is respective count
my %counts =map{
	# use lc($_) to make the search case-insensitive
	my $input =$_;
	# filter out newlines
	$_ ne "\n"?
		($input => scalar grep {$_ eq $input} @words):
		()
	} @words;
	
# print $counts{"i"}, "\n";
sub return_freq{
	my ($key, %counts) =@_;
	print $key. "\n";
	my $lc_key =lc($key);
	if (exists $counts{$lc_key}){
		print $counts{$lc_key}. "\n";
	}
	else {
		print "0\n";
	}
}


# foreach (keys %counts){
#	print $counts{$_};
&return_freq("I", %counts)



