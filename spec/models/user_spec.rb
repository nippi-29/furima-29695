require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての記入欄に正式な値があれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが空の場合に登録が出来ないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Nameが入力されていません。')
    end

    it 'emailが空の場合に登録が出来ないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Emailが入力されていません。', 'Emailは＠マークが必要です')
    end

    it 'emailに@がないときに登録できないこと' do
      @user.email = 'rails.test.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Emailは＠マークが必要です')
    end

    it 'passwordが空の場合に登録が出来ないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordが入力されていません。', 'Passwordは6文字以上の半角英数字の混合で入力してください', 'Password confirmationが内容とあっていません。')
    end

    it 'passwordが存在してもpassword_confirmationが空の場合に登録が出来ないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password confirmationが内容とあっていません。')
    end

    it 'passwordが6文字以上の半角英数字の混合であれば登録が出来ること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa111'
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上でも半角英字だけでは登録が出来ないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは6文字以上の半角英数字の混合で入力してください')
    end

    it 'passwordが6文字以上でも半角数字だけでは登録が出来ないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは6文字以上の半角英数字の混合で入力してください')
    end

    it 'passwordが5文字以下の場合に登録が出来ないこと' do
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Passwordは6文字以上の半角英数字の混合で入力してください')
    end

    it 'last_nameが空の場合に登録が出来ないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last nameが入力されていません。', 'Last nameは全角文字で入力してください')
    end

    it 'last_nameが全角文字でなければ登録が出来ないこと' do
      @user.last_name = 'nipi'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last nameは全角文字で入力してください')
    end

    it 'first_nameが空の場合に登録が出来ないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First nameが入力されていません。', 'First nameは全角文字で入力してください')
    end

    it 'first_nameが全角文字でなければ登録が出来ないこと' do
      @user.first_name = 'nipi'
      @user.valid?
      expect(@user.errors.full_messages).to include('First nameは全角文字で入力してください')
    end

    it 'last_name_kanaが空の場合に登録が出来ないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanaが入力されていません。', 'Last name kanaは全角カタカナで入力してください')
    end

    it 'last_name_kanaが全角カタカナでなければ登録が出来ないこと' do
      @user.last_name_kana = '田中'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanaは全角カタカナで入力してください')
    end

    it 'first_name_kanaが空の場合に登録が出来ないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanaが入力されていません。', 'First name kanaは全角カタカナで入力してください')
    end

    it 'first_name_kanaが全角カタカナでなければ登録が出来ないこと' do
      @user.first_name_kana = '太朗'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanaは全角カタカナで入力してください')
    end

    it 'birthdayが空の場合に登録が出来ないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Birthdayが入力されていません。')
    end

    it '重複したemailが存在する場合に登録が出来ないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Emailは既に使用されています。')
    end
  end
end
