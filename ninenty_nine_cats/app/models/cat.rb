require 'date'
class Cat < ApplicationRecord
    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: {in: %w(white black red yellow), message: 'Choose color'}
    validates :sex, inclusion: {in: %w(M F), message: 'Choose M or F'}

    def age
        (Date.today - self.birth_date).to_i/365.25
    end


end