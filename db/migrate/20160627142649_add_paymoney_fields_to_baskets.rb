class AddPaymoneyFieldsToBaskets < ActiveRecord::Migration
  def change
    add_column :baskets, :paymoney_account_number, :text
    add_column :baskets, :paymoney_account_token, :string
    add_column :baskets, :paymoney_reload_request, :text
    add_column :baskets, :paymoney_reload_response, :text
    add_column :baskets, :paymoney_token_request, :text
    add_column :baskets, :paymoney_transaction_id, :string
  end
end
