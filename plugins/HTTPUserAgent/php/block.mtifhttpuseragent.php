<?php
function smarty_block_mtifhttpuseragent($args, $content, &$ctx, &$repeat) {
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    
    $ua = 'pc';
    
    $docomo = 0;
    $au = 0;
    $softbank = 0;
    $ios = 0;
    $android = 0;
    $blackberry = 0;
    $windowsmobile = 0;
    
    $tablet = 0;
    $smartphone = 0;
    $featurephone = 0;
    $generic = 0;
    
    # http://maxfactory.biz/blog/2011/05/27/device_f/
    
    if(preg_match("/DoCoMo/", $user_agent)){
    	$ua = 'docomo';
    	$docomo = 1;
    	$featurephone = 1;
    }else if(preg_match("/UP\.Brower|KDDI-/", $user_agent)){
    	$ua = 'au';
    	$au = 1;
    	$featurephone = 1;
    }else if(preg_match("/J-PHONE|Vodafone|SoftBank/", $user_agent)){
    	$ua = 'softbank';
    	$softbank = 1;
    	$featurephone = 1;
    }else if(preg_match("/iPhone/", $user_agent)){
    	$ua = 'iphone';
    	$ios = 1;
    	$smartphone = 1;
    }else if(preg_match("/iPad/", $user_agent)){
    	$ua = 'ipad';
    	$ios = 1;
    	$tablet = 1;
    }else if(preg_match("/Android/", $user_agent)){
    	$android = 1;
    	if(preg_match("/Mobile/", $user_agent) && !preg_match("/SC-01C/", $user_agent)){
    		$ua = 'androidmobile';
	    	$smartphone = 1;
	    }else{
    		$ua = 'androidtablet';
	    	$tablet = 1;
	    }
    }else if(preg_match("/BlackBerry/", $user_agent)){
    	$ua = 'blackberry';
    	$blackberry = 1;
    	$smartphone = 1;
    }else if(preg_match("/IEMobile/", $user_agent)){
    	$ua = 'iemobile';
    	$windowsmobile = 1;
    	$smartphone = 1;
    }else{
    	$generic = 1;
    }
    
    $result = 1;
    if(array_key_exists('tablet', $args) && $args['tablet'] != $tablet){
    	$result = 0;
    }
    if(array_key_exists('smartphone', $args) && $args['smartphone'] != $smartphone){
    	$result = 0;
    }
    if(array_key_exists('featurephone', $args) && $args['featurephone'] != $featurephone){
    	$result = 0;
    }
    
    if(array_key_exists('docomo', $args) && $args['docomo'] != $docomo){
    	$result = 0;
    }
    if(array_key_exists('au', $args) && $args['au'] != $au){
    	$result = 0;
    }
    if(array_key_exists('softbank', $args) && $args['softbank'] != $softbank){
    	$result = 0;
    }
    if(array_key_exists('ios', $args) && $args['ios'] != $ios){
    	$result = 0;
    }
    if(array_key_exists('android', $args) && $args['android'] != $android){
    	$result = 0;
    }
    if(array_key_exists('blackberry', $args) && $args['blackberry'] != $blackberry){
    	$result = 0;
    }
    if(array_key_exists('windowsmobile', $args) && $args['windowsmobile'] != $windowsmobile){
    	$result = 0;
    }
    if(array_key_exists('generic', $args) && $args['generic'] != $generic){
    	$result = 0;
    }
    
    return $ctx->_hdlr_if($args, $content, $ctx, $repeat, $result);
}
?>
