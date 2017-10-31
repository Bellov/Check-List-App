class Item < ApplicationRecord

	belongs_to :user

	def completed?
        !completed.blank?
    end


	validates :title, presence: true, length: {minimum: 5, maximum:100}
	validates :description , presence:true, length:{minimum: 5, maximum:1500}

end
