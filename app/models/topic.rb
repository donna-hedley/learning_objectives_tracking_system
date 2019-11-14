class Topic < ApplicationRecord
  has_many :objectives, dependent: :destroy
end
