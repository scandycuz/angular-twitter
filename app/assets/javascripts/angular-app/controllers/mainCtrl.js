angular.module('app.mainApp')
.controller("mainCtrl", ["$scope", "dataService", function($scope, dataService) {
    console.log('mainCtrl running');

    $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
      twttr.widgets.load();
    });

    dataService.getTweets( function(response) {
      $scope.tweets = response.data;

      var urls = [];
      for (var i = 0; i < $scope.tweets.length; i++) {
        var tweet = $scope.tweets[i];
        var screenName = tweet.user.screen_name;
        var tweetId = tweet.id_str;
        var url = "https://twitter.com/" + screenName + "/status/" + tweetId;
        urls.push(url);
      }

      $scope.urls = urls;
      console.log(urls);
      console.log($scope.tweets);
    });
  }]
);
