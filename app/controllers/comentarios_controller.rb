class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @tarea = Tarea.find(params[:tarea_id])
    @comentarios = @tarea.comentarios
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @tarea = Tarea.find(params[:tarea_id])
    @comentario = @tarea.comentarios.new
    
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    #guarda el id del usuario que creo el comentario
    @comentario = Tarea.find(params[:tarea_id]).comentarios.new(comentario_params)
    #@comentario = @tarea.comentarios.create(params[:comentario].permit(:comentario))
    @comentario.user_id = current_user.id
    #@comentario.save
    respond_to do |format|

      if @comentario.save
        format.html { redirect_to tareas_path, notice: 'Comentario ha sido creado con exito' }
        format.json { render :show, status: :created, location: @comentarios }
      else
        format.html { render :new }
        format.json { render json: @tarea_comentarios_path.errors, status: :unprocessable_entity }
      end
    end

end
private
def find_tarea
  @tarea = Tarea.find(params[:tarea_id])
end
#    @tarea = Tarea.find(params[:tarea_id])
 #   @comentario = @tarea.comentarios.create(params[:comentario].permit(:comentario))
  #    if @comentario.save
   #     redirect_to tarea_path(@tarea)
    #  else
     #   render 'new'
      #end


    # @comentario = Comentario.new(comentario_params)

    # respond_to do |format|
    #   if @comentario.save
    #     format.html { redirect_to @comentario, notice: 'Comentario was successfully created.' }
    #     format.json { render :show, status: :created, location: @comentario }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comentario.errors, status: :unprocessable_entity }
    #   end
    # end
  

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:comentario, :tarea_id, :user_id)
    end
end
