#!/user/bin/perl

$FILE_DIR="\"G:/blog/pkm/\"";

#if(!open FILE_LIST,"<".$FILE_DIR."file_list.tmp")
#{
#    die "Can not open file_list.tmp";
#}

sub get_log{
    my $file=$_[0];
    my $GIT_HOME="\"C:/Program Files (x86)/Git/bin/\"";
    my $CHNAG_TITLE="\n\n\n\n|| 更改内容 | 时间 | 更改人 | git 版本 ||";
    my $CHANG_LOG_FILE="change_log.t2t";
    my $convcmd=" | iconv -f utf-8 -t cp936 ";
    my $title="C:/cygwin/bin/echo "."\"".$CHNAG_TITLE."\"".$convcmd." > ".$FILE_DIR.$CHANG_LOG_FILE;
    my $option="--encoding=utf-8 --date=iso --format=\"| %s | %ad | %cn | %h |\" ";
    my $cmd=$GIT_HOME."git log ".$option." ".$FILE_DIR.$file.$convcmd.">>".$FILE_DIR.$CHANG_LOG_FILE;
    system($title);

    print $cmd."\n";
    system($cmd);
}

sub build_html{
    my $file=$_[0];
    my $T2T_HOME="D:/txt2tags/txt2tags-2.6.py ";
    my $cmd=$T2T_HOME.$FILE_DIR.$file;
    print $cmd."\n";
    
    system($cmd);
}

foreach $line(<STDIN>)
{
    chomp($line);
    get_log($line);
    build_html($line);
}
