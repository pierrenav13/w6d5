class Cat < ApplicationRecord
    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: {in: %w(white black red yellow), message: 'Choose color'}
    validates :sex, inclusion: {in: %w(M F), message: 'Choose M or F'}



end