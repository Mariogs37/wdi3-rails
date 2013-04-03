class SubscribersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      subscriber = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
      subscriber.user = @user
    end
  end
end
