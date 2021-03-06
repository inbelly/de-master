<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"]/>
<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# inbelly: http://ogp.me/ns/fb/inbelly#">
    <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
    <title><@spring.message code="site.name"/>: <@tiles.insertAttribute name="title"/></title>
    <meta name="description" content="<@spring.message code="site.description" />"/>
<@tiles.insertAttribute name="alternateFeedLink" />
<@tiles.insertAttribute name="printStylesheet" />
<@tiles.insertAttribute name="fbMetadata" />


    <link rel="shortcut icon" href="${cp}images/favicon.ico" type="image/ico"/>

    <link rel="stylesheet" href="${cp}styles/reset.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${cp}styles/main.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${cp}styles/content.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="${cp}styles/print.css" type="text/css" media="print"/>
    <link rel="stylesheet" href="${cp}styles/jquery.datepicker.css" type="text/css"/>
    <link rel="stylesheet" href="${cp}resources/dijit/themes/tundra/tundra.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${cp}styles/jquery.autocomplete.css"/>
    <link rel="stylesheet" type="text/css" href="${cp}styles/popbox.css"/>
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${cp}styles/darkside.css" type="text/css" media="screen"><![endif]-->

    <script type="text/javascript" src="${cp}js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="${cp}js/jquery.autocomplete.min.js"></script>
    <script type="text/javascript" src="${cp}js/jquery.bgiframe.min.js"></script>
    <script type="text/javascript" src="${cp}js/jquery.jeditable.js"></script>
    <script type="text/javascript" src="${cp}js/jquery-barcode-1.3.3.min.js"></script>
    <script type="text/javascript" src="${cp}js/jquery-ui-1.7.1.custom.min.js"></script>
    <script type="text/javascript" src="${cp}js/jquery.Jcrop.js" charset="utf-8"></script>
    <script type="text/javascript" src="${cp}js/jquery.datepicker.js" charset="utf-8"></script>
    <script type="text/javascript" src="${cp}js/popbox.min.js" charset="utf-8"></script>

    <script type="text/javascript" src="${cp}resources/spring/Spring.js"></script>
    <script type="text/javascript" src="${cp}resources/dojo/dojo.js"></script>
    <script type="text/javascript" src="${cp}resources/spring/Spring-Dojo.js.uncompressed.js"></script>

    <script type="text/javascript" src="${cp}js/functions.js"></script>
    <script src="${cp}js/lib.js" type="text/javascript" charset="utf-8"></script>
    <script src="${cp}js/widgets.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="tundra">
<!--[if lt IE 8]>
<div id="darkside">
    Please install an updated version of
    <a href="http://www.microsoft.com/windows/internet-explorer/worldwide-sites.aspx">Internet Explorer</a>
    or download another browser, like <a href="http://www.getfirefox.com/">Firefox</a>,
    <a href="http://www.apple.com/safari/">Safari</a>,
    <a href="http://www.google.com/chrome">Chrome</a>,
    <a href="http://www.opera.com/browser/">Opera</a>.
</div>
<![endif]-->
<div id="fb-root"></div>
<div id="wrapper-outer">
    <div id="wrapper" class="clearfix">
        <div id="top" class="clearfix">
        <@tiles.insertAttribute name="header"/>
					<@tiles.insertAttribute name="barcode" />
					<@tiles.insertAttribute name="legend" />
        </div>
    <@tiles.insertAttribute name="breadcrumbs" />
        <hr class="clear mbh"/>
        <div id="content" class="clearfix">
        <@tiles.insertAttribute name="body"/>
        </div>
        <hr/>
        <div id="footer" class="clearfix">
        <@tiles.insertAttribute name="footer"/>
        </div>
    </div>
</div>

<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    try {
        var pageTracker = _gat._getTracker("UA-1622602-12");
        pageTracker._setDomainName(".inbelly.co.uk");
        pageTracker._trackPageview();
    } catch (err) {
    }</script>
</body>
<!-- start Mixpanel -->
<script type="text/javascript">(function (e, b) {
    if (!b.__SV) {
        var a, f, i, g;
        window.mixpanel = b;
        a = e.createElement("script");
        a.type = "text/javascript";
        a.async = !0;
        a.src = ("https:" === e.location.protocol ? "https:" : "http:") + '//cdn.mxpnl.com/libs/mixpanel-2.2.min.js';
        f = e.getElementsByTagName("script")[0];
        f.parentNode.insertBefore(a, f);
        b._i = [];
        b.init = function (a, e, d) {
            function f(b, h) {
                var a = h.split(".");
                2 == a.length && (b = b[a[0]], h = a[1]);
                b[h] = function () {
                    b.push([h].concat(Array.prototype.slice.call(arguments, 0)))
                }
            }

            var c = b;
            "undefined" !== typeof d ? c = b[d] = [] : d = "mixpanel";
            c.people = c.people || [];
            c.toString = function (b) {
                var a = "mixpanel";
                "mixpanel" !== d && (a += "." + d);
                b || (a += " (stub)");
                return a
            };
            c.people.toString = function () {
                return c.toString(1) + ".people (stub)"
            };
            i = "disable track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.track_charge people.clear_charges people.delete_user".split(" ");
            for (g = 0; g < i.length; g++)f(c, i[g]);
            b._i.push([a, e, d])
        };
        b.__SV = 1.2
    }
})(document, window.mixpanel || []);
mixpanel.init("5176d8fcff8879e8a7c98a1f3bfb9bcc");</script>
<!-- end Mixpanel -->
</html>
