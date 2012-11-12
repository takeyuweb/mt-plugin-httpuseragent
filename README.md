mt-plugin-httpuseragent
=======================

シンプルかつ強力なUserAgentによる出し分けを実現するMovableTypeプラグイン。スタティック／ダイナミックパブリッシング両対応。

## How to use

    <h1>
        <mt:IfHttpUserAgent smartphone="1" rtrim="1">
            Smartphone
        <mt:Else>
            <mt:IfHttpUserAgent featurephone="1" rtrim="1">
                Featurephone
            <mt:Else>
                <mt:IfHttpUserAgent tablet="1" rtrim="1">
                    Tablet PC
                <mt:Else>
                    Other (PC)
                </mt:Else>
                </mt:IfHttpUserAgent>
            </mt:Else>
            </mt:IfHttpUserAgent>
        </mt:Else>
        </mt:IfHttpUserAgent>
    </h1>
    
    <h2>HTTP_USER_AGENT</h2>
    <$MTHTTPUserAgent escape="html"$>
    
    <h2>UserAgent</h2>
    <table>
        <tr>
            <td>docomo</td>
            <td><mt:IfHttpUserAgent docomo="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>au</td>
            <td><mt:IfHttpUserAgent au="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>softbank</td>
            <td><mt:IfHttpUserAgent softbank="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>ios</td>
            <td><mt:IfHttpUserAgent ios="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>android</td>
            <td><mt:IfHttpUserAgent android="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>blackberry</td>
            <td><mt:IfHttpUserAgent blackberry="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>windowsmobile</td>
            <td><mt:IfHttpUserAgent windowsmobile="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
    </table>
    
    <h2>Device Type</h2>
    <table>
        <tr>
            <td>tablet</td>
            <td><mt:IfHttpUserAgent tablet="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>smartphone</td>
            <td><mt:IfHttpUserAgent smartphone="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>featurephone</td>
            <td><mt:IfHttpUserAgent featurephone="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
        <tr>
            <td>generic</td>
            <td><mt:IfHttpUserAgent generic="1">YES<mt:Else>NO</mt:IfHttpUserAgent></td>
        </tr>
    </table>
    
    <h2>Example</h2>
    <h3>iPad</h3>
    <mt:IfHttpUserAgent ios="1" tablet="1">YES<mt:Else>NO</mt:IfHttpUserAgent>


## Contributing to mt-plugin-httpuseragent

Fork, fix, then send me a pull request.

## Copyright

Copyright© 2012 Yuichi Takeuchi, released under the MIT license
