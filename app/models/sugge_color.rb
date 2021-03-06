class SuggeColor < ApplicationRecord
    validates :rgb, presence: true, uniqueness: true
end
