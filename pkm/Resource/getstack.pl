#!/usr/bin/perl

my $ebp=0;
my @stack;
my $l=0;

while($line=<STDIN>)
{
    chomp($line);
    if($l==0 and $ebp==0)
    {
        $ebp=$line;
        $ebp=~s/.*(\b0x.*\b)$/\1/;
        $ebp=hex($ebp);
    }
    if($line =~ m/\b0x.*:/)
    {
        my $addr=$line;
        my $tail=$line;
        my @vaule;
        my $count=0;

        $addr =~ s/.*(\b0x.*):(.*)/\1/;
        $tail =~ s/.*(\b0x.*):(.*)/\2/;
        @value=split/\t/,$tail;

        $addr = hex($addr);
        $count=1;
        while($count<5)
        {
            if($ebp==$addr)
            {
                $stack[$l]=sprintf "0x%x :\t %s\t<---\$ebp(0x%x)\n", $addr,$value[$count],$ebp;
            }
            else
            {
                $stack[$l]=sprintf "0x%x :\t %s\n", $addr,$value[$count];
            }
            $count = $count+1;
            $addr = $addr + 4;
            $l++;
        }
    }
}
@stack=reverse(@stack);
print @stack;
