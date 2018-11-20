class DebtsController < ApplicationController
  before_action :authenticate_user!

  def new
    find_debtor
    @debt = @debtor.debts.new
  end

  def edit
    find_debtor
    find_debt
  end

  def create
    find_debtor
    @debt = @debtor.debts.create(debt_params)

    if @debt.errors.empty?
      redirect_to @debtor, success: "Debt successfully created"
    else
      flash[:danger] = "Debt not created"
      render 'new'
    end
  end

  def update
    find_debtor
    find_debt

    if @debt.update(debt_params)
      redirect_to @debtor, success: "Debt successfully updated"
    else
      flash[:danger] = "Debt not updated"
      render 'edit'
    end
  end

  def destroy
    find_debtor
    find_debt
    @debt.destroy

    redirect_to @debtor, success: "Debtor successfully deleted"
  end

  def destroy_all
    find_debtor
    @debtor.debts.each {|debt| debt.destroy}

    redirect_to debtors_path, success: "All debts successfully deleted"
  end

  private
    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end

    def find_debtor
      @debtor = Debtor.find(params[:debtor_id])
      raise ActiveRecord::RecordNotFound unless @debtor.user_id == current_user.id
    end

    def find_debt
      @debt = @debtor.debts.find(params[:id])
    end
end
