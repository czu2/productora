class Group < ApplicationRecord
    enum team: [:Hombre, :Mujer, :Banda]
    has_many :concerts, dependent: :destroy

    validates :name, presence: true
    validates :members, presence: true
    validates :debut, presence: true
    validates :team, presence: true

    def total_concerts
        self.concerts.count
    end

end
