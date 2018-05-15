class DetailInvoicesController < ApplicationController
  before_action :set_detail_invoice, only: [:update, :destroy,:show]
  before_action :set_bill
  before_action :set_article

  # GET /detail_invoices
  # GET /detail_invoices.json
  def index

  end

  # GET /detail_invoices/1
  # GET /detail_invoices/1.json
  def show
  end

  # GET /detail_invoices/new
  def new

  end

  # GET /detail_invoices/1/edit
  def edit
  end

  # POST /detail_invoices
  # POST /detail_invoices.json
  def create
    @detail_invoice = DetailInvoice.new(detail_invoice_params)
    @detail_invoice.bill = @bill
    sub_total = @detail_invoice.cantidad * @detail_invoice.article.precio
    @detail_invoice.sub_total = sub_total

    # Sumar el subtotal al total de la factura
    @bill.total = @bill.total + sub_total
    @bill.saldo = @bill.total

    # unless = "a manos que..."
    # Si puede_comprar? retorna false se interrumple el evento
    # y se retorna un mensaje de alerta
    unless puede_comprar?(@bill.client, @bill.total)
      @detail_invoice.errors.add(:sub_total, :invalid, message: 'No tiene suficiente crédito para agregar este detalle')
      return render json: {message: 'no se puede crear'}, status: 422
    end

    puts "ERRRORS:  #{@detail_invoice.errors.count}"

    respond_to do |format|
      if @detail_invoice.save && @bill.save
        format.html { redirect_to @detail_invoice.bill, notice: 'Detail invoice was successfully created.' }
        format.json { render :show, status: :created, location: @detail_invoice.bill}
      else
        format.html { render :new }
        format.json { render json: @detail_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_invoices/1
  # PATCH/PUT /detail_invoices/1.json
  def update
    respond_to do |format|
      if @detail_invoice.update(detail_invoice_params)
        format.html { redirect_to @detail_invoice.bill, notice: 'Detail invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_invoice .bill}
      else
        format.html { render :edit }
        format.json { render json: @detail_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_invoices/1
  # DELETE /detail_invoices/1.json
  def destroy
    @detail_invoice.destroy
    @bill.total = @bill.total - @detail_invoice.sub_total
    @bill.save
    respond_to do |format|
      format.html { redirect_to @detail_invoice.bill, notice: 'Detail invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    def set_article
      @article = Article.all
    end
    def set_bill
      @bill = Bill.find(params[:bill_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_invoice
      @detail_invoice = DetailInvoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_invoice_params
      params.require(:detail_invoice).permit(:article_id, :cantidad)
    end

    def puede_comprar?(client, total_compra)
      if client.queda_credito? && client.deuda < total_compra
        return true
      end
    end
end
