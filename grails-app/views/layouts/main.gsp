<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <asset:javascript src="application"/>
    <asset:javascript src="bootstrap-all.js"/>
    <asset:stylesheet src="bootstrap-all.css"/>
    <asset:stylesheet src="font-awesome-all.css"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Casa Rural</title>

    <g:layoutHead/>
</head>

<body role="presentation">
<div id="wrap">
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-left" href="#">
                    <asset:image src="casarural/logo.png" style="display: inline-block;" width="50px"
                                 height="50px"/>
                </a>
            </div>

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><g:link class="homeButton" action="index">Home</g:link></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
</div>
%{--<div class="container-fluid">
    <div class="row">
        <div class="span logo">
            <a href="">
                <div class="row">
                    <div class="span3 logo">
                        <h1>
                            Bootstrap
                            <span>Hotel</span>
                        </h1>
                        <p>★★★★☆</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="span6 pull-right main-menu">
            <div class="navbar">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="nav-collapse">
                    <ul class="nav nav-pills">
                        <li class="active"><a href="index.html">Home</a></li>
                        <li class=""><a href="rooms.html">Rooms</a></li>
                        <li class=""><a href="facilities.html">Facilities</a></li>
                        <li class=""><a href="gallery.html">Gallery</a></li>
                        <li class=""><a href="map.html">Map</a></li>
                        <li class=""><a href="book-start.html">Book</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>--}%
%{--<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            --}%%{--<ul class="nav navbar-nav navbar-right">--}%%{--
            --}%%{--<li><a href="../navbar/">Default</a></li>--}%%{--
            --}%%{--<li><a href="../navbar-static-top/">Static top</a></li>--}%%{--
            --}%%{--<li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>--}%%{--
            --}%%{--</ul>--}%%{--
        </div><!--/.nav-collapse -->
    </div>
</nav>--}%
<div class="container theme" role="main">
    <g:layoutBody/>
    <asset:javascript src="application"/>
</div>
</div>
<!--Footer-->
<footer class="navbar-fixed-bottom">
    <div class="container-fluid">
        <span>
            <nobr>
                <div id='loginLinkContainer' class="centered">
                    <sec:ifLoggedIn>
                        Logged in as <sec:username/> (<g:link controller='logout'>Logout</g:link>)
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <g:link controller='login'>Login</g:link>
                    </sec:ifNotLoggedIn>

                    <sec:ifSwitched>
                        <a href='${request.contextPath}/j_spring_security_exit_user'>
                            Resume as <sec:switchedUserOriginalUsername/>
                        </a>
                    </sec:ifSwitched>
                </div>
            </nobr>
        </span>
    </div>

    <!--Copyright-->
    <div class="footer-copyright">
        <div class="container-fluid text-center">
            © 2018 Copyright: <a href="https://www.rural.com">Rural.com</a>

        </div>
    </div>
    <!--/.Copyright-->

</footer>
<!--/.Footer-->

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

</body>
</html>

%{--
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
    <asset:javascript src="application"/>
    <asset:stylesheet src="application"/>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="${asset.image(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${asset.image(src: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${asset.image(src: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead/>
</head>

<body role="document">
<casarural:mainMenu />

<div class="container-fluid">
    <g:layoutBody/>
</div>
</body>

</html>
--}%
