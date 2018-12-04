require 'rails_helper'

RSpec.describe DebtorsController, type: :controller do
  describe "show action" do
    before(:each) do
      @user = create(:user)
      sign_in @user
      @debtor = create(:debtor)
      @user.debtors << @debtor

      @debt1 = create(:debt)
      @debt2 = create(:debt, { sum: 20 })
      @debtor.debts << @debt1
      @debtor.debts << @debt2
    end

    it "shows debts of debtor if debtor is found" do
      get :show, params: { id: @debtor.id }
      expect(response).to render_template("show")
    end

    it "goes to page 404 not found" do
      get :show, params: { id: 0 }
      expect(response.status).to eq 404
    end
  end
end
