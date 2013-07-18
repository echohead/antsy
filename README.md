# antsy

A gem to make writing ansible modules in ruby more pleasant.

# installation

    gem install antsy

# usage

```ruby
require 'antsy'
args = Antsy.args

Antsy.fail! "must provide foo argument" unless args[:foo]

# do stuff with args
# ...

if something was updated
  Antsy.changed!
else
  Antsy.no_change!
end
```
