class Wine < ActiveRecord::Base
	VARIETALS = ['Chardonnay', 'Chiraz', 'Cava', 'Pinot Grigio', 'Pinot Noir']

	validates :name, :year, :winery, :country, :varietal, presence: true
	validates :year,
			numericality: {only_integer: true},
			unless: "year.blank?"
	validates :varietal, 
			inclusion: {in: VARIETALS},
			if: "varietal.present?"

	has_many :log_entries, dependent: :destroy

end
