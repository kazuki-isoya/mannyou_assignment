FactoryBot.define do
  factory :user do
    # id { 1 }
    name { "user" }
    email { "user@email.com" }
    password { "password" }
    admin { true }
  end
end
