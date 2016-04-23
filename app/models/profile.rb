class Profile < ActiveRecord::Base
    belongs_to :user
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :job_title, presence: true
    validates :contact_email, presence: true
    
    # Paperclip code for profile image attachment
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    # End Paperclip code for profile image attachment
end