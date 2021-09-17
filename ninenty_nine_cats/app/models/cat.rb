# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string
#  name        :string           not null
#  sex         :string(1)
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'
class Cat < ApplicationRecord
    COLORS = %w(white black red yellow)

    validates :birth_date, :name, :description, presence: true
    validates :color, inclusion: {in: Cat::COLORS, message: 'Choose color'}
    validates :sex, inclusion: {in: %w(M F), message: 'Choose M or F'}

    has_many :rentals,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy

    def age
        (Date.today - self.birth_date).to_i/365.25
    end




end
