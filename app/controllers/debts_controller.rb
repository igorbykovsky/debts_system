class DebtsController < ApplicationController

  def new
    @debtor = find_debtor
    @debt = @debtor.debts.new
  end

  def edit
    @debtor = find_debtor
    @debt = @debtor.debts.find(params[:id])
  end

  def create
    @debtor = find_debtor
    @debt = @debtor.debts.create(debt_params)

    if @debt.errors.empty?
      redirect_to @debtor
    else
      render 'new'
    end
  end

  def update
    @debtor = find_debtor
    @debt = @debtor.debts.find(params[:id])

    if @debt.update(debt_params)
      redirect_to @debtor
    else
      render 'edit'
    end
  end

  def destroy
    @debtor = find_debtor
    @debt = @debtor.debts.find(params[:id])
    @debt.destroy

    redirect_to @debtor
  end

  def destroy_all
    @debtor = find_debtor
    @debtor.debts.each {|debt| debt.destroy}

    redirect_to debtors_path
  end

  private
    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end

    def find_debtor
      Debtor.find(params[:debtor_id])
    end
end
