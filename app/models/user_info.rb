class UserInfo < ActiveRecord::Base

  belongs_to :user

  validates :first_name,          length: { maximum: 100 }
  validates :last_name,           length: { maximum: 100 }
  validates :major,               length: { maximum: 100 }
  validates :website_url,         length: { maximum: 100 }
  validates :github_url,          length: { maximum: 100 }
  validates :linkedin_url,        length: { maximum: 100 }
  validates :coolest_built,       length: { maximum: 300 }
  validates :previous_hackathons, length: { maximum: 300 }
  validates :university,          length: { maximum: 100 }
  validates :year_in_school,      length: { maximum: 10 }
  validates :skillset,            length: { maximum: 20 }

end
