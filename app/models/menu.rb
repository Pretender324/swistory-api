class Menu < ApplicationRecord
  has_many :practices, dependent: :destroy
end
