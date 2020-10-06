require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ががうまく行く時' do
      it "全ての項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "nameが40文字以内であれば登録できる" do
        @item.name = 12345678910
        expect(@item).to be_valid
      end
      it "explanationが1000文字以内であれば登録できる" do
        @item.explanation = 12345678979879789
        expect(@item).to be_valid
      end
      it "category_idが1でなければ登録できる" do
        @item.category_id = 3
        expect(@item).to be_valid
      end
      it 'status_idが1で無ければ登録できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_fee_idが1でなければ登録できる' do
        @item.delivery_fee_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_origin_idが1でなければ登録できる' do
        @item.shipping_origin_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_span_idが1でなければ登録できる' do
        @item.shipping_span_id = 2
        expect(@item).to be_valid
      end
      it 'priceが300〜9999999の間であれば登録できる' do
        @item.price = 33333
        expect(@item).to be_valid
      end
      it 'priceが半角文字であれば登録できる' do
        @item.price = 123456
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手くいかない時' do
      it "nameが空白だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it "category_idが1であると登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "status_idがが1であると登録できない" do
        @item.status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "delivery_fee_idが1であると登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担先を選択してください")
      end
      it "shipping_origin_idが1であると登録できない" do
        @item.shipping_origin_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it "shipping_span_idが1であると登録できない" do
        @item.shipping_span_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("配送までの日数を選択してください")
      end
      it "priceが300より小さいと登録できない" do
        @item.price = "50"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は299より大きい値にしてください")
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = "1000000000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("値段は10000000より小さい値にしてください")
      end
    end
  end
end