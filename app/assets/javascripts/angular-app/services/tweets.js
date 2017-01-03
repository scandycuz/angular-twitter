// 'use strict';

angular.module("app.mainApp")
.service('dataService', function($http) {
  this.helloConsole = () => {
    console.log('This is the hello console service!');
  };

  this.getTweets = function(callback) {
    $http.get('/tweets.json')
    .then(callback)
    .then(renderTwitter());
  };

  function renderTwitter() {
    window.twttr = (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0],
        t = window.twttr || {};
      if (d.getElementById(id)) return t;
      js = d.createElement(s);
      js.id = id;
      js.src = "https://platform.twitter.com/widgets.js";
      fjs.parentNode.insertBefore(js, fjs);

      t._e = [];
      t.ready = function(f) {
        t._e.push(f);
      };

      return t;
    }(document, "script", "twitter-wjs"));
  }

});
