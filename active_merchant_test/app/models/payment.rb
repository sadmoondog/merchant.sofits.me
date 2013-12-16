class Payment < ActiveRecord::Base
  attr_accessible :user_id, :amount, :date, :service, :status

  def update_attribute(i, i1)
    # code here
  end
end
