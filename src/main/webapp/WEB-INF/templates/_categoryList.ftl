<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>
<div id="categories">
    <ul>
        <li>
            <#if criteria.hasFilter()>
                <#if criteria.containsFilter("UnapprovedContentFilter")>
                   <span class="UnapprovedContentFilter selected">Unapproved products</span>
                <#else>
                    <a class="UnapprovedContentFilter" href="${cp}spring/productList/filterByUnapprovedProducts">Unapproved products</a>
                </#if>
            <#else>
                <a class="UnapprovedContentFilter" href="${cp}spring/productList/filterByUnapprovedProducts">Unapproved products</a>
            </#if>
        </li>
        <#list categoryList as category>
            <#if category?? && category.name??>
                <li>
                    <#if criteria.hasFilter()>
                        <#if criteria.containsFilter(category.name)>
                            <span class="selected">${category.name?html} (${category.approvedProductsInCategory})</span>
                        <#else>
                            <a href="${cp}spring/productList/filterByCategory?category=${category.id?url('utf-8')}">${category.name?html} (${category.approvedProductsInCategory})</a>
                        </#if>
                    <#else>
                        <a href="${cp}spring/productList/filterByCategory?category=${category.id?url('utf-8')}" >${category.name?html} (${category.approvedProductsInCategory})</a>
                    </#if>
                </li>
            </#if>
        </#list>
    </ul> 
    <#include "_helpus.ftl" />
</div>