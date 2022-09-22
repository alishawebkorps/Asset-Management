class ProductFieldsController < ApplicationController
   
    def index
      @product_field = ProductField.all
    end

    def new 
      @product_field = ProductField.new
    end

    def create
        @product_field = ProductField.new(product_field_params)
        respond_to do |format|
          @product_field.user_id = current_user.id
          if @product_field.save!
            format.html { redirect_to product_fields_path, notice: "Product Field was successfully created." }
            format.json { render :show, status: :created, location: @product_field }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @product_field.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
     @user = ProductField.find(params[:id])
    end

   
    def product_field_params
        params.require(:product_field).permit(:name, :field_type)
    end

end
