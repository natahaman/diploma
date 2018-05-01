<html lang="en" xmlns="http://www.w3.org/1999/html">
    <head>
        <title>Blog</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/custom.css" rel="stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.js"></script>
        <script src="../js/voice.js"></script>
    </head>

    <body class="body-style">
    <div class="container">
        <div class="blog-post">
            <h2 class="blog-post-title">Input Your Story Here:</h2>
            <div class="text-align-right">
                <label class="form-check-label font-weight-400" for="checkbox_id">Enable voice recording</label>
                <input type="checkbox" class="form-check-input" id="checkbox_id" onchange="onChangeVoiceRecognition()">
            </div>
        <form action="${springMacroRequestContext.getContextPath()}/item/add" method="post">
            <label for="inputAuthor" class="sr-only">Author</label>
            <input name="author" type="text" id="inputAuthor" class="form-control"
                   placeholder="Your Name" required="" autofocus="" value="${author}" size="128">

            <label for="title_id" class="sr-only">Say title to start voice recording</label>
            <input name="title" type="text" id="title_id" class="form-control"
                   placeholder="Title" required="" value="${title}" size="128">

            <label for="content_id" class="sr-only">Content</label>
            <textarea id="content_id" name="content" class="form-control"
                      placeholder="Content" required="" rows="15" cols="130">${content}</textarea>

            <br>
            <a class="btn btn-lg btn-primary" href="${springMacroRequestContext.getContextPath()}/list" role="button">Return to Main Page</a>
            <button class="btn btn-lg btn-primary" type="submit">Save</button>
        </form>

    </div>
    </body>
</html>