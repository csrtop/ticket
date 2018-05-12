class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]

  # GET /tareas
  # GET /tareas.json
  def index
    #if rol("admin")
     # @tareas=Tarea.all
    #else
     # @tareas = Tarea.where("club_id=#{current_user.club_id}")
    #end

    #realiza las busquedas 

    #muestra las tareas creadas por usuario
    #@tareas = Tarea.where("user_id=#{current_user.id} and estado_id!=4").order('created_at DESC') 
    @tareas = Tarea.paginate(page: params[:page], per_page:5).where("user_id=#{current_user.id} and estado_id!=4").order('created_at DESC') 
    
    #

    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'tareas/reporte', pdf: 'Reporte',layout: 'pdf.html'}
      
    end

    #no funciono
    #@q = Tarea.ransack(params[:q])
    #@tareas = @q.result.includes(:tarea)
    #no funciono
  #end


#  def rol(p_role)
 #   myrol=Role_usuario.where("where nombre_role=#{p_role} and user_id=#{current_user.id}")#nombre de la tabla
  #  if myrol
   #   return true 
    #else
     # return false
   # end
#--------
  end


  # GET /tareas/1
  # GET /tareas/1.json
  def show
    @comentarios = Comentario.where(tarea_id: @tarea).order("created_at DESC")
  end

  # GET /tareas/new
  def new
    @tarea = Tarea.new#(tarea_id: params[:tarea_id])
    respond_to do |f|
      f.js
    end
  end



  # GET /tareas/1/edit
  def edit
  end

  # POST /tareas
  # POST /tareas.json
  def create
    #guarda el id del usuario que creo la tarea
    @tarea = current_user.tareas.new(tarea_params)
    #tareas.club_id = empleado.club_id
    
    respond_to do |format|
      if @tarea.save
        format.html { redirect_to tareas_url, notice: 'La tarea ha sido creada con exito' }
        format.json { render :show, status: :created, location: @tarea }
      else
        format.html { render :new }
        format.json { render json: @tarea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tareas/1
  # PATCH/PUT /tareas/1.json
  def update
    respond_to do |format|
      if @tarea.update(tarea_params)
        format.html { redirect_to tareas_url, notice: 'Tarea actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @tarea }
      else
        format.html { render :edit }
        format.json { render json: tareas_url, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareas/1
  # DELETE /tareas/1.json
  def destroy
    @tarea.destroy
    respond_to do |format|
      format.html { redirect_to tarea_comentario_url, notice: 'Tarea eliminada correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarea_params
      params.require(:tarea).permit(:club_id, :empleado_id, :tipo_id, :estado_id, :prioridad_id, :comentario)
    end
end
