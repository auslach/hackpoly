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
  validates :year_in_school,      length: { maximum: 20 }
  validates :skillset,            length: { maximum: 20 }

  # user stats
  validates :gender,              length: { maximum: 30 }
  validates :age,                 length: { maximum: 2 },
                                  numericality: { greater_than: 0,
                                                  allow_nil: true }
  validates :ethnicity,           length: { maximum: 50 }

  def self.year_in_school_choices
    ["Freshman", "Sophomore", "Junior", "Senior", "Graduate Student"]
  end

  def self.skillset_choices
    ["Hacker", "Designer", "Marketer", "I'm just awesome"]
  end

  def self.gender_choices
    ["Male", "Female", "Other", "Prefer not to disclose"]
  end

  def self.ethnicity_choices
    ["Hispanic or Latino", "American Indian or Alaska Native", "Asian", "Black or African American", "Native Hawaiian or Pacific Islander", "White", "Other", "Two or more ethnicities", "Prefer not to disclose"]
  end

end
