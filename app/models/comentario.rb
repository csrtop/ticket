class Comentario < ApplicationRecord
	belongs_to :tarea
	belongs_to :user
	
end
