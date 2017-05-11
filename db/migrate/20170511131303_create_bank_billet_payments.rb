class CreateBankBilletPayments < ActiveRecord::Migration
  def change
    create_table :bank_billet_payments do |t|

      t.timestamps null: false
    end
  end
end
