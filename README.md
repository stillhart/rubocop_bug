# Before
```ruby
# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    authorize! :manage, User
    @users = User.all.order(:id)
  end

  def update
    authorize! :manage, User
    if current_user.superuser? || current_user.admin?
      super_ = !!ActiveRecord::Type::Boolean.new.cast(params[:superuser])
      User.find(params[:id]).update(superuser: super_)
    end
    redirect_to users_path
  end

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
