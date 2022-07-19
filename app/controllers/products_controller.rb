class ProductsController < ApplicationController
  before_action :get_product, only: [:index, :product_details]
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    @product = Product.new
  end


  def show
  end

  def show_detail
    @product = Product.friendly.find params[:id]
  end


  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_details_path
  end

  def create
    @product = Product.create(product_params)
    redirect_to product_details_path
  end

  def destroy
    #debugger
    @product.destroy
    redirect_to product_details_path, status: :see_other, notice: "Product was successfully destroyed." 
  end

  private

  def get_product
    @products = Product.all
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :visible, :image, category_ids: [])
  end

  def set_product
    @product = Product.friendly.find params[:id]
  end
end
