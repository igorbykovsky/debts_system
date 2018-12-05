require 'rails_helper'

RSpec.describe DebtorsController, type: :controller do
  def self.it_renders_404_when_debtor_is_not_found(*actions)
    actions.each do |a|
      it "#{a} renders 404 page when debtor is not found" do
        @user = create(:user)
        sign_in @user
        process a, params: { id: 0 }
        expect(response.status).to eq 404
      end
    end
  end

  def self.it_redirects_to_log_in_page_when_guest_is_not_logging(*actions)
    actions.each do |a|
      it "#{a} redirects to log in page" do
        process a, params: { id: 1 }
        expect(response.status).to redirect_to('/users/sign_in')
      end
    end
  end

  it_renders_404_when_debtor_is_not_found :show, :destroy, :edit, :update
  it_redirects_to_log_in_page_when_guest_is_not_logging :show, :destroy, :edit, :update

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
  end

  describe "create action" do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    it "redirects to debtor page if validation pass" do
      post :create, params: { debtor: { name: "Debtor 1", group: "Family" } }
      expect(response).to redirect_to(debtor_path(assigns(:debtor)))
    end

    it "renders new debtor page again if validation not pass" do
      post :create, params: { debtor: { name: nil, group: "Family" } }
      expect(response).to render_template('new')
    end
  end

  describe "destroy action" do
    before(:each) do
      @user = create(:user)
      sign_in @user
    end

    it "redirects to index if debtor is deleted" do
      @debtor = create(:debtor)
      @user.debtors << @debtor
      delete :destroy, params: { id: @debtor.id }
      expect(response).to redirect_to(debtors_path)
    end
  end
end
