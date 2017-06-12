require 'rails_helper'

RSpec.describe CompanytypesController, type: :controller do
	login_user

	describe "GET #index" do 
		it "has a 200 status code" do
			get :index
			expect(response.code).to eq("200")
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
			expect(response.body).to eql("")
		end

		it "populates an array of companytypes" do
			companytypes = Companytype.all
			get :index
			expect(assigns(:companytypes)).to eq(companytypes)
		end
	end

	describe "GET #new" do
		it "populates a variable companytype" do
			companytype = Companytype.new
			get :new

			expect(assigns(:companytype)).eql?(companytype)
		end

		it "renders the new template" do
			get :new
			expect(response).to render_template(:new)
		end
	end

	describe "GET #show" do
		it "populates a variable companytype" do
			companytype = FactoryGirl.create(:companytype)
			get :show, params: { id: companytype }

			expect(assigns(:companytype)).to eql(companytype)
		end

		it "renders the show views" do
			get :show, params: { id: FactoryGirl.create(:companytype) }

			expect(response).to render_template(:show)
		end
	end

	describe "POST #create" do
		it "creates a new contact" do
			expect{
					post :create, params: {
						companytype: FactoryGirl.attributes_for(:companytype)
					}
				}.to change(Companytype, :count).by(1)
		end	

		it "redirects to another screen after creation" do
			post :create, params: {
				companytype: FactoryGirl.attributes_for(:companytype)
			}
			expect(response).to redirect_to(Companytype.last)
		end

		it "does not save the new contact" do
			expect{
				post :create, params: { 
					companytype: FactoryGirl.attributes_for(:invalidcompanytype)
				}
			}.to_not change(Companytype, :count)
		end
	end

	describe "PUT #update" do
		before :each do
			@companytype = FactoryGirl.create(:companytype, name: "band")
		end

		context "valid attributes" do
			it "saves the request in the @companytype variable" do
				put :update, params: {id: @companytype, companytype: FactoryGirl.attributes_for(:companytype)} 
				expect(assigns[:companytype]).to eq(@companytype)
			end

			it "changes @companytype's attributes" do
				put :update, params: {id: @companytype, companytype: FactoryGirl.attributes_for(:companytype, name: "Test")}
				@companytype.reload
				expect(@companytype.name).to eq("Test")
			end

			it "redirects to the updated contact" do
				put :update, params: { id: @companytype, companytype: FactoryGirl.attributes_for(:companytype)}
				expect(response).to redirect_to @companytype
			end
		end

		context "invalid attributes" do
			it "locates the requested @companytype" do
				put :update, params: { id: @companytype, companytype: FactoryGirl.attributes_for(:invalidcompanytype)}
				expect(assigns[:companytype]).to eq(@companytype)
			end

			it "does not change @companytype's attributes" do
				put :update, params: { id: @companytype, companytype: FactoryGirl.attributes_for(:invalidcompanytype)}
				@companytype.reload
				#expect(@companytype.name).to_not eq("")
				expect(@companytype.name).to eq("band")
			end

			it "re-renders the edit template" do
				put :update, params: { id: @companytype, companytype: FactoryGirl.attributes_for(:invalidcompanytype)}
				expect(response).to render_template :edit
			end
		end
	end

	describe "testing the views" do
		render_views

		describe "index" do
			it "renders the index template" do
				get :index
				expect(response.body).to match(/This is the Index View/)
			end
		end

		describe "index view with another template" do
			before do 
				def controller.index
					render :template => "other"
				end
			end
		end
	end

end
