class Conversation < ActiveRecord::Base
belongs_to :patient, :foreign_key => :patient_id, class_name: "User"
belongs_to :partner, :foreign_key => :partner_id, class_name: "User"

has_many :messages, dependent: :destroy
validates_uniqueness_of :patient_id, :scope => :partner_id

scope :between, -> (patient_id, partner_id) do 
  where (( "conversations.patient_id = ? AND conversations.partner_id = ?) 
  OR (conversations.patient_id = ? AND conversations.partner_id = ?) ",
  patient_id, partner_id, patient_id, partner_id)
  end 
end 