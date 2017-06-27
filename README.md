# Crawler::Rails
Crawler::Rails is rails engine.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'crawler-rails'
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

## TODO
* クローリングをログに的なものを残す
* クローリングしにいく
  * scraping_code にどういう入力にするか
  * 動作テストみたいリンクをおく
* 定期実行する
* 前回取得したデータと違いがあったら目立たせる
