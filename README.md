# BibleSearch Example for Rails

This Ruby on Rails application provides a simple way to create a website people can use to read the Bible in various languages. Use it as is or extend it for your own purpose.

A live demo is at [http://live.bibles.org](http://live.bibles.org).

This application uses the [BibleSearch API Gem](https://github.com/americanbible/biblesearch-api-ruby) and Scripture data from [Bibles.org](http://bibles.org).

## Quick Start

1. Install (Ruby on Rails)[http://rubyonrails.org/download].
1. `git clone git@github.com:americanbible/biblesearch-example-rails.git` - to get the code.
1. `cd biblesearch-example-rails` - to enter that directory.
1. `bundle install` - to grab the needed libraries.
1. `rake` - to make sure the tests run.
1. Get your own [BibleSearch API Key](http://tools.bibles.org/api.html).
1. Copy `config/application.example.yml` to `config/application.yml`, then edit `config/application.yml` to contain your personal API key.
1. `bundle exec rails s` - to start the local server.
1. Point your browser to [http://0.0.0.0:3000](http://0.0.0.0:3000)--you may have to open allow Ruby in your firewall.

You should see your very own Bible search page.

## About Caching

Most live web sites benefit from some amount of caching. Sites that utilize the [BibleSearch API](http://Bibles.org) benefit more than most because the Scripture data changes very little and is moderately large. Versions are updated from time-to-time, but usually those updates are very rare and very minor, so we've set caching on the Bible text to two weeks. New versions are a bit more common, so we've set the list of Bibles to update daily.

Besides speeding up your site and cutting bandwidth costs, caching also helps you be a good steward of hosting costs donated by Bibles.org. It can be very useful to turn off caching to solve some kinds of bugs and configuration problems, but please turn it back on once the problem are solved.

In [Rails production mode](http://guides.rubyonrails.org/configuring.html#rails-environment-settings), this application uses [Memcached](http://memcached.org/) or any drop-in replacement for it such as [Amazon ElastiCache](http://aws.amazon.com/elasticache/). In development mode, it uses file-system caching, but this can be turned off (details in the Configuration section below).

## Configuration

This application is configed using [Figaro](https://github.com/laserlemon/figaro). Your configuration settings go in `config/application.yml` or environment variables. See `config/application.example.yml` for an example.

Here are the configurable settings:

1. **BIBLESEARCH_API_KEY**: your personal API key from [Bibles.org](http://bibles.org). This key allows your application to fetch and use Scripture versions.
1. **DEFAULT_VERSION**: the initial Bible version you want to display, like `eng-GNTD` for *Good News Translation, US Version*. You can look up these abbreviations on [Bibles.org](http://bibles.org).
1. **SITE_VERSIONS**: A list of the versions you want people to be able to choose from `[eng-GNTD,eng-CEV,spa-RVR60]`.
1. **RAILS_CACHE_STORE**: the caching you want to use when running in local (development) mode. Defaults to `file_store`. Use `null_store` to disable caching.
1. **ELASTICACHE_ENDPOINT**: if you accelerate your site with [Amazon ElastiCache](http://aws.amazon.com/elasticache/), this points to your cache store.

## Taking it Further

If you don't know Ruby on Rails yet, it's a great tool to learn. If you know it already--or when you learn it--we welcome your enhancements as [Github Pull Requests](https://help.github.com/articles/using-pull-requests).
