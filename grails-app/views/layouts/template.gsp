<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
        <g:layoutHead/>
        <r:layoutResources />
    </head>
    <body>
        <div id="wrapper">
            <g:render template="/layouts/header"/>
            <div class="contents">
                <g:layoutBody/>
                <r:layoutResources />
            </div>
        </div>
        <g:render template="/layouts/footer"/>
        <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
    </body>
</html>
