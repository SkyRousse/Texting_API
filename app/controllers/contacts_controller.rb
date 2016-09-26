class ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts.all
  end

  def new
    @contact = current_user.contacts.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      flash[:notice] = "Your contact was saved"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
