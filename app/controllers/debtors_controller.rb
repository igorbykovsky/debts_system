class DebtorsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if(user_signed_in?)
      @debtors = Debtor.where(user_id: current_user.id)
    end
  end

  def show
    find_debtor
  end

  def new
    @debtor = current_user.debtors.new
  end

  def edit
    find_debtor
  end

  def create
    @debtor = current_user.debtors.new(debtor_params)

    # @debtor = Debtor.create(debtor_params)
    if @debtor.save
      flash[:success] = t('debtors.create.success')
      redirect_to @debtor
    else
      flash[:danger] = t('debtors.create.danger')
      render 'new'
    end
  end

  def update
    find_debtor
    if @debtor.update(debtor_params)
      redirect_to @debtor, success: t('debtors.update.success')
    else
      flash[:danger] = t('debtors.update.danger')
      render 'edit'
    end
  end

  def destroy
    find_debtor
    @debtor.destroy

    redirect_to debtors_path, success: t('debtors.delete.success')
  end

  def current
    @debtors = Debtor.where(user_id: current_user.id)
    @debtors = @debtors.select { |debtor| debtor.debts.inject(0) {|res, debt| res + debt.sum} != 0 }
  end

  private
    def debtor_params
      params.require(:debtor).permit(:name, :group)
    end

    def find_debtor
      @debtor = Debtor.find(params[:id])
      raise ActiveRecord::RecordNotFound unless @debtor.user_id == current_user.id
    end
end
