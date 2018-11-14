class DebtorsController < ApplicationController

  def index
    @debtors = Debtor.all
  end

  def show
    find_debtor
  end

  def new
    @debtor = Debtor.new
  end

  def edit
    find_debtor
  end

  def create
    @debtor = Debtor.new(debtor_params)

    # @debtor = Debtor.create(debtor_params)
    if @debtor.save
      flash[:success] = "Good! You created a Debtor."
      redirect_to @debtor
    else
      flash.now[:error] = "A few mistakes."
      render 'new'
    end
  end

  def update
    find_debtor
    if @debtor.update(debtor_params)
      redirect_to @debtor
    else
      render 'edit'
    end
  end

  def destroy
    find_debtor
    @debtor.destroy

    redirect_to debtors_path
  end

  def current
    @debtors = Debtor.all
    @debtors = @debtors.select { |debtor| debtor.debts.inject(0) {|res, debt| res + debt.sum} != 0 }
  end

  private
    def debtor_params
      params.require(:debtor).permit(:name, :group)
    end

    def find_debtor
      @debtor = Debtor.find(params[:id])
      # raise ActiveRecord::RecordNotFound unless @debtor
    end
end
