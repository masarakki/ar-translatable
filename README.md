# Translatable

ActiveRecord plugin for translate columns

## Installation

Add this line to your application's Gemfile:

    gem 'translatable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install translatable

## Usage

### Setup

    rails generate translatable:migration
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

1. Fork it ( https://github.com/masarakki/translatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
