FactoryGirl.define do
  factory :user do
    name 'Buster'
    username 'testbot'
    email 'test@example.com'
    password '12345678'
    password_confirmation '12345678'

    factory :album do
        title 'album'
    end
  end
end