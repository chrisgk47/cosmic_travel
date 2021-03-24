class Scientist < ApplicationRecord
    has_many :missions
    has_many :planets, through: :missions

    validates :name, uniqueness: true

    
end
