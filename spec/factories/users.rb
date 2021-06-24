FactoryBot.define do
  factory :user do
    nickname              { 'aaaaaa' }
    email                 { Faker::Internet.email }
    password              { 'aaaaaa2' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1994-08-13' }
  end
end