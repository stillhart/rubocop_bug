# frozen_string_literal: true

class UsersController < ApplicationController
  def update
    if current_user.superuser? || current_user.admin?
      super_ = !!ActiveRecord::Type::Boolean.new.cast(params[:superuser])
      User.find(params[:id]).update(superuser: super_)
    end
  end

  private
end
