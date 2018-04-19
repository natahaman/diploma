<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>All Blogs</title>
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
    <#if !isAuthorized>

    <div class="container">
           <form class="form-signin" name="f" action="login" method='POST'>
              <h2 class="form-signin-heading">Please sign in</h2>
              <label for="inputUser" class="sr-only">Login</label>
              <input name="username" type="text" id="inputUser" class="form-control" placeholder="Email address" required="" autofocus="">
              <label for="inputPassword" class="sr-only">Password</label>
              <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
              <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
           </form>
    </div>

    <#else>
        <p id="p02"> <a href='${springMacroRequestContext.getContextPath()}/logout' class="button">Logout</a> </p>
    </#if>
        <div class="header">Latest Stories</div>

          <p id="p02"> <a href='${springMacroRequestContext.getContextPath()}/item/new' class="button">Add Post to Your Blog</a> </p>


        <div>
            <#list blogsList as blogs>
                <p>${blogs.author} <a href='${springMacroRequestContext.getContextPath()}/item/${blogs.id}'>${blogs.title}</a></p>
            </#list>
        </div>
    </body>
</html>