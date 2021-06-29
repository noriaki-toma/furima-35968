FactoryBot.define do
  factory :item do
    association :user
    category_id              { 3 }
    condition_id             { 3 }
    price                 { 1111 }
    name                  { 'あ' }
    text                  { 'あ' }
    shipping_day_id { 3 }
    postage_id { 3 }
    prefecture_id { 3 }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end