class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_campaign, only: [:new, :create, :show, :edit, :update]
  before_action :set_companies, only: [:new, :edit]

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all.where.not(:status => "completed")
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
    @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
    @ads = @run.ads
    language = @run.language
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RunPdf.new(@run, @ads, confirmed: true )
        send_data pdf.render, filename: "Print Order N.#{@run.id}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
    @run.update(:status => "to distribute")
    flash[:warning_run] = "Now remember to check the Print Order as completed after giving away all the fliers with the icon"  
  end

  # GET /runs/new
  def new
    @run = Run.new
    3.times do 
      @run.prints.build
    end
  end

  # GET /runs/1/edit
  def edit  
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)  

    printamount = 0
    company_id = nil
    @run.prints.each do |print|
      company_id = print.company_number unless print[:company_number] == nil
      printamount += print.print unless print.print.nil?
    end

    unless company_id == nil # printamount == 0 ||
      if @run.save
        user_companies = Company.joins(:users).where('users.id' => current_user.id)
        @run.prints.each do |print|
          boolean = false
          if print.company_number.present?
            company = Company.find(print.company_number) 
            boolean = true if user_companies.where(:id => print.company_number).present?
            Ad.postSimple(company, @run, boolean)
          end
        end
        flash[:warning_run] = 'The Print Order was successfully created, you can click on the download icon to open the file or download it. REMEMBER: If using MOZILLA open the file with Adobe outside the browser, as Mozilla give some problems when printing. You can open the file and dowload it with the following icon: ' 
        redirect_to companies_path
      else
        flash[:error] = "The run was not saved"
        render "new"
      end
    else
      flash[:error] = "You need to include at least one company and number of copies to print"         
      render "new"
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to companies_path, notice: 'Run was successfully updated.' }
        format.json { render companies_path, status: :ok, location: @run }
      else
        #binding.pry
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end  


  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def newstatus
    flash[:warning] = "Warning! You should change this status only when you gave away all fliers!"
    @run = Run.find(params[:id])    
  end

  def changestatus
    @run = Run.find(params[:id])
    @run.status = Run.nextStatus(@run)

    respond_to do |format|
      if @run.save
        format.html { redirect_to companies_path, notice: "The status was changed to #{@run.status}." }
        flash[:warning_campaign] = "If you want to give away more fliers you should create a new print order by clicking on the print icon"
      else
        format.html { render :newstatus, error: 'The status was not changed, the application had an error' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    def set_companies
      @companies = Company.all.joins(:flyers).where.not("flyers.image" => nil).where("flyers.confirmed" => true).distinct    
    end

    def set_campaign
      @campaign = Campaign.find(params[:campaign_id]) if params[:campaign_id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params
      params.require(:run).permit(:campaign_id, :runprintnumber, :ownads, :city, :location, :language_id, prints_attributes: [:id, :company_number, :print]) #company_runs_attributes: [:run_id, :company_id, :printnumber]
    end

    def print_number
      params.require("printnumber").permit(:first, :second, :third)
    end

    def ad_params
      params.require(:run).require(:ads_attributes).permit!
    end

    def clean_params
      _params = run_params.delete_if { |k, v| 
        v.empty? if k == "print_attributes" || k == "print"}
    end

end