class CategoriesController < ApplicationController
  before_action :set_product, only: [:edit, :update]

   def new
    @category = Category.new
   end

  def create
    @category = Category.new(category_params)  
    if @category.save 
      flash[:notice] = "Created Category Successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

   def index
    @category = Category.all
   end

  
   private
      
  def category_params
    params.require(:category).permit(:name)
  end
      
  def set_category
    @category = Category.find(params[:id])
  end
end