<header id="header" role="banner">
    <div id="logo">
        <div class="container">
            <div class="col-md-10 col-md-push-1 container-wrapper">
                <div class="col-sm-5 logo-wrapper">
                    <img class="img-responsive" src="${resource(dir:"images", file: "logo.gif") }">
                </div>
                %{--<div class="col-sm-6 col-sm-push-1 search-wrapper" >
                    <div class="header-left" >
                        <div id="search" >
                            <form>
                                <input type="text" name="q" placeholder="Search Here...." >
                                <input type="submit" value="Go" class="sbmt-button button">
                            </form>
                        </div>
                    </div>
                </div>--}%
            </div>
        </div>
    </div>
    <nav class="navbar navbar-default ">
        <div class="container">
            <div class="col-md-10 col-md-push-1 nav-wrapper">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><g:link controller="home" action="index">Home</g:link></li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Notes</a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '1']">1<sup>st</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '2']">2<sup>nd</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '3']">3<sup>rd</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '4']">4<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '5']">5<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '6']">6<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '7']">7<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'notes', semester: '8']">8<sup>th</sup> Semester</g:link></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Software</a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '1']">1<sup>st</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '2']">2<sup>nd</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '3']">3<sup>rd</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '4']">4<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '5']">5<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '6']">6<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '7']">7<sup>th</sup> Semester</g:link></li>
                                <li><g:link controller="home" action="view" params="[category: 'software', semester: '8']">8<sup>th</sup> Semester</g:link></li>
                            </ul>
                        </li>
                        <sec:ifAllGranted roles="ROLE_AUTHORIZED_USER">
                            <li><g:link controller="transFile" action="upload">Upload</g:link></li>
                        </sec:ifAllGranted>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li><g:link controller="user" action="list"> Setting</g:link></li>
                        </sec:ifAllGranted>
                        <li><g:loginControl /></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </nav>
</header>
