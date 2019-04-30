#! /usr/bin/env perl
use strict;
use warnings;
die "$0 jointDAFpop1_0.obs > jointDAFpop1_0.fold.obs\n"unless $ARGV[0];
my %hash;
my $m=0;
my $n=0;

my $head1=<>;
my $head2=<>;
my @head3;
while (<>) {
    chomp;
    my @a=split(/\s+/);
    my $head3=shift @a;
    push @head3,$head3;
    $n=@a if($n==0);
    for(my $i=0;$i<@a;$i++){
        $hash{$m}{$i}=$a[$i];
    }
    $m++;
}
$m=$m-1;
$n=$n-1;
#print "$m\t$n\n";
print $head1,$head2;

foreach my $y(sort {$a<=>$b} keys %hash){
    my @line;
    foreach my $x(sort {$a<=>$b} keys %{$hash{$y}}){
        if( ($x+$y) > ($m+$n)/2 ){
            push @line,"0";
        }
        else {
            my $y_reverse=$m-$y;
            my $x_reverse=$n-$x;
            my $new_num;
            if( ($x_reverse+$y_reverse) > ($m+$n)/2 ){
		$new_num=$hash{$y}{$x}+$hash{$y_reverse}{$x_reverse};
            }
            else {
		$new_num=( $hash{$y}{$x}+$hash{$y_reverse}{$x_reverse} )/2;
            }
            push @line,$new_num;
        }
    }
    my $head3=shift @head3;
    print $head3,"\t",join "\t",@line,"\n";
}

