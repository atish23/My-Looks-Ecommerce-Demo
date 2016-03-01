class LooksController < ApplicationController
	def index
		@looks = current_user.looks.all
		@product = Product.find_by_id(params[:product_id])
	end

	def new
		@look = current_user.looks.new	

		@product = Product.find(params[:product_id])
	end

	def create
		@look = current_user.looks.new(look_params)
		if @look.save
			#flash[:notice] => "Look created succesfully"
			#binding.pry
			product = params[:look][:product_id]
			#raise product.inspect
			redirect_to :controller => "looks", :action => "index", :product_id => product
			#redirect_to looks_path 
		else
			#flash[:notice] => "Look Can not be created"
			render :new
		end
	end

	def edit
		@look = Look.find(params[:id])
	end

	def update
		@look = Look.find(params[:id])
		if @look.update(look_params)
			redirect_to looks_path , :notice => "Succesfully updated"
		else
			render :edit , :notice => "Sorry"
		end
	end

	def destroy
		@look = Look.find(params[:id])
		@look.destroy
		redirect_to :back, :notice => " Look deleted"
	end

private
	def look_params
		params.require(:look).permit(:name,:neckware,:shirts,:shoes,:product_id)
	end
end
