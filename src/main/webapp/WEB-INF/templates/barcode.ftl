<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>

<div id="search" class="clearfix">
    <form id="search-form" method="get" action="${cp}spring/search">
        <input id="q" type="text" name="q" class="search-input" />
        <button type="submit"><@spring.message code="search.search" /></button>
    </form>
    <p id="search-note" class="note"><small><@spring.message code="search.enterBarcode" /></small></p>
</div>

<script type="text/javascript">
// <![CDATA[
lib.widget.search.run(lib.dom.byId("search-form"), { placeholder: "KONTROLLERA DIN MAT!" });
// ]]>
</script>