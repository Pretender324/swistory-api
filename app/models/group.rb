class Group < ApplicationRecord
  belongs_to :group
  has_many :menus, dependent: :destroy
end
