class Section < ApplicationRecord
	has_many :section_edits
	belongs_to :page

	scope :sorted, lambda {order("sections.position ASC")}
end
