class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping_date
  belongs_to :user
  has_one_attached :image


  with_option presence: true do
    validates :name,                     length: { maximum: 40 }
    validates :description,              length: { maximum: 1000 }
    validates :category_id,              numericality: { other_than: 1 }
    validates :item_status_id,           numericality: { other_than: 1 }
    validates :postage_id,               numericality: { other_than: 1 }
    validates :region_id,                numericality: { other_than: 1 }
    validates :shipping_date_id,         numericality: { other_than: 1 }
    validates :price,                    format: {  with: /\A[a-zA-Z0-9]+\z/
                                                    greater_than_or_equal_to: 300
                                                    less_than_or_equal_to: 9,999,999}
  end

end

