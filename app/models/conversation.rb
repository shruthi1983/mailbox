class Conversation < ActiveRecord::Base
  belongs_to :sender, :foriegn_key => :sender_id, class_name: 'User'
  belongs_to :recipient, :foriegn_key => :recipient_id, class_name: 'User'	



  has_many :messages,dependent: :destroy
  validates_uniqueness_of :sender_id, :scope => :recipient_id

  scope :between, -> (sender_id,recipient_id) do 
  	  where ("conversation.sender_id = ? AND conversation.recipient_id = ?) 
  	  	OR (conversation.sender_id = ? AND conversation.recipient_id = ?)",
  	  	sender_id,recipient_id,recipient_id,sender_id)
  	end  
  	
  end