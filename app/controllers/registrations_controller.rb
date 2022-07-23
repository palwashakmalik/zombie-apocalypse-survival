# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def new
    super
    @user.locations.new
 end

 def create
    super
    @user.items.build
    @user.locations.build
  end

  def update
    super
    @user.locations.build(params[:locations])
  end

end
