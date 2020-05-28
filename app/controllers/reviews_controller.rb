class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end
    
    def show
        @review = Review.find(params[:id])
    end
    
    def new
       @review = Review.new
    end

    def create
        @review = Review.create(review_params)
        if @review.save
            redirect_to appliances_path
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to @appliance
        end        
    end

    private
    
    def review_params
        params.require(:review).permit(:booking_id, :rating, :text_review)
    end
    
end