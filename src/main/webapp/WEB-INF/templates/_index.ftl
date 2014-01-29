<#assign tiles=JspTaglibs["http://tiles.apache.org/tags-tiles"]/>
<#assign form=JspTaglibs["http://www.springframework.org/tags/form"]/>
<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>

<div id="products" class="products-list columns-2">
<#if (products?? && products?size > 0)>
    <#list products as p>
        <div class="product <#if 0 == (p_index + 1) % 2>last</#if>">
            <#if !p.approved>
                <img src="${cp}img/aproval_1.png" alt="not approved" class="not-approved"
                     title="<@spring.message code="productList.productNotApproved" />"/>
            </#if>
            <#include "productItem.ftl"/>
        </div>
        <#if (5 == p_index)>
            <#break/>
        </#if>
    </#list>
    <p><a href="${cp}spring/productList?clear=yes">See all</a></p>
<#else/>
    <p>Inga produkter</p>
</#if>
</div>

<div id="blog">
<#assign smallHelp = true />
<#include "_helpus.ftl" />
    <div class="post clearfix">
        <p><@spring.message code="index.block.idea"/></p>

        <p><@spring.message code="index.block.sources"/></p>

        <p><@spring.message code="index.block.goal"/></p>

        <p><@spring.message code="index.block.challenge"/></p>

        <p><@spring.message code="index.block.join"/></p>

        <p><a href="http://blog.inbelly.co.uk/?p=18#respond"><@spring.message code="index.tellUsWhatYouThink" /></a></p>

    </div>
<#--                    
                    	<#if feed??>
							<#list feed.entries as entry>
		                        <div class="post clearfix">
			                		<h3><a href="${entry.link}">${entry.title}</a></h3>
			                		<em class="date">${entry.publishedDate?string('yyyy-MM-dd')}</em>
									<p>${entry.description.value}&nbsp;<a href="${entry.link}"><@spring.message code="index.blog.more"/></a></p>
		                        </div>
                        		<#if (entry_index > 2)>
                        			<#break/>
                        		</#if>
                        	</#list>
	                        <script type="text/javascript">
	                        //<![CDATA[
	                            lib.ready(function() {
	                                jQuery('.alignleft.size-full').addClass('image');
	                            })
	                        //]]>
	                        </script>
                        </#if>  
-->
<#assign smallHelp = true />
<#include "_facebook.ftl" />
</div>
                    
