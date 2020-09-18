class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :postcode,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は-を含む半角数字7桁で入力してください' }
    validates :prefecture_id,     numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は-を含まない10桁か11桁の半角英数字で入力してください'}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
