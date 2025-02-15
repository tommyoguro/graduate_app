  User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲストユーザー"
    user.name_kana = "ゲストユーザー" # ← 追加
  end
  
  User.find_or_create_by!(email: 'admin_guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲスト管理者"
    user.name_kana = "ゲストカンリシャ" # ← 追加
    user.admin = true
  end

  User.find_or_create_by!(email: "test@example.com") do |user|
    user.name = "Test User"
    user.name_kana = "テストユーザー" # ← 追加
    user.password = "password"
    user.password_confirmation = "password"
  end

  # ユーザーのシードデータ
User.create!(
  [
    { email: "user11@example.com", password: "password", name: "田中 太郎", name_kana: "タナカタロウ", company_name: "ABC商事", division_name: "営業部", is_deleted: false, is_admin: false },
    { email: "user12@example.com", password: "password", name: "鈴木 花子", name_kana: "スズキハナコ", company_name: "XYZ株式会社", division_name: "マーケティング部", is_deleted: false, is_admin: false },
    { email: "user13@example.com", password: "password", name: "佐藤 次郎", name_kana: "サトウジロウ", company_name: "DEF工業", division_name: "技術部", is_deleted: false, is_admin: false },
    { email: "admin1@example.com", password: "password", name: "管理者1", name_kana: "カンリシャイチ", company_name: "管理会社1", division_name: "システム管理部", is_deleted: false, is_admin: true },
    { email: "guest1@example.com", password: "password", name: "ゲストユーザー1", name_kana: "ゲストイチ", company_name: "ゲスト会社1", division_name: "ゲスト部", is_deleted: false, is_admin: false },
    { email: "test@example.com", password: "password", name: "テストユーザー", name_kana: "テストユーザー", company_name: "テスト会社", division_name: "テスト部", is_deleted: false, is_admin: false }
  ]
)




# 見積依頼（BuyerRequest）のシードデータ
buyer_requests = BuyerRequest.create!(
  [
    { product_name: "ノートPC", quantity: 10, delivery_address: "東京都渋谷区1-1-1", delivery_date: Date.today + 10 },
    { product_name: "プリンター", quantity: 5, delivery_address: "大阪府大阪市2-2-2", delivery_date: Date.today + 15 },
    { product_name: "モニター", quantity: 8, delivery_address: "愛知県名古屋市3-3-3", delivery_date: Date.today + 12 },
    { product_name: "キーボード", quantity: 20, delivery_address: "北海道札幌市4-4-4", delivery_date: Date.today + 8 },
    { product_name: "マウス", quantity: 15, delivery_address: "福岡県福岡市5-5-5", delivery_date: Date.today + 14 }
  ]
)

# 売り手オファー（SellerOffer）のシードデータ
SellerOffer.create!(
  [
    { buyer_request_id: buyer_requests[0].id, price: 100000, delivery_date: Date.today + 9 },
    { buyer_request_id: buyer_requests[1].id, price: 50000, delivery_date: Date.today + 14 },
    { buyer_request_id: buyer_requests[2].id, price: 75000, delivery_date: Date.today + 11 },
    { buyer_request_id: buyer_requests[3].id, price: 30000, delivery_date: Date.today + 7 },
    { buyer_request_id: buyer_requests[4].id, price: 20000, delivery_date: Date.today + 13 }
  ]
)

# タスク（Tasks）のシードデータ
Task.create!(
  [
    { title: "企画書作成", content: "新規プロジェクトの企画書を作成する" },
    { title: "営業資料作成", content: "営業部向けの提案資料を準備する" },
    { title: "製品デモ準備", content: "顧客向けの製品デモの準備を行う" },
    { title: "予算計画作成", content: "来期の予算計画を策定する" },
    { title: "開発スケジュール作成", content: "システム開発のスケジュールを作成する" }
  ]
)

puts "シードデータの作成が完了しました！"

  

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
