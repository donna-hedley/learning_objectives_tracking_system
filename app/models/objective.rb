class Objective < ApplicationRecord
  belongs_to :topic
  has_many :notes , dependent: :destroy
  has_many :users, through: :notes
end
