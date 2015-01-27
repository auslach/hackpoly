class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  after_create :init, :mailchimp_subscribe

  has_one :user_info

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.edu+\z/i

  validates :email,   presence: true,
                      length: { maximum: 50 },
                      uniqueness: { case_sensitive: false }
  validates_format_of :email, with: EMAIL_REGEX, message: "You must have a valid .edu email address."

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
    MAILCHIMP.lists.subscribe(list_id,
                              { email: self.email },
                              { 'FNAME' => '', 'LNAME' => '' },
                              'html', false)
  end

  def init
    # initialize user_info, prefill university field from email
    UserInfo.create(user: self, university: self.find_university) if self.user_info.nil?
  end


end
