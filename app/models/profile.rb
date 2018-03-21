class Profile < ApplicationRecord

  ## Associations
  belongs_to :user

  delegate :first_name, :to => :user, prefix: true

  ## Nested 
  accepts_nested_attributes_for :user

  ## Validations
  validates :date_of_birth, presence: true

  ## Paperclip
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  do_not_validate_attachment_file_type :avatar

end
