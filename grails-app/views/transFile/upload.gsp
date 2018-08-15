<%--
  Created by IntelliJ IDEA.
  User: zephyr
  Date: 9/6/15
  Time: 7:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content=
    "text/html; charset=UTF-8"/>
    <meta name="layout" content="template"/>
    <title>Post File</title>
</head>

<body>
<div class="container" >
    <div class="col-md-10 col-md-push-1 ">

        <g:hasErrors bean="${file}">
            <div class="validationerror">
                <g:renderErrors bean="${file}" as="list"/>
            </div>
        </g:hasErrors>
        <g:if test='${flash.message}'>
            <div class="message">${flash.message}</div>
        </g:if>
        <g:uploadForm action="save" method="post" enctype="multipart/form-data" class="inputform">
            <div class="title">
                <h1>Upload File</h1>
            </div>
            <fieldset>
                <dl>
                    <dt>Title</dt>
                    <dd><g:textField name="fileName" value="${file.fileName}" size="35" class="largeinput" required=""/></dd>
                    <dt>File </dt>
                    <dd><input type="file" name="file" required=""/></dd>
                    <dt>Image </dt>
                    <dd><input type="file" name="img" required=""/></dd>
                    <dt>Semester</dt>
                    <dd><select name="semester">
                            <option value="1">1st Semester</option>
                            <option value="2">2nd Semester</option>
                            <option value="3">3rd Semester</option>
                            <option value="4">4th Semester</option>
                            <option value="5">5th Semester</option>
                            <option value="6">6th Semester</option>
                            <option value="7">7th Semester</option>
                            <option value="8">8th Semester</option>
                        </select>
                    </dd>
                    <dt>Category</dt>
                    <dd>
                        <input type="radio" name="category" value="notes" checked/><label>Notes</label>
                        <input type="radio" name="category" value="software"/><label>Software</label>
                    </dd>
                </dl>
            </fieldset>
            <div class="sbmt">
                <g:submitButton name="save" value="save"/>
                <button><g:link controller="home">Cancel</g:link></button>
            </div>

        </g:uploadForm>
    </div>
</div>
</body>
</html>