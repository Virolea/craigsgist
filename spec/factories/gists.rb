FactoryGirl.define do
  factory :gist do
    description "description"
    title "title"
    language "ruby"
    code "this is code"
    association :user
  end
end
