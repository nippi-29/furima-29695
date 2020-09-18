require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての情報が正式な値であれば保存が出来る' do
      expect(@order_address).to be_valid
    end

    it 'postcodeが空の場合に保存が出来ないこと' do
      @order_address.postcode = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeが入力されていません。', 'Postcodeは-を含む半角数字7桁で入力してください')
    end

    it 'postcodeに「-」が無い場合に保存が出来ないこと' do
      @order_address.postcode = 1_234_567
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postcodeは-を含む半角数字7桁で入力してください')
    end

    it 'prefecture_idが1の場合に保存が出来ないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefectureは1以外の値にしてください')
    end

    it 'cityが空の場合に保存が出来ないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Cityが入力されていません。')
    end

    it 'blockが空の場合に保存が出来ないこと' do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Blockが入力されていません。')
    end

    it 'buildingが空でも保存は出来る' do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it 'phone_numberが空の場合に保存が出来ないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberが入力されていません。', 'Phone numberは-を含まない10桁か11桁の半角英数字で入力してください')
    end

    it 'phone_numberが9文字以下の場合に保存が出来ないこと' do
      @order_address.phone_number = 123_456_789
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは-を含まない10桁か11桁の半角英数字で入力してください')
    end

    it 'phone_numberに「-」が含まれる場合に保存が出来ないこと' do
      @order_address.phone_number = 0o6 - 234 - 1234
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone numberは-を含まない10桁か11桁の半角英数字で入力してください')
    end

    it 'tokenが空の場合に保存が出来ないこと' do
      @order_address.token = nil
      @order_address.valid?
      binding.pry
      expect(@order_address.errors.full_messages).to include("Tokenが入力されていません。")
    end
  end
end
