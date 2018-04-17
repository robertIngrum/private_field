# private_field
Make Rails fields private to avoid those lazy temptations.

## Background
It's easy to fall into the temptation of modifying model fields in random places (like your views),
but this just makes the world worse.  In most cases, it's a better idea to define a method within 
your model or a service class that's responsible for handling all of your data manipulation.

This gem enforces that rule by allowing for private field definitions.

Now you may be thinking, "That's already possible, just override the accessors."  And you'd be right,
but I'm lazy and think that writing:
 ```ruby
 private_field :id
 ```
is easier than writing:
```ruby
field :id
private attr_accessor :id
```

## Config
This is the best (or worst) part: there's no config because I wrote this for one specific use case and
don't feel like writing config stuff that I won't use.  Feel free to submit a pr if it doesn't suit
your needs.

All this was written for Mongoid (I'm sorry), so it may take a bit of tweaking to make work for other
ORMs.

## How to
Just do `private_field :field_name` instead of `field :field_name`.  If you're feeling feisty, you can
do `readable_field :field_name` to make the reader public and the writer private.

MAKE SURE THAT YOU DO `include Mongoid::Document` OR WHATEVER ORM YOU'RE USING THIS ISN'T A REPLACEMENT
FOR THAT CRAP.
