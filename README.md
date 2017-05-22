# BureaucratRuby
[![Build
Status](https://travis-ci.org/bitex-la/bureaucrat_ruby.svg?branch=master)](https://travis-ci.org/bitex-la/bureaucrat_ruby)

Validate Argentine CBUs and CUIT codes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bureaucrat_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bureaucrat_ruby

## Usage

This gem is a binary distribution with ruby wrappers for 
[bureaucrat](https://github.com/bitex-la/bureaucrat), see the main
bureaucrat library for more variants.

```ruby

    cbu = BureaucratRuby::Cbu.create(id: "0170035040000002373188")
    cbu.errors.should be_empty

    cbu.attributes.should == {
      "id"=>"0170035040000002373188",
      "type"=>"cbus",
      "meta"=>nil,
      "bank"=>"017",
      "branch"=>"0035",
      "bank_name"=>"BBVA Banco Francés S.A.",
      "account"=>"40000002373188"
    }

    bad_cbu = BureaucratRuby::Cbu.create(id: "foo")
    bad_cbu.errors[:base].should == ['InvalidCbuFormat']

    cuit = BureaucratRuby::Cuit.create(id: "20319274228")
    cuit.errors.should be_empty
    
    cuit.attributes.should == {
      "id" => "20319274228",
      "type"=>"cuits",
      "meta"=>nil,
      "kind"=>"20",
      "person_id"=>"31927422",
    }

    bad_cuit = BureaucratRuby::Cuit.create(id: "foo")
    bad_cuit.errors[:base].should == ['InvalidCuitFormat']

```

## Development & Contributions

See the main Bureaucrat library. We'll likely accept any pull request or issue
asking for more validations to be added. Not limited to Argentina.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

