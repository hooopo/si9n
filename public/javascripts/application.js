// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    $('a[data-popup]').live('click', function(e) {
        window.open($(this).attr("href"));
        e.preventDefault();
    });

    $('#dialog').dialog({
        autoOpen: false,
        width: 430
    });

    var notice = $('meta[name=notice]').attr('content');
    if (notice != null && notice != "") {
        $.jGrowl(notice);
    }
});

