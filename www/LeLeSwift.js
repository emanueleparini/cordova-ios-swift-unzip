
var exec = require('cordova/exec');

exports.downloadConfig = function(success, error, url) {
    exec(success, error, "LeLeSwift", "downloadConfig", [url]);
};

exports.downloadResources = function(success, error, url) {
    exec(success, error, "LeLeSwift", "downloadResources", [url]);
};