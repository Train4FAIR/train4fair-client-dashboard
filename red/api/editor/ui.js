/**
 * Copyright JS Foundation and other contributors, http://js.foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/
var express = require('express');
var fs = require("fs");
var path = require("path");
var Mustache = require("mustache");
var mime = require("mime");

var apiUtils = require("../util");

var theme = require("./theme");

var runtimeAPI;

var templateDir = path.resolve(__dirname+"/../../../editor/templates");
var editorTemplate;

module.exports = {
    init: function(_runtimeAPI) {
        runtimeAPI = _runtimeAPI;
        editorTemplate = fs.readFileSync(path.join(templateDir,"index.mst"),"utf8");
        Mustache.parse(editorTemplate);
    },

    ensureSlash: function(req,res,next) {
        var parts = req.originalUrl.split("?");
        if (parts[0].slice(-1) != "/") {
            parts[0] += "/";
            var redirect = parts.join("?");
            res.redirect(301,redirect);
        } else {
            next();
        }
    },
    icon: function(req,res) {
        var icon = req.params.icon;
        var scope = req.params.scope;
        var module = scope ? scope + '/' +  req.params.module : req.params.module;
        var opts = {
            user: req.user,
            module: module,
            icon: icon
        }
        runtimeAPI.nodes.getIcon(opts).then(function(data) {
            var contentType = mime.lookup(icon);
            res.set("Content-Type", contentType);
            res.send(data);
        }).catch(function(err) {
            apiUtils.rejectHandler(req,res,err);
        })
    },
    editor: function(req,res) {
        res.send(Mustache.render(editorTemplate,theme.context()));
    },
    editorResources: express.static(__dirname + '/../../../public')
};
