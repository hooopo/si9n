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


function postToQqWeibo(url, title){
    var _t = encodeURI(title);
    var _url = encodeURIComponent(url);
    var _appkey = encodeURI('03acaf417aa94e22ae4956e9c980514a');//你从腾讯获得的appkey
    var _pic = encodeURI('');//（例如：var _pic='图片url1|图片url2|图片url3....）
    var _site = 'http://www.hooopo.com';//你的网站地址
    var _u = 'http://v.t.qq.com/share/share.php?url='+_url+'&appkey='+_appkey+'&site='+_site+'&pic='+_pic+'&title='+_t;
    openWindow(_u);
}

function postToSinaWeibo(url, title){
    var _t = encodeURI(title);
    var _url = encodeURIComponent(url);
    var _appkey = encodeURI('403062089');
    var _pic = encodeURI('');
    var _relatedUid = "";
    var _u = "http://service.t.sina.com.cn/share/share.php?url=" + _url +  "&appkey=" + _appkey + "&title=" + _t + "&pic=" + _pic + "&ralateUid=" + _relatedUid;
    openWindow(_u);
}

function shareToDouban(url, title){
    var _t   = encodeURI(title);
    var _url = encodeURIComponent(url);
    var _u   = "http://www.douban.com/recommend/?url=" + _url + "&title=" + _t;
    openWindow(_u);
}

function shareToRenren(url, title){
    var _t   = encodeURI(title);
    var _url = encodeURIComponent(url);
    var _u   = "http://share.renren.com/share/buttonshare.do?link=" + _url + "&title=" + _t;
    openWindow(_u);
}

function openWindow(url){
    window.open(url, '语录网', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no');
}