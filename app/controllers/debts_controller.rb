class DebtsController < ApplicationController
  def index
    @debts = Debt.all
  end

  def new
    @debt = Debt.new
  end

  def show

  end

  def create
    @debt = Debt.create(debt_params)
    if @debt.errors.empty?
      redirect_to @debt
    else
      render 'new'
    end
  end

  private

    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end
end
