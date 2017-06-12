class FlyersController < ApplicationController
  def index
    if current_user.role == "administrator"
      @flyers = Flyer.all
    else
      redirect_to companies_path
    end
  end

  def confirm
    @flyer = Flyer.find(params[:id])
    #@flyer.confirmed = true
    if @flyer.update_attributes(confirmed: true)
      flash[:notice] = "The Flyer was confirmed"
      redirect_to action: "index"
    else
      flash[:error] = "An error occurred, the flyer was not saved"
      render "index"
    end
  end


  def new
  	@flyer = Flyer.new
  end

  def create
  	@flyer.new(flyer_params)
  	if @flyer.save
  		redirect_to companies_path
  	else
		flash[:error] = "An error occurred, the Campaign was not saved"
  		render "new"
  	end
  end

  def edit
  end

  def delete
  end

  def destroy
    @flyer = Flyer.find(params[:id])
    if @flyer.destroy
      flash[:notice] = "The Flyer was deleted"
      redirect_to edit_company_path(@flyer.company_id)
    else
      flash[:error] = "An error occurred, the company was not saved"
      redirect_to edit_company_path(@flyer.company_id)
    end
  end

  def flyer_params
  	params.require(:flyer).permit(:company_id, :language_id, :image)
  end
end
