class UserInfo < ActiveRecord::Base

  belongs_to :user

  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
  validates :major, length: { maximum: 100 }
  validates :website_url, length: { maximum: 100 }
  validates :github_url, length: { maximum: 100 }
  validates :linkedin_url, length: { maximum: 100 }
  validates :coolest_built, length: { maximum: 200 }
  validates :previous_hackathons, length: { maximum: 200 }

end
