class FinticketController < ApplicationController
  def index
  	 @tareas = Tarea.where("user_id=#{current_user.id} and estado_id=4")
  end
end
