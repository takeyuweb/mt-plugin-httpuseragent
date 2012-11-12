use strict;
use lib qw( t/lib lib extlib );
use warnings;
use MT;
use Test::More tests => 4;
use MT::Test;

ok( MT->component( 'HTTPUserAgent' ), "HTTPUserAgent plugin loaded correctry" );

require_ok( 'HTTPUserAgent::L10N' );
require_ok( 'HTTPUserAgent::L10N::ja' );
require_ok( 'HTTPUserAgent::Tags' );

1;