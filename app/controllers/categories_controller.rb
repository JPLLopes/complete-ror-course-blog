class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was created successfully"

      redirect_to category_url(@category)
    else
      render 'new', status: :unprocessable_content
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end