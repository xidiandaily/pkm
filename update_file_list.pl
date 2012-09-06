#!/usr/bin perl
use File::List;
use File::Basename;

if(!open FILE_LIST_OUTPUT,">file_list.t2t"){
	die "Can not Open file_list.t2t";
}

sub handle_file{
	my $title;
	if(!open FILE,"<".$_[0]){
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

	return $title;
	close(FILE);
}


my $search = new File::List("F:\\blog\\pkm");
$search->show_empty_dirs();
my @files = @{$search->find("\.t2t\$")};
my @ignore=qw/config.t2t file_head.t2t file_list.t2t/;

print FILE_LIST_OUTPUT "所有html文件列表\nchiyl\nLastUpdate:%%mtime(%c)\n\n\n";
foreach $filename(@files){	
	my $isIgnore=0;
	my $title;
	my $basename;
	$title = handle_file($filename); 
	($name,$path,$suffix) = fileparse($filename,@suffixlist);
	$basename = basename($filename,@suffixlist);
	foreach  $ign(@ignore)
	{
 		if($basename =~ /^$ign$/){
			$isIgnore = 1;
			last;
		}
	}
	if ($isIgnore == 1){
		next;
	}
	$basename =~ s/(.*)t2t$/\1html/g;
	$title =~ s///g;
	print FILE_LIST_OUTPUT " - [".$title." MY_HOME_SITE_PKM".$basename."\]\n";
}

close(FILE_LIST_OUTPUT);
