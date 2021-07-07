FactoryBot.define do
  factory :order_address do
    postal { '123-1234' }
    prefecture_id { 2 }
    city { '大阪市' }
    address1 { '難波1-1-1' }
    address2 { '難波ビル' }
    telephone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

