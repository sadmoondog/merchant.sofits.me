class Payment < ActiveRecord::Base
  attr_accessible :[user_id, :amount, :date, :service, :status
end
