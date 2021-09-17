# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord
    STATUS = %w(PENDING APPROVED DENIED)
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: CatRentalRequest::STATUS}

    belongs_to :cat,
        foreign_key: :cat_id,
        class_name: :Cat




end
