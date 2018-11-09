class DebtsController < ApplicationController

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
      redirect_to @debtor
    else
      render 'new'
    end
  end

  def update
    find_debtor
    find_debt

    if @debt.update(debt_params)
      redirect_to @debtor
    else
      render 'edit'
    end
  end

  def destroy
    find_debtor
    find_debt
    @debt.destroy

    redirect_to @debtor
  end

  def destroy_all
    find_debtor
    @debtor.debts.each {|debt| debt.destroy}

    redirect_to debtors_path
  end

  private
    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end

    def find_debtor
      @debtor = Debtor.where(id: params[:debtor_id]).first
      raise ActiveRecord::RecordNotFound unless @debtor
    end

    def find_debt
      @debt = @debtor.debts.where(id: params[:id]).first
      raise ActiveRecord::RecordNotFound unless @debt
    end
end
