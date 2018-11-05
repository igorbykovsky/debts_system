class DebtsController < ApplicationController
  def index
    @debts = Debt.all
  end

  def show
    @debt = Debt.find(params[:id])
  end

  def new
    @debt = Debt.new
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def create
    @debt = Debt.create(debt_params)
    if @debt.errors.empty?
      redirect_to @debt
    else
      render 'new'
    end
  end

  def update
    @debt = Debt.find(params[:id])

    if @debt.update(debt_params)
      redirect_to @debt
    else
      render 'edit'
    end
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy

    redirect_to debts_path
  end

  private

    def debt_params
      params.require(:debt).permit(:sum, :description, :deal_date)
    end
end
