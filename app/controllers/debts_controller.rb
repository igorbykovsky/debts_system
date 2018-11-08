class DebtsController < ApplicationController

  def new
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.new
  end

  def edit
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.find(params[:id])
  end

  def create
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.create(debt_params)

    if @debt.errors.empty?
      redirect_to @debtor
    else
      render 'new'
    end
  end

  def update
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.find(params[:id])

    if @debt.update(debt_params)
      redirect_to @debtor
    else
      render 'edit'
    end
  end

  def destroy
    @debtor = Debtor.find(params[:debtor_id])
    @debt = @debtor.debts.find(params[:id])
    @debt.destroy

    redirect_to @debtor
  end

  def destroy_all
    @debtor = Debtor.find(params[:debtor_id])
    @debtor.debts.each {|debt| debt.destroy}

    redirect_to debtors_path
  end

  private
    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end
end
