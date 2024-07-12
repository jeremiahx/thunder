# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid? && user_params[:send_invite]
      invitation = UserInviter.new(to_address: @user.email, subject: "You have been invited!",
        body: "This is your lucky day. You've been invited!").call
      unless invitation
        flash[:error] = "User not created. Invitation failed"
        render turbo_stream: [
          turbo_stream.update("alerts", partial: "layouts/alerts"),
          turbo_stream.replace("modal")
        ] and return
      end
    end

    if @user.save
      flash[:notice] = "User created"

      render turbo_stream: [
        turbo_stream.update("alerts", partial: "layouts/alerts"),
        turbo_stream.replace("modal"),
        turbo_stream.update("user_listing", partial: "user_list", locals: {users: User.all})
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :send_invite)
  end
end
