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
