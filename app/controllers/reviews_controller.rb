class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end
    def new
        @review = Review.create
    end
    def show
        @review = Review.find(params[:id])
    end
end
