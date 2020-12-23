FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"aaa@aaa"}
    password              {"0000aa"}
    password_confirmation {password}
    camp_history          {"11"}
    age                   {"00"}
    favorite_camp_type    {"ああああ"}
  end
end