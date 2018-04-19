<html>
   <title>Blog</title>
    <head>
   <link href="css/bootstrap.min.css" rel="stylesheet">
        <style>
        body {
            background-color: lightblue;
            text-align: center;
            }
        h1 {
            color: blue;
            font-family: verdana;
            font-size: 150%;
            text-align: center;
        }
       #p01  {
            text-align: left;
            margin-left:210px;
            color: red;
            font-family: courier;
            font-size: 160%;
        }
        #p02 {
                    text-align: right;
                    margin-right:210px;
                    color: red;
                    font-family: courier;
                    font-size: 160%;
                }
        input::placeholder {
        font-family: verdana;
        }
        textarea::placeholder {
        font-family: verdana;
        }

        .button {
            background-color: #e7e7e7;
            border: 2px solid blue;
            color: blue;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            display: inline-block;
        }
         p {display:inline}    }

a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

     background-color: #e7e7e7;
     border: 2px solid blue;
     color: blue;
     padding: 15px 32px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
     font-size: 16px;
     font-weight: bold;
     cursor: pointer;
     display: inline-block;
}


        </style>
    </head>
    <h1> Input Your Story Here:</h1>

    <body>
        <script src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.js"></script>
            <script>
            if (annyang) {
              // Let's define our first command. First the text we expect, and then the function it should call
              var commands = {
                'title *tag': function(param) {
                  document.getElementById("title_id").value = param
                },

                'content *tag': function(param) {
                                  document.getElementById("content_id").value = param
                                }
              };

              // Add our commands to annyang
              annyang.addCommands(commands);
                annyang.debug();
              // Start listening. You can call this here, or attach this call to an event, button, etc.
              annyang.start();
            }
        </script>
        <div class="header">${title}</div>
        <form action="${springMacroRequestContext.getContextPath()}/item/add" method="post">
            <input name="author" type="text" size="128" placeholder="Your Name" value="${author}"/>
             <br>
            <input id="title_id" name="title" type="text" size="128" placeholder="Title" value="${title}"/>

            <br>
            <textarea id="content_id" name="content" placeholder="Content" rows="25" cols="130">${content}</textarea>
            <br>
            <br>
            <p id="p01"> <a href='${springMacroRequestContext.getContextPath()}/list' class="button">Return to Main Page</a> </p>
            <p id="p02"> <input class="button button" type="submit" value="Save"></p>
        </form>
    </body>
</html>