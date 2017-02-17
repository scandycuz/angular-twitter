// 'use strict';

angular.module("app.mainApp")
.service('dataService', function($http) {
  this.pageNum = 1;

  this.getTweets = function(callback) {
    $http.get('/tweets.json?page=' + this.pageNum)
    .then(callback);
  };

  this.getNextPage = function(callback) {
    this.pageNum ++;
    $http.get('/tweets.json?page=' + this.pageNum)
    .then( function(response) {
      return response;
    }.bind(this))
    .then(callback);
  }

});
