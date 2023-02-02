FactoryBot.define do
  factory :profile do
    account { nil }
    name { "MyString" }
    date_of_birth { "2023-01-29" }
    gender { "" }
  end
end
