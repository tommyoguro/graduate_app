class Contact < ApplicationRecord
 validates :name, presence: { message: "お名前を入力してください。" }
 validates :email, presence: { message: "メールアドレスを入力してください。" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "正しいメールアドレスを入力してください。" }
 validates :message, presence: { message: "お問い合わせ内容を入力してください。" }
end
