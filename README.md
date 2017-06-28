# Crawler::Rails
Crawler::Rails is rails engine.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'crawler-rails'

# dependency gems
gem 'jquery-rails'
gem 'delayed_job'
gem 'delayed_job_active_record'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install crawler-rails
```

## Development
* Show route
  * `bundle exec rake app:routes`
* Import test data
  * `bundle exec rake db:seed`
* Start delayed_job
  * `cd spec/dummy && bundle exec rake jobs:work`

## TODO
* 定期実行する
* 前回取得したデータと違いがあったら目立たせる
