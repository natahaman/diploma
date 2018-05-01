var modalDialogIsShown = false;

$( document ).ready(function() {
    $("#myModal")
        .on("shown.bs.modal", function(){onShow()})
        .on("hidden.bs.modal", function (){onHide()});

    $("#modal_sign_in").on("click", function () {
        window.location.replace(window.location.href)
    });

    $("body").on('keydown', function(e) {
        if(!modalDialogIsShown){
            return;
        }

        var keyCode = e.keyCode || e.which;

        if(keyCode == 9) {
            e.preventDefault();
            if(e.shiftKey) {
                getPrev(getNavigatedArray()).focus();
            }
            else {
                getNext(getNavigatedArray()).focus();
            }
        }
    });
});

function getPrev(elements) {
    var nextIndex = elements.length -1;
    elements.forEach(function (value, index) {
        if(value.is(":focus")){
            if(index - 1 >= 0){
                nextIndex = index - 1;
            }
        }
    });
    return elements[nextIndex];
}

function getNext(elements) {
    var nextIndex = 0;
    elements.forEach(function (value, index) {
        if(value.is(":focus")){
            if(index + 1 < elements.length){
                nextIndex = index + 1;
            }
        }
    });
    return elements[nextIndex];
}

function getNavigatedArray() {
    return [
        $("#modal_sign_in"),
        $("#modal_close"),
        $(".close")
    ]

}

function onShow() {
    modalDialogIsShown = true;
    $("#modal_sign_in").focus();
}

function onHide() {
    modalDialogIsShown = false;
}