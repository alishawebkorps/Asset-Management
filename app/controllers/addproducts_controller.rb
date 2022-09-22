class AddproductsController < ApplicationController
    def new
        @addproduct = Addproduct.new
    end

     def create      
        hash = Hash.new
        params.each do |key , value |
        if key == "authenticity_token"
          break;
        else
           hash.store(key,value)
        end
        end
        debugger
        addproduct_params = hash
        @addproduct = Addproduct.new(addproduct_params)
        respond_to do |format|
          if @addproduct.save!
            format.html { redirect_to root_path, notice: "Product Field was successfully created." }
            format.json { render :show, status: :created, location: @product_field }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @addproduct.errors, status: :unprocessable_entity }
        end
     end
    end

      def addproduct
        @addproduct = ProductField.all.where(user_id: current_user)
      end

   def allproduct
      @addproduct = Addproduct.all
   end 
end
