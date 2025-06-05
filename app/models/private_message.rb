class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :join_table_recipient_pms
  has_many :recipients, through: :join_table_recipient_pms, source: :recipient
end
