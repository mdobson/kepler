class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :notify_user

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :studies
  has_many :access_controls
  has_many :announcements
  has_many :example_subjects
  
  scope :get_user_id_from_email, lambda { |email|
    where("email = ?", email)
  }

  def notify_user
    Notification.registration(self).deliver
  end
end
