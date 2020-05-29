class AppliancesController < ApplicationController

    def index
        @appliances = Appliance.search(params[:search])
        
    end

    def show
        @appliance = Appliance.find(params[:id])
    end

    def new
        @appliance = Appliance.new
    end

    def create
        #not registering
        owner_id = session[:owner_id]
        @appliance = Appliance.new(appliance_params)
        if @appliance.save
            #should redirect to owner_path
            redirect_to appliances_url
        else
            flash[:errors] = @appliance.errors.full_messages
            redirect_to new_appliance_url
        end
    end

    
    def edit
        @appliance = Appliance.find(params[:id])
    end

    def update
        owner_id = session[:owner_id]
        @appliance = Appliance.new(appliance_params)
        if @appliance.save
            redirect_to @appliance
        else
            flash[:errors] = @appliance.errors.full_messages
            redirect_to new_appliance_url
        end
    end
    
    

    
    def destroy
           @owner = Appliance.find(params[:id]).owner_id
            Appliance.find(params[:id]).destroy
            redirect_to owner_path(@owner)
    end

    private

    def appliance_params
        params.require(:appliance).permit(:owner_id, :appliance_name, :appliance_category, :daily_rate, :availability, :avatar, :search)
    end

    # owner_id: owner_id, appliance_name: params[:appliance_name], appliance_category: params[:appliance_category], daily_rate: params[:daily_rate], availability: params[:availability], :avatar, :search)
   
end
