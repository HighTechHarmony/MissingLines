#!/usr/bin/perl

# The purpose of this script is to print the lines in file2 that are not present in file1, regardless of order.

unless ($#ARGV>=1) {die "Usage: different-lines.pl [file1.txt] [file2.txt]";}

open (FILE1,$ARGV[0]) || die "Unable to open $ARGV[0]: $!\n";
open (FILE2,$ARGV[1]) || die "Unable to open $ARGV[1]: $!\n";

# Store the contents of file1 in array
while (<FILE1>) {push (@lines_one,$_);}

close FILE1;

# Iterate through each line of file2, checking for presence in file1, and setting a flag if it's found.
while (<FILE2>) {
        $flag=0;
        foreach $line (@lines_one) {
                $line=~s/\s+$//g;
                s/\s+$//g;

                if ($line =~ /$_/) {$flag=1; last;}
        }
        unless ($flag) {push (@missing_from_1, $_);}
}

close FILE2;

# Dump the results (missing lines)
foreach $line (@missing_from_1) {
        print $line."\n";
}
