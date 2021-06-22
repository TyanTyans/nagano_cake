class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.rquire(:customer).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :zip_code, :address, :phone_number, :email, :is_deleted)
  end

end
