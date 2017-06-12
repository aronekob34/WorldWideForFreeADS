class CompanytypesController < ApplicationController

	def index
		@companytypes = Companytype.all
	end

	def new
		@companytype = Companytype.new
	end

	def create
		@companytype = Companytype.new(input_params)
		if @companytype.save
			redirect_to action: "show", id: @companytype.id
		else
			render "new"
		end
	end

	def update
		@companytype = Companytype.find(params[:id])
		if @companytype.update_attributes(input_params)
			flash[:notice] = "Your Companytype was saved"
			redirect_to action: "show", id: @companytype.id
		else
			flash[:error] = "An error occurred, the companytype was not saved"
			render "edit"
		end
	end

	def show
		@companytype = Companytype.find(params[:id])
	end

	private

	def input_params
		params.require(:companytype).permit(:name)
	end
end
