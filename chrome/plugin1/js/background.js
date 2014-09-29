chrome.runtime.onInstalled.addListener(function(){
    chrome.contextMenus.create({
        'id':'saveall',
        'contexts':['image'],
        'title':'保存所有图片',
    });
});

chrome.contextMenus.onClicked.addListener(function(info, tab){
    //alert(info.srcUrl);
    //window.open(info.srcUrl);
    window.showModalDialog('http://localhost/wp/snsBlog/admin/index/capture?url='+info.srcUrl);
    return;
    if(info.menuItemId == 'saveall'){
        chrome.tabs.executeScript(tab.id, {file: 'main.js'}, function(results){
            if (results && results[0] && results[0].length){
                results[0].forEach(function(url) {
                    chrome.downloads.download({
                        url: url,
                        conflictAction: 'uniquify',
                        saveAs: false
                    });
                });
            }
        });
    }
});