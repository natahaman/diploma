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
        textarea{
             resize: none;
             outline: none;
             overflow: auto;
             width: 1000px;
             height: 400px;
             background-color:lightblue;
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
            label {
            color: #8B4513;
            font-style: oblique;
            display: block;
            width: 150px;
            float: left;
        }
      </style>


    </head>
    <h1> ${title}</h1>

    <body>
      <div>
           <br>
            <label> Blog by ${author} on ${date}</label>
      </div>
      <div>
        <textarea readonly>  ${content}</textarea>
          </div>
        <br>
        <br>
          <p id="p01"> <a href='${springMacroRequestContext.getContextPath()}/list' class="button">Return to Main Page</a> </p>
          <p id="p01"> <a href='${springMacroRequestContext.getContextPath()}/item/remove/${id}' class="button">Remove</a> </p>
   </body>
</html>