<%@ page import="com.sharefile.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="template">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
    <div class="container" >
        <div class="col-md-10 col-md-push-1 ">
            <div id="create-user" class="content scaffold-create width" role="main">
                <div class="title head">
                    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
                    <button class="new list"><g:link class="" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></button>
                </div>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${userInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${userInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                    error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <div class="align">
                    <g:form action="save">
                        <fieldset class="form">
                            <g:render template="form"/>
                            <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')}">
                                <label for="role">
                                    Role
                                </label>
                                <g:select  name="role" from="${['ROLE_USER', 'ROLE_AUTHORIZED_USER', 'ROLE_ADMIN']}"  value='USER'/>
                            </div>
                        </fieldset>
                        <fieldset class="form">
                            <g:submitButton name="create" class="save"
                                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                        </fieldset>
                    </g:form>
                </div>

            </div>
        </div>
    </div>



</body>
</html>
