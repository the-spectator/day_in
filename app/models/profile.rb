class Profile < ApplicationRecord
  belongs_to :account

  enum :genders, {
    male: 'male',
    female: 'female',
    other: 'other'
  }
end
