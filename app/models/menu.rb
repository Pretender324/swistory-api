class Menu < ApplicationRecord
  belongs_to :group
  has_many :practices, dependent: :destroy
end
