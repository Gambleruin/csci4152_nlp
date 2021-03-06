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

my $cnt =0;
# reverse sort (highest first) the hash values and print (give the top 10 frequent words)
my @fir_ten;
foreach(reverse sort {$counts{$a} <=> $counts{$b}} keys %counts) {
    push @fir_ten, $_;
    # print "$_: $counts{$_}\n";
    $cnt =$cnt+1;
    if($cnt >9){
    	last;}
}
print join(',', @fir_ten), "\n";
my $count_hapax_lego=0;
foreach (keys %counts){
	if ($counts{$_} ==1){
		$count_hapax_lego =$count_hapax_lego+1;
		# print "the word with count 1 is: $_\n";
		}

}
print "the number of hapax legomena is:", $count_hapax_lego;
#another way to do this - using the modifier /g for regex match
#while (<>) {
#    foreach my $let (/[a-zA-Z]/g) {              
#         $f{lc $let} += 1;                                     
#         $tot ++;                                  
#     }
#}


#for (sort { $f{________} ________ $f{_________} } keys %f) {
#	print sprintf("%6d %.4lf %s\n",$f{$_}, $f{$_}/$tot, $_);
#}
#close $fh;


