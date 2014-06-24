<%@ page import="com.revizor.ReviwerStatus" %>

<%-- 
    One cell with author (avatar, his name and his decision)
--%>
<div class="reviewer">
    
    <g:if test="${reviewer?.image}">
        <img height="32" width="32" class="avatar img-rounded" src="${createLink(controller:'user', action:'avatar_image', id: reviewer?.ident())}" />
    </g:if>

    <span class="property-value" aria-labelledby="reviewers-label">${reviewer.username}</span>

    <g:if test="${status == ReviwerStatus.INVITED}">
        <span id="reviewer-${reviewer.ident()}-status-icon-id" class="glyphicon glyphicon-time"></span>
    </g:if>
    <g:elseif test="${status == ReviwerStatus.APPROVE}">
        <span id="reviewer-${reviewer.ident()}-status-icon-id" class="glyphicon glyphicon-thumbs-up accepted"></span>
    </g:elseif>
    <g:elseif test="${status == ReviwerStatus.DISAPPROVE}">
        <span id="reviewer-${reviewer.ident()}-status-icon-id" class="glyphicon glyphicon-thumbs-down disaccepted"></span>
    </g:elseif>
</div>