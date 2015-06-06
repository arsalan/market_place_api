# spec/models/user.rb

require 'rails_helper'

describe User do
	before { @user = FactoryGirl.build(:user) }

	subject { @user }

	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_confirmation_of(:password) }
	it { should allow_value('user@example.com').for(:email)}

	it { should be_valid }

	it { should respond_to(:auth_token) }
	it { should validate_uniqueness_of(:auth_token) }

	it { should have_many(:products) }

	describe "#products association" do
		before do
			@user.save
			3.times { FactoryGirl.create :product, user: @user }
		end

		it "destroying a user cascades to destroying the associated products" do
			products = @user.products
			@user.destroy
			products.each do |product|
				expect(Product.find(product)).to raise_error ActiveRecord::RecordNotFound
			end
		end
	end

	describe '#generate_authentication_token!' do
		let(:stubbed_token) { stubbed_token = "stubbed_unique_token" }
		it "generates a unique token" do
			Devise.stub(:friendly_token).and_return(stubbed_token)
			@user.generate_authentication_token!
			expect(@user.auth_token).to eql stubbed_token
		end

		it "generates a different unique token upon successive calls" do
			@user.generate_authentication_token!
			expect(@user.auth_token).not_to eql stubbed_token
		end
	end
end
