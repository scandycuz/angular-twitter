angular.module('app.mainApp')
.controller("mainCtrl", function($scope, dataService) {
    console.log('mainCtrl running');

    $scope.loaded = false;

    // load more tweets callback
    function appendNewTweets(response) {
      if (response === null) { return; }

      var existingTweets = $scope.tweets;
      var newTweets = response.data;

      for (var i = 0; i < newTweets.length; i++) {
        var tweet = newTweets[i];
        var screenName = tweet.user.screen_name;
        var tweetId = tweet.tweet_id_str;
        var url = "https://twitter.com/" + screenName + "/status/" + tweetId;
        $scope.urls.push(url);
      }

      $scope.tweets = existingTweets.concat(newTweets);
    }

    // load more tweets scroll event listener
    function loadOnScroll() {
      if (!$scope.loaded && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $scope.loaded = true;

        window.setTimeout(function() {
      		// actual callback
          dataService.getNextPage(appendNewTweets);
      	}, 400);
      }
    }

    $(window).on('scroll', loadOnScroll);

    // load twitter oembeds on load finish
    $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
      twttr.widgets.load();
      $scope.loaded = false;
    });

    // get initial tweets
    dataService.getTweets( function(response) {
      $scope.tweets = response.data;

      var urls = [];
      for (var i = 0; i < $scope.tweets.length; i++) {
        var tweet = $scope.tweets[i];
        var screenName = tweet.user.screen_name;
        var tweetId = tweet.tweet_id_str;
        var url = "https://twitter.com/" + screenName + "/status/" + tweetId;
        urls.push(url);
      }

      $scope.urls = urls;
    });

  }
);
