function onChangeVoiceRecognition(){
    var isChecked = document.getElementById("checkbox_id").checked;
    if (annyang) {
        if(isChecked){
            annyang.start();
        }else {
            annyang.abort();
        }
    }
}

if (annyang) {
    // Let's define our first command. First the text we expect, and then the function it should call
    var commands = {
        'title *tag': function(param) {
            document.getElementById("title_id").value = param
        },

        'content *tag': function(param) {
            document.getElementById("content_id").value = param
        },

        'add content *tag': function(param) {
            var currentValue = document.getElementById("content_id").value;
            document.getElementById("content_id").value = currentValue + '\n' + param
        }
    };

    // Add our commands to annyang
    annyang.addCommands(commands);
    annyang.debug();
}