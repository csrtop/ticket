class Empleado < ApplicationRecord
	belongs_to :club
	belongs_to :departamento
	has_many :tareas
end
