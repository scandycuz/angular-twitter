# TweetCounterTweet

[TweetCounterTweet live][site]

[site]: http://www.tweetcountertweet.com/

TweetCounterTweet is a full-stack web application that integrates with the Twitter API to automatically populate with the most favourited and retweeted interactions on Twitter. It utilizes AngularJS on the front-end, Ruby on Rails on the back-end, and a PostgreSQL database.

## Features & Implementation

### Rails integration with Twitter API

Rake tasks periodically query the Twitter API and update the PostgreSQL database.

The Rails RESTful API connects to the Twitter API using an OAuth authentication protocol and uses a combination of HTTP GET queries and server side code to find the most popular tweets and responses.

### AngularJS integration with Rails RESTful API

When the page is initially loaded, the front-end issues a request to the Rails API for the initial tweets. The application utilizes pagination and loading on scroll to minimize the initial load time.

### Code Sample

AngularJS HTTP query to Rails RESTful API:

```javascript
// Angular Service Code:
this.getTweets = function(callback) {
  $http.get('/tweets.json?page=' + this.pageNum)
  .then(callback);
};

// Angular Controller Code:
dataService.getTweets( function(response) {
  $scope.tweets = response.data;
});
```

## Future Directions for the Project

In addition the already implemented features, there are additional features that could further enhance the project.

### Improved Twitter API integration

Improved Tweet filtering to provide more relevant results.

### Categories

The ability for users to choose categories of interactions to query for, such as `Entertainment`, or `Politics`.

### User Profiles

Allow users to create profiles and their own custom feeds.
