// 'use strict';

angular.module("app.mainApp")
.service('dataService', function($http) {
  this.helloConsole = function() {
    console.log('This is the hello console service!');
  };

  this.getTweets = function(callback) {
    $http.get('/tweets.json')
    .then(callback);
  };

});
