#!/usr/bin/perl

BEGIN { 
	use Env qw(QR_ROOT QR_CGIROOT QR_BIN HOME);
	push @INC, "$QR_ROOT";

}

use Logi::rpc::rpc;
use Data::Dumper;

#use Logi::rpc::rpc qw(rpc_list_queue); 
use strict;
##################################################

	my $kundennr = 210152;	# hanisch
	my $mandant_id = 2;	# hanisch
	my $kundennr = 200193;
	my $kundennr = 200069;
	my $kundennr = 200788;
	my $kundennr = 200506;
	my $kundennr = 200792;
	my $kundennr = 200038;

	my $mandant_id = 1;
	my $kundennr = 288888;



	$kundennr = $ARGV[0] if $#ARGV > -1;

	#my $rpc_server = "bmd:8000/bmd_server.pl";
	my $rpc_server = "test:80/cgi-bin/test_server.pl";	# testsystem
	my $rpc_server = "188.172.237.150/cgi-bin/test_server.pl";	# testsystem
	my $rpc_server = "http://xionit-test0401.xion.at/cgi-bin/test_server.pl";	# testsystem

	my $queue_server = "bmd:8000";
	my $prio = 127;
	my $csv_file="KA_288888_4354.csv";
	my $FH_DBG = 0;	# opt filehandle for debugfile

	my $queue_server = "https://qs.logisth.ai/";

	my $res = rpc_list_queue_running ($FH_DBG, $mandant_id, $kundennr, $queue_server);

	foreach my $ind (0 .. scalar @{$res} - 1) {
		my $parms_href  = @{$res}[$ind];
		print "RUNNING ($parms_href->{id}/$parms_href->{priority}): kundennr: $parms_href->{kundennr} timestamp: $parms_href->{timestamp} $parms_href->{buchdatum} $parms_href->{total_invoices} $parms_href->{buchsymbol} $parms_href->{periode}\n";
	}       

