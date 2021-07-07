class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :postage

  with_options presence: true do
    validates :image
    validates :name
    validates :text

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :shipping_day_id
    end

    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  end

  has_one_attached :image
  belongs_to :user
  has_one :order
end
