angular.module('app.mainApp')
.controller("mainCtrl", function($scope, dataService) {
    console.log('mainCtrl running');

    $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
      twttr.widgets.load();
    });

    dataService.getTweets( (response) => {
      $scope.tweets = response.data;

      let urls = [];
      for (let i = 0; i < $scope.tweets.length; i++) {
        let tweet = $scope.tweets[i];
        let screenName = tweet.user.screen_name;
        let tweetId = tweet.id_str;
        let url = `https://twitter.com/${screenName}/status/${tweetId}`;
        urls.push(url);
      }

      $scope.urls = urls;
      console.log(urls);
      console.log($scope.tweets);
    });
  }
);
