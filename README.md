# Speko::Slack

Welcome to the Speko::Slack gem. Get ready to seamlessly integrate Slack notifications into your application! This gem utilizes the slack-ruby-client gem's library... but provides an easier approach.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'speko-slack'
```

And then execute:

    $ bundle

## Usage

Make sure you have the following ENV variables set:

* `SLACK_API_TOKEN`
* `SLACK_CHANNEL` - will be the default, but can be overridden per `post` call. 

Below is the `post` method. **Note**: `message` and `code` are required. Pass in `nil` for channel name if you don't plan on verriding the default value.

```ruby
def post(message, code, channel = nil, *args)
   ...
end
```

#### Example:

```
message = [
        {title: "Your Title"},
        {title_link: "SOME_URL"},
        {SOME_KEY_1: "SOME_VALUE_1", short: true},
        {SOME_KEY_2: "SOME_VALUE_2", short: true},
        {SOME_KEY_3: "SOME_VALUE_3", short: false},
        {SOME_KEY_4: "SOME_VALUE_4", short: false},
        {SOME_KEY_4: "SOME_VALUE_5", short: true},
        {user: USER_NAME}
      ]
      
SlackClient.post('SOME_MESSAGE', :alert_type, { channels:[ARR_OF_CHANNELS], api_key: SLACK_API_KEY }, message)
```

#### Alert Types

* info
* warning
* success
* fatal

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kotowick/speko-slack. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

