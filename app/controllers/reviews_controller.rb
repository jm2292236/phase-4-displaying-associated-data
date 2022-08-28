class ReviewsController < ApplicationController

    def index
        reviews = Review.all.order(rating: :desc)
        render json: reviews, include: :dog_house
    end

    def show
        review = Review.find_by(id: params[:id])
        if review
            render json: review, include: :dog_house
        else
            render json: {error: "Review not found"}, status: :not_found
        end
    end

end
