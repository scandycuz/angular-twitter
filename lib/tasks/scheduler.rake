desc "This task is called by the Heroku scheduler add-on and queries the Twitter API for new tweets"
task :update_feed => :environment do
  puts "Updating twitter feed..."
  TwitterRequest.new.update_tweets
  puts "done."
end
