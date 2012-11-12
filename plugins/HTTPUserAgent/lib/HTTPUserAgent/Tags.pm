package HTTPUserAgent::Tags;

use strict;

sub hdlr_if_http_user_agent {
    my ( $ctx, $args, $cond ) = @_;

    my $user_agent = $ENV{'HTTP_USER_AGENT'};
    
    my $ua = 'pc';
    
    # Device
    # featurephone
    my $docomo = 0;
    my $au = 0;
    my $softbank = 0;
    # Smartphone(OS)
    my $ios = 0;
    my $android = 0;
    my $blackberry = 0;
    my $windowsmobile = 0;
    
    # Device Type
    my $tablet = 0;
    my $smartphone = 0;
    my $featurephone = 0;
    my $generic = 0;
    
    # http://maxfactory.biz/blog/2011/05/27/device_f/
    
    if ( $user_agent =~ /DoCoMo/ ) {
    	$ua = 'docomo';
    	$docomo = 1;
    	$featurephone = 1;
    } elsif( $user_agent =~ /UP\.Brower|KDDI-/ ) {
    	$ua = 'au';
    	$au = 1;
    	$featurephone = 1;
    } elsif( $user_agent =~ /(?:J-PHONE|Vodafone|SoftBank)/ ) {
    	$ua = 'softbank';
    	$softbank = 1;
    	$featurephone = 1;
    } elsif( $user_agent =~ /iPhone/ ) {
    	$ua = 'iphone';
    	$ios = 1;
    	$smartphone = 1;
    } elsif( $user_agent =~ /iPad/ ){
    	$ua = 'ipad';
    	$ios = 1;
    	$tablet = 1;
    } elsif( $user_agent =~ /Android/ ) {
    	$android = 1;
    	if ( $user_agent =~ /Mobile/ && $user_agent !~ /SC-01C/ ) {
    		$ua = 'androidmobile';
	    	$smartphone = 1;
	    } else {
    		$ua = 'androidtablet';
	    	$tablet = 1;
	    }
    } elsif ( $user_agent =~ /BlackBerry/ ) {
    	$ua = 'blackberry';
    	$blackberry = 1;
    	$smartphone = 1;
    } elsif( $user_agent =~ /IEMobile/ ) {
    	$ua = 'iemobile';
    	$windowsmobile = 1;
    	$smartphone = 1;
    } else {
    	$generic = 1;
    }
    
    my $result = 1;
    if ( exists $args->{tablet} && $args->{tablet} != $tablet ) {
    	$result = 0;
    }
    if ( exists $args->{smartphone} && $args->{smartphone} != $smartphone ) {
    	$result = 0;
    }
    if ( exists $args->{featurephone} && $args->{featurephone} != $featurephone ) {
    	$result = 0;
    }
    
    if ( exists $args->{docomo} && $args->{docomo} != $docomo ) {
    	$result = 0;
    }
    if ( exists $args->{au} && $args->{au} != $au ) {
    	$result = 0;
    }
    if ( exists $args->{softbank} && $args->{softbank} != $softbank ) {
    	$result = 0;
    }
    if ( exists $args->{ios} && $args->{ios} != $ios ) {
    	$result = 0;
    }
    if ( exists $args->{android} && $args->{android} != $android ) {
    	$result = 0;
    }
    if ( exists $args->{blackberry} && $args->{blackberry} != $blackberry ) {
    	$result = 0;
    }
    if ( exists $args->{windowsmobile} && $args->{windowsmobile} != $windowsmobile ) {
    	$result = 0;
    }
    if ( exists $args->{generic} && $args->{generic} != $generic ) {
    	$result = 0;
    }
    
    return $result;
}

sub hdlr_http_user_agent {
    return $ENV{'HTTP_USER_AGENT'};
}

1;
