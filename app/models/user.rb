class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_one :user_info

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,   presence: true,
                      length: { maximum: 50 },
                      format: { with: EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

  def greeting
    first_name = self.user_info.first_name
    first_name.blank? ? self.email : first_name
  end

  def major
    self.user_info.major
  end

  def self.year_in_school_choices
    ["Freshman", "Sophomore", "Junior", "Senior"]
  end

  def self.skillset_choices
    ["Hacker", "Designer", "Marketer", "I'm just awesome"]
  end

  # override devise after_confirmation
  def after_confirmation
    self.user_info || UserInfo.create(user: self)
    self.admin = false
    self.admitted = false
    self.save
  end

end
