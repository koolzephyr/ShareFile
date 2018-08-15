<%--
  Created by IntelliJ IDEA.
  User: zephyr
  Date: 9/7/15
  Time: 7:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="template"/>
    <title> Share File </title>
</head>

<body>
    <div class="container" >
        <div class="col-md-10 col-md-push-1 ">
            <div>
                <g:each in="${files}" var="file">
                    <div class="col-sm-4 col-lg-4 col-md-4 thumb">
                        <div class="thumbnail">
                            <img class="Photo" src="${createLink(controller:'transFile', action:'imageData', params:[ id:file.image.id])}" />
                            <div class="caption">
                                %{--<h6 class="pull-right">${file.fileSize} KB</h6>--}%
                                <sec:ifAnyGranted roles="ROLE_USER,ROLE_AUTHORIZED_USER">
                                    <h5><a href="${g.createLink(controller: 'transFile', action:'download', id: file.id)}">
                                        ${file.fileName}.${file.extension}</a>
                                    </h5>
                                </sec:ifAnyGranted>
                                <sec:ifNotGranted roles="ROLE_USER">
                                    <h5>${file.fileName}.${file.extension}</h5>
                                </sec:ifNotGranted>

                            </div>
                            <div class="user">
                                <p class="pull-right">Uploaded by: ${file.user.username}</p>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>

        </div>
    </div>
</body>
</html>