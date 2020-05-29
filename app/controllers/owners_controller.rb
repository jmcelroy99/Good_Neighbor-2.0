class OwnersController < ApplicationController

    def show
        @owner = Owner.find(params[:id])
    end

    def new
        @owner = Owner.new
    end

    #old
    # def create
    #     @owner = Owner.create(renter_params)
    #     return redirect_to controller: 'owners', action: 'new' unless @owner.save
    #     session[:owner_id] = @owner.id
    #     redirect_to appliances_url
    #     end
    # end

    # def create
    #     @owner = Owner.create(owner_params)
    #     return redirect_to controller: 'owners', action: 'new' unless @owner.save
    #     session[:owner_id] = @owner.id
    #     redirect_to @owner
    # end
    def create
        @owner = Owner.new(owner_params)
        if @owner.save
        
        session[:owner_id] = @owner.id

        redirect_to owner_path(session[:owner_id])
        else
        flash[:errors] = @owner.errors.full_messages
        redirect_to new_owner_path 
        end 
    end   

    def edit
        @owner = Owner.find(params[:id])
    end

    def update
        @owner = Owner.find(params[:id])
        @owner.update(owner_params)
        redirect_to @owner
    end

    def destroy
        Owner.find(params[:id]).destroy
        redirect_to new_owner
    end

    private

    def owner_params
        params.require(:owner).permit(:username, :email_address, :city, :address, :password, :password_confirmation)
    end

end
