<#assign spring=JspTaglibs["http://www.springframework.org/tags"]>

<div id="categories">
<#include "_helpus.ftl" />
    <ul>
        <li>
        <#if criteria.hasFilter()>
            <#if criteria.containsFilter("UnapprovedProductFilter")>
                <span class="UnapprovedContentFilter selected"><@spring.message code="unapprovedProductsFilter.desc" /></span>
            <#else>
                <a class="UnapprovedContentFilter"
                   href="${cp}spring/productList/filterByUnapprovedProducts"><@spring.message code="unapprovedProductsFilter.desc" /></a>
            </#if>
        <#else>
            <a class="UnapprovedContentFilter"
               href="${cp}spring/productList/filterByUnapprovedProducts"><@spring.message code="unapprovedProductsFilter.desc" /></a>
        </#if>
        </li>
    <#list categoryList as category>
        <#if category?? && category.name??>
            <li>
                <#if criteria.hasFilter()>
                    <#if criteria.containsFilter(category.name)>
                        <span class="selected">${category.name?html} (${category.approvedProductsInCategory})</span>
                    <#else>
                        <a href="${cp}spring/productList/filterByCategory?category=${category.id?url('utf-8')}">${category.name?html}
                            (${category.approvedProductsInCategory})</a>
                    </#if>
                <#else>
                    <a href="${cp}spring/productList/filterByCategory?category=${category.id?url('utf-8')}">${category.name?html}
                        (${category.approvedProductsInCategory})</a>
                </#if>
            </li>
        </#if>
    </#list>
    </ul>
</div>
