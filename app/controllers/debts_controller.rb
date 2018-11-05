class DebtsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    @debt = Debt.create(debts_params)
  end

  private
  def debts_params

  end
end
