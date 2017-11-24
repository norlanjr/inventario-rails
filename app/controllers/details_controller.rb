class DetailsController < ApplicationController
  before_action :set_detail, only: [:update, :destroy]
  #el id entry, va a estar  por :set_entry
  #por medio de este tenemos acceso al recurso padre por de :entry_id
  before_action :set_entry
  before_action :set_article


  def index
    #@details = Detail.all
  end

  def show
  end

  def new
    #@detail = Detail.new
  end

  def edit
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)
    #Antes de que se guarde podemos decir
    #@detail   .     entry =      @entry 
    #que la Entrada o compra es el de la URLS"entries/4")
    @detail.entry = @entry

    respond_to do |format|
      if @detail.save
        format.html { redirect_to @detail.entry, notice: 'Se Agrego ÉL articulo' }
        format.json { render :show, status: :created, location: @detail.entry}
      else
        format.html { render :new }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to @detail.entry, notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to @entry, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_article
    @article = Article.all
  end
  def set_entry
    @entry = Entry.find(params[:entry_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_params
      params.require(:detail).permit(:article_id, :cantidad,:descuneto)
    end
end
