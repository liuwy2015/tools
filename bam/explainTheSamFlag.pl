#!/usr/bin/perl -w
use strict;
use warnings;

while (<>) {
    chomp;
    next if (/^$/);
    my $line = $_;
    my @a = split(/\s+/,$_);
    my ($qName,$flag,$rName,$pos,$mapQuality,$CIGAR,$rNext,$pNext,$TLen,$seq,$qual,$more) = @a;
    my ($p,$P,$u,$U,$r,$R,$mate1,$mate2,);
    $p     = $flag & 1;   #0x0001 p the read is paired in sequencing1
    $P     = $flag & 2;   #0x0002 P the read is mapped in a proper pair
    $u     = $flag & 4;   #0x0004 u the query sequence itself is unmapped
    $U     = $flag & 8;   #0x0008 U the mate is unmapped
    $r     = $flag & 16;  #0x0010 r strand of the query (1 for reverse)
    $R     = $flag & 32;  #0x0020 R strand of the mate
    $mate1 = $flag & 64;  #0x0040 1 the read is the first read in a pair
    $mate2 = $flag & 128; #0x0080 2 the read is the second read in a pair
    print "$p\t$P\t$u\t$U\t$r\t$R\t$mate1\t$mate2\t$line\n";

}






256  #0x0100  the alignment is not primary
512  #0x0200  the read fails platform/vendor quality checks
1024 #0x0400  the read is either a PCR or an optical duplicate
2048 #0x0800  supplementary alignment
