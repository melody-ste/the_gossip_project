class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: :sender_id
  has_many :received_messages, through: :join_table_recipient_pms, source: :private_message
end
