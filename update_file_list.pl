#!/usr/bin perl
$PKM_DIR="G:/blog/pkm/";

sub handle_file
{
	my $title;
	if(!open FILE,"<".$PKM_DIR.$_[0])
    {
		print "Can not Open ".$_[0];
	}
	else
	{
		while(<FILE>)
		{
			$title = $_;
			chomp($title);
			last;
		}
	
	}

	close(FILE);
	return $title;
}

if(!open FILE_LIST_OUTPUT,">file_list.t2t"){
	die "Can not Open file_list.t2t";
}

print FILE_LIST_OUTPUT "所有html文件列表\nchiyl\nLastUpdate:%%mtime(%c)\n\n\n";
foreach $filename(<STDIN>){	
    chomp($filename);
	my $title = handle_file($filename); 
    $basename = $filename;
	$basename =~ s/(.*)t2t$/\1html/g;
	print FILE_LIST_OUTPUT " - [".$title." MY_HOME_SITE_PKM".$basename."\]\n";
}

close(FILE_LIST_OUTPUT);
