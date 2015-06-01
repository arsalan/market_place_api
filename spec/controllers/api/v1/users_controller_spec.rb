require 'rails_helper'
require 'pp'

describe Api::V1::UsersController, type: :controller do
	describe "GET #show" do
		before(:each) do
			@user = FactoryGirl.create(:user)
			api_authorization_header(@user.auth_token)
			get :show, id: @user.id
		end

		it "returns the information about a resporter in a hash" do
			user_response = json_response
			expect(user_response[:email]).to eql @user.email
		end

		it { should respond_with(200) }
	end

	describe "POST #create" do
		context "when successfully created" do
			before(:each) do
				@valid_user = FactoryGirl.attributes_for :user
				api_authorization_header(@user.auth_token)
				post :create, { user: @valid_user }
			end

			it "renders the json representation for the newly created user" do
				user_response = json_response
				expect(user_response[:email]).to eql @valid_user[:email]
			end

			it { should respond_with 201 }
		end

		context	"when not created" do
			before(:each) do
				@invalid_user = { password: "2323", password_confirmation: "2323" }
				api_authorization_header(@user.auth_token)
				post :create, { user: @invalid_user }, format: :json
				@user_response = json_response
			end

			it "renders an errors key in the response json" do
				expect(@user_response).to have_key(:errors)
			end

			it "renders the reason for record not being created in the response json" do
				expect(@user_response[:errors][:email]).to include("can't be blank")
			end

			it "returns a 422 status code" do
				expect(@user_response[:status]).to eq(422)
			end
		end
	end

	describe "PUT/PATCH #update" do
		context "when update succeeds" do
			before(:each) do
				@user = FactoryGirl.create :user
				api_authorization_header(@user.auth_token)
				patch :update, 
					{ id: @user.id, user: { email: "another@example.com",  } }
			end

			it "renders the json for the updated user" do
				user_response = json_response
				expect(user_response[:email]).to eql "another@example.com"
			end	

			it { should respond_with 200 }
		end

		context "when update fails" do
			before(:each) do
				@user = FactoryGirl.create :user
				api_authorization_header(@user.auth_token)
				patch :update,
					{ id: @user.id, user: { email: "invalid email" } }
			end

			it "renders the json for error" do
				user_response = json_response
				expect(user_response).to have_key(:errors)
			end

			it "the error json contains the reason for failure" do
				user_response = json_response
				expect(user_response[:errors][:email]).to include "is invalid"
			end

			it { should respond_with 422 }
		end
	end

	describe "DELETE #destroy" do
		before(:each) do
			@user = FactoryGirl.create :user
			api_authorization_header(@user.auth_token)
			delete :destroy, { id: @user.id }
		end

		it { should respond_with 204 }
	end
end
