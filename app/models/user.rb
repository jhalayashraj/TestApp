class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: false, login: true}

  ## Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_create :build_profile

  def build_profile
    self.create_profile.save(validate: false)
  end

  attr_accessor :login

  ## Class Methods
  def login=(login)
    @login = login
  end

  def login
    @login || self.user_name || self.email
  end

  def self.find_for_database_authentication(conditions={})
  	find_by(user_name: conditions[:login]) || find_by(email: conditions[:login])
	end
end
