# [Rubocop-hq/rubocop#8232](https://github.com/rubocop-hq/rubocop/issues/8232)

# Before
```ruby
class UsersController < ApplicationController
  private
end
```

# Run rubocop
```sh
bundle exec rubocop -a --safe
```

# Checking the difference with git status
```git
   private
-end
+nd
```

I do not think that this is desired.
