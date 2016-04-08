class Uba < ActiveRecord::Base
  belongs_to :service
  belongs_to :operation
  belongs_to :currency

  attr_accessible :firstname, :lastname, :email, :phone_number, :number, :username, :password, :channel_id, :service_id, :payment_status, :operation_id, :transaction_amount, :notified_to_back_office, :transaction_id, :fees, :currency_id, :paid_transaction_amount, :paid_currency_id, :rate, :conflictual_transaction_amount, :conflictual_currency, :compensation_rate, :original_transaction_amount, :login_id, :txn_id, :uba_redirect_url, :uba_redirect_response, :return_params
end
