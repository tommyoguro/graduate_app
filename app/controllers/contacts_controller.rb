class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_thank_you_path, notice: "お問い合わせありがとうございました。"
    else
      render :new
    end
  end

  private 

  def contact_params
    if params[:contact].present?
      params.require(:contact).permit(:name, :email, :message)
    else
      params.permit(:name, :email, :message)  # 直接取得する
    end
  end
end 
