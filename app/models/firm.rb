class Firm < ApplicationRecord
    validates :firm_name, presence: true, length: { maximum: 20}, uniqueness: true 
end
