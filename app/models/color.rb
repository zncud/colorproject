class Color < ApplicationRecord
    validates :rgb, presence: true, uniqueness: true
end