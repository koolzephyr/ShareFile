<%@ page import="com.sharefile.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="template">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
    <div class="container" >
        <div class="col-md-10 col-md-push-1 ">

            <div id="show-user" class="content scaffold-show width" role="main">
                <div class="title head">
                    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
                    <button class="new list"><g:link class="" action="list"><g:message code="default.list.label"
                                                                                       args="[entityName]"/></g:link></button>
                    <button class="new add"><g:link class="" action="create"><g:message code="default.new.label"
                                                                                        args="[entityName]"/></g:link></button>
                </div>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <ol class="property-list user">

                    <g:if test="${userInstance?.username}">
                        <li class="fieldcontain">
                            <span id="username-label" class="property-label"><g:message code="user.username.label"
                                                                                        default="Username"/></span>

                            <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}"
                                                                                                        field="username"/></span>

                        </li>
                    </g:if>

                    <g:if test="${userRoleInstance?.secRole?.authority}">
                        <li class="fieldcontain">
                            <span id="authority-label" class="property-label"><g:message code="user.role.label"
                                                                                         default="Authority"/></span>

                            <span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${userRoleInstance}"
                                                                                                         field="secRole.authority"/></span>
                        </li>
                    </g:if>

                    <g:if test="${userInstance?.email}">
                        <li class="fieldcontain">
                            <span id="email-label" class="property-label"><g:message code="user.email.label"
                                                                                     default="Email"/></span>

                            <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}"
                                                                                                     field="email"/></span>

                        </li>
                    </g:if>

                    <g:if test="${userInstance?.accountExpired}">
                        <li class="fieldcontain">
                            <span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label"
                                                                                              default="Account Expired"/></span>

                            <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                                    boolean="${userInstance?.accountExpired}"/></span>

                        </li>
                    </g:if>

                    <g:if test="${userInstance?.accountLocked}">
                        <li class="fieldcontain">
                            <span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label"
                                                                                             default="Account Locked"/></span>

                            <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                                    boolean="${userInstance?.accountLocked}"/></span>

                        </li>
                    </g:if>

                    <g:if test="${userInstance?.enabled}">
                        <li class="fieldcontain">
                            <span id="enabled-label" class="property-label"><g:message code="user.enabled.label"
                                                                                       default="Enabled"/></span>

                            <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                                    boolean="${userInstance?.enabled}"/></span>

                        </li>
                    </g:if>

                    <g:if test="${userInstance?.passwordExpired}">
                        <li class="fieldcontain">
                            <span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label"
                                                                                               default="Password Expired"/></span>

                            <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                                    boolean="${userInstance?.passwordExpired}"/></span>

                        </li>
                    </g:if>

                </ol>

                <div class="align">
                    <g:form>
                        <fieldset class="form">
                            <g:hiddenField name="id" value="${userInstance?.id}"/>

                            <button class="new edit"><g:link action="edit" id="${userInstance?.id}">
                                <g:message code="default.button.edit.label" default="Edit"/></g:link></button>

                            <g:actionSubmit class="delete" action="delete"
                                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                        </fieldset>
                    </g:form>
                </div>

            </div>

        </div>
    </div>

</body>
</html>
