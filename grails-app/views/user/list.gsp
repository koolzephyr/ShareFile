<%@ page import="com.sharefile.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="template">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

%{--
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>
--}%

<div class="container" >
    <div class="col-md-10 col-md-push-1 ">
        <div id="list-user" class="content scaffold-list width" role="main">
            <div class="title head">
                <h1><g:message code="default.list.label" args="[entityName]"/></h1>
                <button class="new add"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                                      args="[entityName]"/></g:link></button>
            </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}"/>

                    <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}"/>

                    <g:sortableColumn property="role" title="${message(code: 'secRole.authority.label', default: 'Authority')}"/>

                    <g:sortableColumn property="detail" title="Details"/>
                </tr>
                </thead>
                <tbody>
                <g:each in="${userInstanceList}" status="i" var="userInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: userInstance, field: "id")}</td>

                        <td>${fieldValue(bean: userInstance, field: "username")}</td>

                        <g:findAll in="${userRoleInstanceList}" expr="it.secUser.id==userInstance.id">
                            <td>${fieldValue(bean: it.secRole, field: "authority")}</td>
                        </g:findAll>

                        <td><g:link action="show"
                                    id="${userInstance.id}">Details</g:link></td>

                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${userInstanceTotal}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
