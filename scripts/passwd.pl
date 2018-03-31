#!/usr/bin/perl

open PASSWD, "/etc/passwd" or die "$!";

my @user;
my @uid;
my @path;

while (<PASSWD>)
{
    chomp;
	if ($_ !~ m/^#.*/)
	{
		push @user, (split ":", $_)[0];
		push @uid, (split ":", $_)[2];
		push @path, (split ":", $_)[5];
	}
}

close PASSWD or warn $!;

sub max_len
{
	my $max = -1;
	while (<@_>)
	{
		if (length > $max)
		{
			$max= length($_);
		}
	}
	return $max;
}

my $len_user = max_len(@user);
my $len_uid = max_len(@uid);
my $len_path = max_len(@path);

my $i = -1;
printf ("┌");
printf ("─"x($len_user + 2));
printf ("┬");
printf ("─"x($len_uid + 2));
printf ("┬");
printf ("─"x($len_path + 2));
printf ("┐\n");
printf ("│ %-*s │", $len_user, User);
printf (" %-*s │", $len_uid, UID);
printf (" %-*s │\n├", $len_path, Path);
printf ("─"x($len_user + 2));
printf ("┼");
printf ("─"x($len_uid + 2));
printf ("┼");
printf ("─"x($len_path + 2));
printf ("┤\n");
while (@user[++$i])
{
	printf ("│ %-*s │", $len_user, @user[$i]);
	printf (" %-*s │", $len_uid, @uid[$i]);
	printf (" %-*s │\n", $len_path, @path[$i]);
}
printf ("└");
printf ("─"x($len_user + 2));
printf ("┴");
printf ("─"x($len_uid + 2));
printf ("┴");
printf ("─"x($len_path + 2));
printf ("┘\n");
