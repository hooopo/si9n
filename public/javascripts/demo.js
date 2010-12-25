$(function(){


    // Dialog
    $('#dialog').dialog({
        autoOpen: false,
        width: 600,
        buttons: {
            "确定": function() {
                $(this).dialog("close");
            },
            "取消": function() {
                $(this).dialog("close");
            }
        }
    });

    // Dialog Link
    $('.signature-new').click(function(){
        $('#dialog').dialog('open');
        return false;
    });

//    //hover states on the static widgets
//    $('#dialog_link, ul#icons li').hover(
//        function() {
//            $(this).addClass('ui-state-hover');
//        },
//        function() {
//            $(this).removeClass('ui-state-hover');
//        }
//        );

});
