FactoryBot.define do
  factory :favorite do
    shop_id { 'J999999999' }
    name { 'テスト' }
    genre { 'テストジャンル' }
    open { '営業日テスト' }
    photo { 'htttps' }
  end
end
