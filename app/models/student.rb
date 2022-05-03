class Student < ApplicationRecord
    belongs_to :instructor
    validates :name, presence: true
    validate :must_be_18

    def must_be_18
        if age.to_i < 18
            errors.add(:age, 'Students must be 18!')
        end
    end
end
