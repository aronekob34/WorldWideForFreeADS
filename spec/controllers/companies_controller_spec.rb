require 'rails_helper'
require 'include_module_spec'

RSpec.describe CompaniesController, type: :controller do
	login_user
	let(:companies_with_campaigns) { FactoryGirl.create(:companies_with_campaigns)}

	describe "testing Helpers methods" do
		it "should have a current_user" do
			expect(subject.current_user).to_not eq(nil)
		end
	end

	describe "GET #index" do

		it "assigns all companies to @companies" do
			@companies = subject.current_user.companies
			get :index
			expect(assigns[:companies]).to eq(@companies)
		end

		it "assigns all the campaigns to @campaigns"

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "has a 200 status code" do
			get :index
			expect(response.status).to eq(200)
		end

	end

	describe "GET #new" do 

		it "gives instructions if this is the first company" do
			subject.current_user.companies = []
			get :new 
			expect(flash[:notice]).to be_present
		end

		it "render the new template" do
			get :new
			expect(response).to render_template("new")
			expect(response.body).to eq ""
		end

		it "create a new company object" do
			get :new
			expect(assigns(:company)).to be_a_new(Company)
		end

		it "instanciate a new campaign" do 
			get :new 
			expect(assigns[:campaign]).to be_an_instance_of(Campaign)
		end

		it "saves the new campaign"
	end

	describe "POST #create" do
		before(:each) do 
			@company = FactoryGirl.build(:company)
			@campaign = { "#{rand(903814893)}"=> FactoryGirl.build(:invalidcampaign).attributes}
		end

		describe "responde to" do
			it "responds to html by default" do
				post :create, params: { company: build_attributes(:company), campaign: @campaign }
				expect(response.content_type).to eq "text/html"
			end
		end

		describe "a company object" do
			it "should have a companytype" do
				company = Company.new
				expect(company).to_not be_valid
			end

			it "creates a new company" do
				expect{ 
					post :create, params: { company: build_attributes(:company) }
				}.to change(Company, :count).by(1)
			end 

			it "adds an entry to the companies_users association" do
				post :create, params: { company: build_attributes(:company) }
				expect { controller.current_user.companies << @company }.to change(controller.current_user.companies, :length).by(1)
			end			

			it "saves the company to the corresponding user" do
				expect { 
					post :create, params: { company: build_attributes(:company) }
					}.to change(controller.current_user.companies, :length).by(1)
			end
		end

		describe "nested attributes" do

			before(:all) do
				company = FactoryGirl.build(:company).attributes
				campaigns = { campaigns_attributes: { "#{rand(903814893)}"=> FactoryGirl.build(:campaign).attributes} }
				@valid_attributes = company.merge(campaigns)
			end

			context "with valid params" do
				
				it "should include the nested attributes" do
					post :create, params: { company: build_attributes(:company), campaign: build_attributes(:campaign) }
					expect(assigns[:company].campaigns).to_not be_empty
				end

				it "should save the campaign" do
					expect { 
						post :create, 
						params: { company: build_attributes(:company), campaign: build_attributes(:campaign) }
						}.to change(Campaign, :count).by(1)
				end

				it "should save the company" do
					expect {
						post :create, 
						params: { company: build_attributes(:company), campaign: build_attributes(:campaign) }
						}.to change(Company, :count).by(2)
				end				
			end
		end
	end

	describe "GET #edit" do
		it "assigns the requested company to @company" do
			company = FactoryGirl.create(:company)
			get :edit, params: { id: company }
			expect(assigns(:company)).to eq(company)
		end

		it "renders the #edit view" do
			get :edit, params: {id: FactoryGirl.create(:company)}
			expect(response).to render_template "edit"
		end

		it "redirects to the correct path when clicking the back button"
	end


	describe "PUT #update" do 
		before(:each) do
			@company = FactoryGirl.create(:company, name: "testcompany")
		end

		context "valid attributes" do
			it "located the requested @company" do
				put :update, params: { id: @company, company: FactoryGirl.attributes_for(:company)}
				expect(assigns(:company)).to eq(@company)
			end

			it "changes @contact's attributes" do
				#binding.pry
				put :update, params: { id: @company, company: FactoryGirl.attributes_for(:company, name: "othercompany")}
				@company.reload
				expect(@company.name).to eq("othercompany")
			end


			it "redirects to the updated contact" do
				put :update, params: { id: @company, company: FactoryGirl.attributes_for(:company)}
				expect(response).to redirect_to action: "index"
			end
		end

		context "invalid attributes" do
			it "locates the requested @company" do
				put :update, params: 
				{ id: @company, company: FactoryGirl.attributes_for(:invalidcompany)}
				expect(assigns[:company]).to eq(@company)
			end

			it "does not change @company's attributes" do
				put :update, params: 
				{ id: @company, company: {name: nil, description: "testdescription"}}
				@company.reload
				expect(@company.description).to_not eq("testdescription")
				expect(@company.name).to eq("testcompany")
			end

			it "re-renders the edit method" do
				put :update, params: 
				{ id: @company, company: FactoryGirl.attributes_for(:invalidcompany) }
				expect(response).to render_template "edit"
			end
		end
	end

	describe "GET #show" do 
		before(:each) do
		 @company = FactoryGirl.create(:company) 
		end
		it "will render the show template" do
			get :show, params: { id: @company}
			expect(response.body).to render_template "show"
		end

		it "will select the company in @company" do
			get :show, params: { id: @company, company: build_attributes(:company)}
			expect(assigns(:company)).to eq(@company)
		end

	end

	describe "GET #delete" do
		before(:each) do 
			@company = FactoryGirl.create(:company)
		end

		it "renders the delete template" do
			get :delete, params: {id: @company}
			expect(response).to render_template "delete"
		end

		it "assigns the requested company to @company" do
			get :delete, params: {id: @company}
			expect(assigns(:company)).to eq(@company)
		end
	end

	describe "DELETE #destroy" do 
		before :each do 
			@company = FactoryGirl.create(:company)
		end

		it "deletes the company" do
			expect{
				delete :destroy, params: { id: @company }
			}.to change(Company, :count).by(-1)
		end

		it "deletes the company without errors" do
			expect{
				delete :destroy, params: { id: @company }
			}.to change(Company, :count).by(-1)
		end

		it "redirects to companies#index" do
			delete :destroy, params: { id: @company }
			expect(response).to redirect_to companies_url
		end
	end
end