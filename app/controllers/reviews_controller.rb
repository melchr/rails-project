class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end
    def show
        @review = Review.find(params[:id])
    end
    def new
        @review = Item.new
    end
end
