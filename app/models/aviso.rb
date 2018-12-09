class Aviso < ApplicationRecord
    validates :texto, presence: true, uniqueness: true
end
