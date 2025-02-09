class ContactsController < ApplicationController
  def new
  end

  def create
    flash[:notice] = "お問い合わせを受け付けました。"
    redirect_to contact_path
  end
end
