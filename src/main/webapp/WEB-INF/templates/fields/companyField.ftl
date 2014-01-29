<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]/>
<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"]/>
<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>
<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>

<div class="field">
    <label for="company"><@spring.message code="company.producer" />:</label>

    <div class="text">
        <h3 id="company" class="editable"><#if product.company??>${product.company?html}<#else/>not specified</#if></h3>
        <a id="companyEdit" href="javascript:void(0);" class="action edit"><@spring.message code="eTable.edit"/></a>
    </div>
</div>
<#if product.canBeEditedBy(currentUser)>
<script type="text/javascript">
    //<![CDATA[
    lib.ready(function () {
        jQuery("#company").editable("${cp}spring/product/updateValue",
                {
                    tooltip: '<@spring.message code="category.clickHereToEdit" />',
                    cancel: '<@spring.message code="category.clickHereToEdit" />',
                    submit: 'OK',
                    placeholder: '<@spring.message code="category.clickHere" />',
                    onblur: 'ignore',
                    id: 'field',
                    ajaxoptions: { cache: false, type: 'GET' },
                    indicator: '<span class="loadingIndicator"><img src="${cp}images/ajax-loader.gif"/><b><@spring.message code="barcode.saving" /></b></span>',
                    submitdata: {id: ${product.id},
                        unique: false },
                    onerror: function (settings, original, xhr) {
                        return processFieldUpdateError(settings, original, xhr);
                    },
                    data: function (value, settings) {
                        var ret = value;
                        if (value.match(/^'+$/)) {
                            ret += "''";
                        }
                        if (value.match(/^"+$/)) {
                            ret += "\"\"";
                        }

                        console.log(ret);

                        return ret;
                    }
                }
        );
        bindEditFieldClickHandler("#companyEdit", "#company");
    })
    //]]>
</script>
</#if>