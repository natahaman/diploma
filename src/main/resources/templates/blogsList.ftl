<html lang="en" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Blogs</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">
</head>

<body class="body-style">
<div class="container">
    <#if !isAuthorized>
        <div class="flex-box">
            <div class="login-block">
                <form class="form-signin" name="f" action="login" method='POST'>
                    <h2 class="form-signin-heading">Please sign in</h2>
                    <label for="inputUser" class="sr-only">Login</label>
                    <input name="username" type="text" id="inputUser" class="form-control"
                           placeholder="Login" required="" autofocus="">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input name="password" type="password" id="inputPassword" class="form-control"
                           placeholder="Password" required="">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                </form>
            </div>
            <div>
                <#include "topImage.ftl">
            </div>
        </div>
    <#else>
        <p class="text-align-right">
            <a class="btn btn-lg btn-primary" href="${springMacroRequestContext.getContextPath()}/logout" role="button">Logout</a>
        </p>
    </#if>
    <div>
        <h1>Latest Stories</h1>
        <p class="text-align-right">
            <a class="btn btn-lg btn-primary" href="${springMacroRequestContext.getContextPath()}/item/new" role="button">Add
                Post to Your Blog</a>
        </p>
    </div>
    <div>
            <#list blogsList as blogs>
                <div class="blog-post">
                    <h2 class="blog-post-title margin-bottom-0"><a href="${springMacroRequestContext.getContextPath()}/item/${blogs.id}">${blogs.title}</a></h2>
                    <p class="blog-post-meta">by ${blogs.author}</p>

                    <#--<p>This blog post shows a few different types of content that's supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>-->
                    <#--<hr>-->
                    <#--<p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>-->
                    <#--<blockquote>-->
                        <#--<p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>-->
                    <#--</blockquote>-->
                    <#--<p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>-->
                    <#--<h2>Heading</h2>-->
                    <#--<p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>-->
                    <#--<h3>Sub-heading</h3>-->
                    <#--<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>-->
                    <#--<pre><code>Example code block</code></pre>-->
                    <#--<p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>-->
                    <#--<h3>Sub-heading</h3>-->
                    <#--<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>-->
                    <#--<ul>-->
                        <#--<li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>-->
                        <#--<li>Donec id elit non mi porta gravida at eget metus.</li>-->
                        <#--<li>Nulla vitae elit libero, a pharetra augue.</li>-->
                    <#--</ul>-->
                    <#--<p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>-->
                    <#--<ol>-->
                        <#--<li>Vestibulum id ligula porta felis euismod semper.</li>-->
                        <#--<li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>-->
                        <#--<li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>-->
                    <#--</ol>-->
                    <#--<p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>-->
                </div>
                <#--<p>-->
                    <#--${blogs.author}-->
                    <#--<a href='${springMacroRequestContext.getContextPath()}/item/${blogs.id}'><h5 class="mb-1">${blogs.title}</h5></a>-->
                <#--</p>-->
            </#list>
    </div>
</div>
</body>
</html>