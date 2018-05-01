<html>
   <title>Blog</title>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/custom.css" rel="stylesheet">
    </head>
    <body class="body-style">
    <div class="container">
        <div class="blog-post">
            <h2 class="blog-post-title">${title}</h2>
            <div class="blog-post-meta"><p>
                Blog by ${author} on ${date}
            </p></div>
            <div>
                <label for="content_id" class="sr-only">Content</label>
                <textarea readonly id="content_id" name="content" class="form-control" style="background-color: lightblue;"
                          placeholder="Content" rows="15" cols="130">${content}</textarea>
            </div>
            <br>
            <br>
            <a class="btn btn-lg btn-primary" href="${springMacroRequestContext.getContextPath()}/list" role="button">Return to Main Page</a>
            <#if isAuthorized>
            <a class="btn btn-lg btn-primary" href="${springMacroRequestContext.getContextPath()}/item/remove/${id}" role="button">Remove</a>
            </#if>
        </div>
    </div>
   </body>
</html>