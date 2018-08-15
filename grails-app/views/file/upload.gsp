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
    <g:uploadForm action="save" method="post" enctype="multipart/form-data" class="inputform">
        <fieldset>
            <dl>
                <dt>Title</dt>
                <dd><g:textField name="fileName" value="${file.fileName}" size="35" class="largeinput"/></dd>
                <dt>File </dt>
                <dd><input type="file" name="file" value=""/></dd>
                <dt>Image </dt>
                <dd><input type="file" name="img"/></dd>
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
                    <input type="radio" name="category" value="notes"/><label>Notes</label>
                    <input type="radio" name="category" value="software"/><label>Software</label>
                </dd>
            </dl>
        </fieldset>
        <g:submitButton name="save" value="save"/> 
        <g:link controller="home">Cancel</g:link>
    </g:uploadForm>
        </div>
    </div>
</body>
</html>