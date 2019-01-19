class ProductController < ApplicationController
  def update
    puts params[:amount]
    puts "test"
    render json: {name: "test"};
  end

  def show
    puts params[:amount]
    puts "test"
    render json: {name: "test"};
  end

  def create
    puts params[:amount]
    puts "test"
    render json: {name: "test"};
  end

  def products
    puts params[:amount]
    puts "test"
    render json: {name: "test"};
  end
end
