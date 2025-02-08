  User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲストユーザー"
  end
  
  User.find_or_create_by!(email: 'admin_guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲスト管理者"
    user.admin = true
  end

  User.find_or_create_by!(email: "test@example.com") do |user|
    user.name = "Test User"
    user.password = "password"
    user.password_confirmation = "password"
  end
  
  # ユーザーのシードデータ
  User.create!([
   { name: "山田 太郎", email: "taro@example.com", password: "password", admin: false },
   { name: "鈴木 健太", email: "kenta@example.com", password: "password", admin: false },
   { name: "佐藤 花子", email: "hanako@example.com", password: "password", admin: false },
   { name: "田中 健", email: "ken@example.com", password: "password", admin: false },
   { name: "管理者", email: "admin@example.com", password: "adminpassword", admin: true }
  ])

# バイヤーリクエストのシードデータ
  BuyerRequest.create!([
   { product_name: "化学品A", quantity: 100, delivery_address: "東京", delivery_date: "2025-02-10" },
   { product_name: "化学品B", quantity: 50, delivery_address: "大阪", delivery_date: "2025-02-15" },
   { product_name: "化学品C", quantity: 200, delivery_address: "名古屋", delivery_date: "2025-02-20" },
   { product_name: "化学品D", quantity: 150, delivery_address: "福岡", delivery_date: "2025-02-25" },
   { product_name: "化学品E", quantity: 80, delivery_address: "札幌", delivery_date: "2025-02-28" }
 ])


# セラーオファーのシードデータ
  SellerOffer.create!([
   { buyer_request_id: 1, user_id: 3, price: 50000, description: "化学品Aをお届け可能です。" },
   { buyer_request_id: 2, user_id: 4, price: 30000, description: "化学品Bの価格を提案します。" },
   { buyer_request_id: 3, user_id: 5, price: 80000, description: "化学品Cの在庫があります。" },
   { buyer_request_id: 4, user_id: 1, price: 15000, description: "化学品Dの見積をお送りします。" },
   { buyer_request_id: 5, user_id: 2, price: 60000, description: "化学品Eの特価オファーです。" }
  ])

# タスクのシードデータ
  Task.create!([
   { user_id: 1, title: "見積依頼の確認", status: "未完了" },
   { user_id: 2, title: "契約書の準備", status: "進行中" },
   { user_id: 3, title: "サプライヤーとの交渉", status: "完了" },
   { user_id: 4, title: "価格交渉", status: "未完了" },
   { user_id: 5, title: "納期調整", status: "進行中" }
  ])

  puts "Seedデータの作成が完了しました！"


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
