class Group < ApplicationRecord
  has_many :menus, dependent: :destroy
end
