# biostars-api 

[![Gem Version](https://badge.fury.io/rb/biostars-api.svg)](http://badge.fury.io/rb/biostars-api)    [![Build Status](https://travis-ci.org/arian-amador/biostars-api.svg?style=flat)](https://travis-ci.org/arian-amador/biostars-api)    [![Inline docs ](https://inch-ci.org/github/arian-amador/biostars-api.svg?branch=master)](https://inch-ci.org/github/arian-amador/biostars-api)

A wrapper for the [biostars.org](https://www.biostars.org/) public API.

Biostars focuses on bioinformatics, computational genomics and biological data analysis. 

## Requirements
* httparty
* json

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'biostars-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install biostars-api

## Examples

```ruby
# Retrieve the latest site traffic stats
traffic = Biostars::API.traffic
p traffic.post_views_last_60_min    # number of post views over the last hour

# Retrieve activity for the last 24 hours.
latest_info = Biostars::API::Stats.latest
p latest_info.new_users    # Arary of user ids [1,2,3..10]
p latest_info.comments     # Number of comments

# Retrieve an Array of the lastest users
latest_users = latest_info.all_users

# Get a specific Users information
user = Biostars::API::Stats.User.find(latest_users.first.id)
p user.id      # User id
p user.name    # Username

# The same can be achieved for Posts and Votes
latest_posts = latest_info.all_posts
latest_votes = latest_info.all_votes
```

## Documentation

* API - https://www.biostars.org/info/api/
* Rubydoc - http://www.rubydoc.info/github/arian-amador/biostars-api/master

## Contributing

1. Fork it ( https://github.com/arian-amador/biostars-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request