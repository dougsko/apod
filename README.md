# Apod

This is a library to work with NASA's astronomy pictures of the day.
It also includes the script, apod-download, which will download the
current picture of the day to your computer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apod'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apod

## Usage

This library comes with an executable, apod-download, which can be used
to download the current picture of the day.  For usage, run:

```apod-download -h```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec apod` to use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/apod/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
