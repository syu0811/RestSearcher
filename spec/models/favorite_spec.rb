require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'Validation' do
    context '正常系' do
      it "成功する" do
        favorite = build(:favorite)
        expect(favorite).to be_valid
      end
    end

    context '異常系' do
      before do
        create(:favorite, shop_id: "J123456789")
      end

      it "shop_idが無ければ失敗する" do
        favorite = build(:favorite, shop_id: nil)
        favorite.valid?
        expect(favorite.errors[:shop_id]).to include('を入力してください')
      end

      it "shop_idが複数あれば失敗する" do
        favorite = build(:favorite, shop_id: "J123456789")
        favorite.valid?
        expect(favorite.errors[:shop_id]).to include('はすでに存在します')
      end

      it "shop_idが10文字でないと失敗する" do
        favorite = build(:favorite, shop_id: "J000")
        favorite.valid?
        expect(favorite.errors[:shop_id]).to include('は10文字で入力してください')
      end

      it "shop_idが指定の形でなければ失敗する" do
        user = build(:favorite, shop_id: "J00000000J")
        user.valid?
        expect(user.errors[:shop_id]).to include('は不正な値です')
      end

      it "nameが無ければ失敗する" do
        favorite = build(:favorite, name: nil)
        favorite.valid?
        expect(favorite.errors[:name]).to include('を入力してください')
      end

      it "genreが無ければ失敗する" do
        favorite = build(:favorite, genre: nil)
        favorite.valid?
        expect(favorite.errors[:genre]).to include('を入力してください')
      end

      it "openが無ければ失敗する" do
        favorite = build(:favorite, open: nil)
        favorite.valid?
        expect(favorite.errors[:open]).to include('を入力してください')
      end

      it "photoが無ければ失敗する" do
        favorite = build(:favorite, photo: nil)
        favorite.valid?
        expect(favorite.errors[:photo]).to include('を入力してください')
      end
    end
  end
end
