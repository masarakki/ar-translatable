[![Build Status](https://travis-ci.org/masarakki/ar-translatable.svg?branch=master)](https://travis-ci.org/masarakki/ar-translatable)
[![Dependency Status](https://gemnasium.com/masarakki/ar-translatable.svg)](https://gemnasium.com/masarakki/ar-translatable)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/masarakki/ar-translatable/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/masarakki/ar-translatable/?branch=master)
[![Coverage Status](https://coveralls.io/repos/masarakki/ar-translatable/badge.png?branch=master)](https://coveralls.io/r/masarakki/ar-translatable?branch=master)
# ActiveRecord Translatable

ActiveRecord plugin for translate columns

## Installation

Add this line to your application's Gemfile:

    gem 'ar-translatable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar-translatable

## Usage

### Setup

    rake translatable:install:migrations
    rake db:migrate

### Setting Model

```ruby
class User < ActiveRecord::Base
  translatable :first_name
  translatable :last_name
end
```

### Creation

create User with TranslatedWords via nested attributes

```ruby
user = User.create(first_names_attributes: [{locale: 'en', value: 'John'}, {locale: 'ja', "ジョン"}],
                   last_names_attributes: [{locale: 'en', value: 'Lennon'}, {locale: 'ja', "レノン"}])
```

### Access

list of translated words

```ruby
user.first_names
#=> [<TranslatedWord locale: "en", value: "John">, <TranslatedWord locale: "ja", value: "ジョン">]
```

access value with locale name

```ruby
user.first_name(:en)
#=> "John"
user.first_name(:ja)
#=> "ジョン"
```

using default locale if locale name not given

```ruby
I18n.default_locale
#=> :en
user.last_name
#=> "Lennon"

I18n.default_locale = :ja
#=> :ja
user.last_name
#=> "レノン"
```

## Contributing

1. Fork it ( https://github.com/masarakki/ar-translatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
