class PrioridadesController < ApplicationController
  before_action :set_prioridad, only: [:show, :edit, :update, :destroy]

  # GET /prioridades
  # GET /prioridades.json
  def index
    @prioridades = Prioridad.all
  end

  # GET /prioridades/1
  # GET /prioridades/1.json
  def show
  end

  # GET /prioridades/new
  def new
    @prioridad = Prioridad.new
    respond_to do |f|
        f.js
    end
  end

  # GET /prioridades/1/edit
  def edit
  end

  # POST /prioridades
  # POST /prioridades.json
  def create
    @prioridad = Prioridad.new(prioridad_params)

    respond_to do |format|
      if @prioridad.save
        format.html { redirect_to prioridades_url, notice: 'Prioridad was successfully created.' }
        format.json { render :show, status: :created, location: @prioridad }
      else
        format.html { render :new }
        format.json { render json: @prioridad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prioridades/1
  # PATCH/PUT /prioridades/1.json
  def update
    respond_to do |format|
      if @prioridad.update(prioridad_params)
        format.html { redirect_to prioridades_url, notice: 'Prioridad was successfully updated.' }
        format.json { render :show, status: :ok, location: @prioridad }
      else
        format.html { render :edit }
        format.json { render json: @prioridad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prioridades/1
  # DELETE /prioridades/1.json
  def destroy
    @prioridad.destroy
    respond_to do |format|
      format.html { redirect_to prioridades_url, notice: 'Prioridad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prioridad
      @prioridad = Prioridad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prioridad_params
      params.require(:prioridad).permit(:prioridad)
    end
end
