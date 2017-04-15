function shareButtonDidClick(element){
    var href = "ios://share/WeChat";
    location.href = href;
};

function showOCAlert(element){
    var href = "ios://alert?token=OC_Alert";
    location.href= href;
};

function showWebViewAlert() {
    alert("webView Alert");
}
