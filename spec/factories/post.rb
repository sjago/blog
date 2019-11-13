FactoryGirl.define do
	factory :post do
    title { 'My title' }
    content { 'This is my post content' }
    slug { 'some slug' }
  end
end