# TweetCounterTweet

[TweetCounterTweet live][site]

[site]: http://www.tweetcountertweet.com/

TweetCounterTweet is a full-stack web application using AngularJS on the front-end, Ruby on Rails on the back-end, and a PostgreSQL database. The application integrates with the Twitter API to automatically populate with interactions between the most popular handles on Twitter.

## Features & Implementation

### Rails integration with Twitter API

The Rails RESTful API connects to the Twitter API using an OAuth authentication protocol and uses a combination of HTTP GET queries and server side code to find the most popular tweets and responses.

The server periodically runs rake tasks to query the Twitter API and cache retrieved data into the database.

### AngularJS integration with Rails RESTful API

On initial load, the front-end receives the most recent Tweet data from the Rails RESTful API. The Angular front-end then seamlessly loads additional RESTful API JSON data as the user scrolls. The data is mapped to the Twitter oEmbed URL format and rendered in the template.

### Code Sample

Event listener to load additional Tweets on user scroll:

```javascript
function loadOnScroll() {
  var scrollOffset = $(window).height() / 2;

  if (!$scope.loaded && $(window).scrollTop() > $(document).height() - $(window).height() - scrollOffset) {
    $scope.loaded = true;
    dataService.getNextPage(appendNewTweets);
  }
}
```

Data Service function to retrieve Tweets from pagination enabled REST API:
```javascript
this.getNextPage = function(callback) {
  this.pageNum ++;
  $http.get('/tweets.json?page=' + this.pageNum)
  .then( function(response) {
    if (!response.data.length) {
      this.pageNum --;
    }
    return response;
  }.bind(this))
  .then(callback);
}
```

## Future Directions for the Project

In addition the already implemented features, there are additional features that could further enhance the project.

### Improved Twitter API integration

Improved Tweet filtering to further increase result relevancy.

### Categories

Add feature to allow users to choose specific categories of Twitter interactions to query, such as `Entertainment`, or `Politics`.

### User Profiles

Allow users to create profiles and create their own customized feeds.
