class SessionsController < ApplicationController
  def new
  end


# #old code
#   def create
#     user = Renter.find_by(username: params[:renter][:username]) || Owner.find_by(username: params[:owner][:username])
#     user = user.try(:authenticate, user_params[:password])
#     @user = user
#     return redirect_to(controller: 'sessions', action: 'new') unless @user
#     session[:user_id] = user.id
#     @user = user
#     redirect_to appliances_path
#   end

  # def create
  #   @renter = Renter.find_by(name; params[:username])
  #   if @user && @user.authenticate
  # end

  def create
    if params[:session][:o_r] == 'owner'
      @user = Owner.find_by(username: params[:username])
        if @user.try(:authenticate, params[:password])
          redirect_to @user
        else
          flash[:errors] = @user.errors.full_messages 
          redirect_to sessions_new_path
        end
    else
      @user = Renter.find_by(username: params[:username])
        if @user.try(:authenticate, params[:password])
          redirect_to appliances_path
        else
          flash[:errors] = @user.errors.full_messages 
          redirect_to sessions_new_path
        end
      end
  end
    #what we based our method on
    # user = (Renter.find_by(username: params[:renter][:username]) || Owner.find_by(username: params[:owner][:username]))
    # user = user.try(:authenticate, params[:renter][:password]) || user.try(:authenticate, params[:owner][:password])


  #   return redirect_to(controller: 'sessions', action: 'new') unless user
  #   if params[:session][:o_r] == 'renter'
  #     session[:renter_id] = user.id
  #     redirect_to appliances_path
  #   else 
  #     session[:owner_id] = user.id
  #     redirect_to new_review_path
  #   end

  # end

  def destroy
    session.delete :owner_id || :renter_id
    redirect_to '/'
  end

  # private

  # def user_params
  #   params.require(:session).permit(:username, :password)
  # end
end