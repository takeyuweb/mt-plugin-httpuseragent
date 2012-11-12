<?php
    function smarty_function_mthttpuseragent($args, &$ctx) {
        return $_SERVER['HTTP_USER_AGENT'];
    }
?>