angular.module('app.mainApp')
.controller("mainCtrl", function($scope, dataService) {
    console.log('mainCtrl running');

    $scope.loaded = false;
    $scope.noTweets = false;

    // if (!localStorage.hideBanner) {
      $('.info-header').removeClass('hidden');
    // } else {
      // $('about-link').removeClass('hidden');
    // }

    $('.about-link a').click(function(e) {
      e.preventDefault();
      $('.info-header').toggle();
      $(window).on('scroll', removeBanner);
    })

    // remove info banner on scroll or close
    function closeBanner() {
      var $banner = $('.info-header');
      var $htmlContent = $('.info-header p');
      var $closeButton = $('.info-header i');
      $(window).off('scroll', removeBanner);
      $banner.slideUp();
      $closeButton.animate({
        opacity: 0.25,
        marginTop: "-=280"
      }, 600);
      $htmlContent.animate({
        opacity: 0.25,
        marginTop: "-=280"
      }, 600, function() {
        localStorage.hideBanner = true;
        // $('.about-link').removeClass('hidden');
        $closeButton.animate({
          opacity: 1,
          marginTop: "+=280"
        }, 600);
        $htmlContent.animate({
          opacity: 1,
          marginTop: "+=280"
        }, 600);
      });
    }
    function removeBanner() {
      var $banner = $('.info-header');
      var $htmlContent = $('.info-header p');
      if ($(window).scrollTop() > 40) {
        closeBanner();
      }
    }
    $(window).on('scroll', removeBanner);
    $('.info-header i').on('click', closeBanner);

    // load more tweets callback
    function appendNewTweets(response) {
      if (response === null) { return; }

      var existingTweets = $scope.tweets;
      var newTweets = response.data;

      var urls = [];
      for (var i = 0; i < newTweets.length; i++) {
        var tweet = newTweets[i];
        var screenName = tweet.user.screen_name;
        var tweetId = tweet.tweet_id_str;
        var url = "https://twitter.com/" + screenName + "/status/" + tweetId;
        urls.push(url);
      }

      // return if no more tweets
      if (!newTweets.length) {
        return $scope.noTweets = true;
      }

      $scope.urls = $scope.urls.concat(urls);
      $scope.tweets = existingTweets.concat(newTweets);
    }

    // load more tweets scroll event listener
    function loadOnScroll() {

      var scrollOffset = $(window).height() / 2;
      if (!$scope.loaded && $(window).scrollTop() > $(document).height() - $(window).height() - scrollOffset) {
        $scope.loaded = true;

        dataService.getNextPage(appendNewTweets);
      }
    }

    $(window).on('scroll', loadOnScroll);

    // load twitter oembeds on load finish
    $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
      if (twttr.widgets) {
        twttr.widgets.load();
      }
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
      $scope.pageLoaded = true;
    });

  }
);
