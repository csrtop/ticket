class Tarea < ApplicationRecord
	belongs_to :empleado
	belongs_to :tipo
	belongs_to :estado
	belongs_to :prioridad
	has_many :comentarios
	accepts_nested_attributes_for :comentarios
end
