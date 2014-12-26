class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  after_create :init, :mailchimp_subscribe

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

  def status
    self.admitted? ? "accepted" : "pending"
  end

  def major
    self.user_info.major
  end

  def university
    self.user_info.university
  end

  def self.year_in_school_choices
    ["Freshman", "Sophomore", "Junior", "Senior", "Graduate Student"]
  end

  def self.skillset_choices
    ["Hacker", "Designer", "Marketer", "I'm just awesome"]
  end

  def find_university
    # grab domain from email address
    school_url = self.email.split("@")[1]
    # grab first result
    university = University.where("url LIKE ?", "%#{school_url}%")[0]
    return university.try(:name)
  end

  def mailchimp_subscribe
    # subscribe them to the new "registered" Hackpoly 2015 mailchimp list
    list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def init
    # initialize user_info, prefill university field from email
    UserInfo.create(user: self, university: self.find_university) if self.user_info.nil?
  end


end
