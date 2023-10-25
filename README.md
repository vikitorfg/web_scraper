## Hi and welcome to Victor’s Link Scraper

## Prerequisites
- Ruby version 3.2.2
- Ruby on Rails version 7.1.1
- PostgreSQL database
- Bundler 2.4.21

## How to set it up:
Set ruby version to 3.2.2
```
rvm install 3.2.2
rvm use 3.2.2
```
Get the correct bundler version:
```gem install bundler -v 2.4.21```

run bundle install:
```bundle install```

**If you happen to run on a nasty undefined symbols error (macos)*
```
Undefined symbols for architecture arm64:
"_SSL_get1_peer_certificate", referenced from:
_engine_peercert in mini_ssl.o
```

Like I did while trying to install puma, try:
```
bundle config build.puma --with-pkg-config=$(brew --prefix openssl@1.1)/lib/pkgconfig
bundle install --redownload
```
source: [https://github.com/puma/puma/issues/2790#issuecomment-1547332463](https://github.com/puma/puma/issues/2790#issuecomment-1547332463)

## How to use it:
run
```
rails db:create db:migrate
```
spin up 
```
rails s  
```
navigate to local host
register with as a user
paste a link on the input in the top of the page, press ‘scrape’  
voala, the magic happens

## Some context:
Here I’ll explain what I used and why I did it so.

#### Authentication:
Devise. Industry standard and the one I’m most familiar with. Not much to say here.
Added pundit for authorization and scoping. Did I need to? Not really, I actually did by hand but that felt wrong. And would definitely leave a tech debt behind.

#### Webscraping:
Faraday, just like that gem a bit better. Not as tiny as HTTParty but it has a lot of build in functionality that would help in eventually expanding the application.
I decided on Nokogiri to stick with popularity. I don’t have much experience with html parsing.

#### Tests:
I’m more familiar with Rspec, but I decided to stick with minitests on this one just for the fun of it. Picked up VCR to mock API requests so as to be able to test the web_scarping_service and controllers that use said service without issues.

#### Styling:
As this is a more backend focused challenge (and I’m a backend focused developer) I picked up Bulma due to easy of use and being the front end css library (apart from React) that I’m most familiar with.
Also decided to go with pagy for pagination for ease of use. No reason to overthink this one.

## Last thoughts:
As of the time I'm writing this I'm not sure I'll be able to add more features to the app. This is unfortunate.
Since it is a weekday, my time is limited and for me this app is fundamentally incomplete. There are two tech debts that I leave behind.
First I feel there's only tests for the happy path. While I think they are the most important, no test suite is complete without trying to break your app and verifying it still works via testing.
Secondly, allowing the user to enter the url for an API call can mean a very slow response, as we have no control over the requested website response time. This should be handled by a worker then. I was planning on adding sidekiq and moving WebScraperService call to a worker, which would in turn update the ScrapedLink status from 'in_progress' to 'complete'. If time allowed #index for users would refresh silently and automatically upon completion leveraging the awesome rails 7 functionalities.
But alas my time is short and this would take a few extra hours that I do not have. Might do it for fun later.

