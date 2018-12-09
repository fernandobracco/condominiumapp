class AvisosController < ApplicationController
before_action :set_aviso, only: [:show, :edit, :update, :destroy]
  def index
      @avisos = Aviso.all
      redirect_to inicio_path
  end

  def show
      redirect_to inicio_path
  end

  def new
      @aviso = Aviso.new
  end

  def edit
      redirect_to inicio_path
  end

  def create
      @aviso = Aviso.new(aviso_params)
      if @aviso.save
          redirect_to inicio_path,  erros: @aviso.errors.messages
      else
          redirect_to inicio_path(:erros => @aviso.errors.messages)
      end
  end

  def criar_aviso
      @avisos = Aviso.all
      @aviso = Aviso.new
      @aviso.texto = params[:texto]
      @aviso.usuario_id = params[:usuario_id]
      if @aviso.save
          redirect_to inicio_path
      else
          redirect_to inicio_path(:erros => @aviso.errors.messages)
      end
  end

  def suatela
      if params[:erros]
          @erros=params[:erros]
      else
          @erros=''
      end
      @usuarios = User.all
      @aviso = Aviso.new
      @avisos = Aviso.all
      if params[:ident]=='1'
          if not(params[:texto].blank?)
              @avisos = @avisos.where("texto like ?","%#{params[:texto]}%")
          end
          if not(params[:nome].blank?)
              @avisos = @avisos.where("usuario_id in (?)", User.where("name like ?","%#{params[:nome]}%").ids)
          end
      end
      if params[:ident]=='2'
          if not(params[:texto].blank?)
              @avisos = @avisos.where("texto like ?","%#{params[:texto]}%")
          end
          if not(params[:autor].blank?)
              @avisos = @avisos.where("usuario_id in (?)", User.where("name like ?","%#{params[:autor]}%").ids)
          end
          if not(params[:apto].blank?)
              @avisos = @avisos.where("usuario_id in (?)", User.where("apartamento like ?","#{params[:apto]}").ids)
          end
          if not(params[:autor_id].blank?)
              @avisos = @avisos.where("usuario_id like ?","%#{params[:autor_id]}%")
          end
          if not(params[:funcao]=='0')
              @avisos = @avisos.where("usuario_id in (?)", User.where("funcao like ?","#{params[:funcao]}").ids)
          end
          if not(params[:datetime_inicio].blank?)
              @avisos = @avisos.where("created_at >= ?", params[:datetime_inicio])
          end
          if not(params[:datetime_fim].blank?)
              @avisos = @avisos.where("created_at <= ?", params[:datetime_fim])
          end
      end

      if params[:paginas].nil?
          @avisos = @avisos.paginate(:page => params[:page], :per_page => 10)
      else
          if params[:paginas] == -1
              @avisos = @avisos.paginate(:page => params[:page], :per_page => @avisos.count)
          else
              @avisos = @avisos.paginate(:page => params[:page], :per_page => params[:paginas])
          end
      end
  end

  # PATCH/PUT /avisos/1
  # PATCH/PUT /avisos/1.json
  def update
    respond_to do |format|
      if @aviso.update(aviso_params)
        format.html { redirect_to @aviso, notice: 'Aviso was successfully updated.' }
        format.json { render :show, status: :ok, location: @aviso }
      else
        format.html { render :edit }
        format.json { render json: @aviso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avisos/1
  # DELETE /avisos/1.json
  def destroy
    @aviso.destroy
    respond_to do |format|
      format.html { redirect_to inicio_path, notice: 'O Aviso foi apagado!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aviso
      @aviso = Aviso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aviso_params
      params.require(:aviso).permit(:usuario_id, :texto)
    end
end
