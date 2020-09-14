require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品の新規投稿' do
    before do
      @product = FactoryBot.build(:product)
    end

    it '全ての記入欄に正式な値があれば投稿できる' do
      expect(@product).to be_valid
    end

    it 'imageが空の場合に投稿ができないこと' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Imageが入力されていません。')
    end

    it 'nameが空の場合に投稿ができないこと' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Nameが入力されていません。')
    end

    it 'descriptionが空の場合に投稿ができないこと' do
      @product.description = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Descriptionが入力されていません。')
    end

    it 'category_idが1の場合に投稿ができないこと' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Categoryは1以外の値にしてください')
    end

    it 'item_status_idが1の場合に投稿ができないこと' do
      @product.item_status_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Item statusは1以外の値にしてください')
    end

    it 'postage_idが1の場合に投稿ができないこと' do
      @product.postage_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Postageは1以外の値にしてください')
    end

    it 'region_idが1の場合に投稿ができないこと' do
      @product.region_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Regionは1以外の値にしてください')
    end

    it 'shipping_date_idが1の場合に投稿ができないこと' do
      @product.shipping_date_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipping dateは1以外の値にしてください')
    end

    it 'priceが空の場合に投稿ができないこと' do
      @product.price = nil
      @product.valid?
      expect(@product.errors.full_messages).to include('Priceが入力されていません。')
    end

    it 'priceが300未満の場合に投稿ができないこと' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Priceは300以上の値にしてください')
    end

    it 'priceが10000000以上の場合に投稿ができないこと' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Priceは9999999以下の値にしてください')
    end

    it 'priceが半角数字以外の場合に投稿ができないこと' do
      @product.price = 'test'
      @product.valid?
      expect(@product.errors.full_messages).to include('Priceは数値で入力してください')
    end
  end
end
