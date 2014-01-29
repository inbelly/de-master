<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]/>
<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>

<#-- h3 class="mbh">Show that you care</h3 -->
<div class="help-us <#if smallHelp?? && smallHelp == true>small<#else/>big</#if>">
    <span class="c top"></span>

    <div class="content">
        <a href="${cp}spring/createProduct" class="ac active-fix-widget">
            <span class="c left"></span>
            <span class="c right"></span>
            <span class="content"><@spring.message code="helpus.addProduct" /></span>
        </a>
    </div>
    <span class="c bottom"></span>
</div>
