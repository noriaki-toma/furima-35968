class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :address1, :address2, :telephone, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
     order= Order.create(item_id: item_id, user_id: user_id)
     Address.create(postal: postal, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, telephone: telephone, order_id: order.id)
  end
end