class OrderListsController < ApplicationController
  before_action :set_order_list, only: [:show, :edit, :update, :destroy]

  # GET /order_lists
  # GET /order_lists.json
  def index
    @order_lists = OrderList.all
  end

  # GET /order_lists/1
  # GET /order_lists/1.json
  def show
  end

  # GET /order_lists/new
  def new
    @order_list = OrderList.new
  end

  # GET /order_lists/1/edit
  def edit
  end

  # POST /order_lists
  # POST /order_lists.json
  def create
    @order_list = OrderList.new(order_list_params)

    respond_to do |format|
      if @order_list.save
        format.html { redirect_to @order_list, notice: 'Order list was successfully created.' }
        format.json { render :show, status: :created, location: @order_list }
      else
        format.html { render :new }
        format.json { render json: @order_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_lists/1
  # PATCH/PUT /order_lists/1.json
  def update
    respond_to do |format|
      if @order_list.update(order_list_params)
        format.html { redirect_to @order_list, notice: 'Order list was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_list }
      else
        format.html { render :edit }
        format.json { render json: @order_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_lists/1
  # DELETE /order_lists/1.json
  def destroy
    @order_list.destroy
    respond_to do |format|
      format.html { redirect_to order_lists_url, notice: 'Order list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_list
      @order_list = OrderList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_list_params
      params.require(:order_list).permit(:order, :order_array)
    end
end
