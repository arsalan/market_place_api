FactoryGirl.define do
  factory :product do
    title { FFaker::Product.product_name }
		price { SecureRandom.random_number 100 }
		published false
		user_id "1"
	end
end
