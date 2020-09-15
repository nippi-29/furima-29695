class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
    validates :postcode,          format: { with:  /\A[0-9]{3}-[0-9]{4}\z/, message: "は-を含む半角数字7桁で入力してください"}
    validates :prefecture_id,     numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number,      format: { with: /\A\d{10,11}\z/, message: 'は-を含まない10桁か11桁の半角英数字で入力してください'}
  end

end
