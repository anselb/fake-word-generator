class ComponentListsController < ApplicationController
  before_action :set_component_list, only: [:show, :edit, :update, :destroy]

  # GET /component_lists
  # GET /component_lists.json
  def index
    @component_lists = ComponentList.all
  end

  # GET /component_lists/1
  # GET /component_lists/1.json
  def show
  end

  # GET /component_lists/new
  def new
    @component_list = ComponentList.new
  end

  # GET /component_lists/1/edit
  def edit
  end

  # POST /component_lists
  # POST /component_lists.json
  def create
    @component_list = ComponentList.new(component_list_params)

    respond_to do |format|
      if @component_list.save
        format.html { redirect_to @component_list, notice: 'Component list was successfully created.' }
        format.json { render :show, status: :created, location: @component_list }
      else
        format.html { render :new }
        format.json { render json: @component_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_lists/1
  # PATCH/PUT /component_lists/1.json
  def update
    respond_to do |format|
      if @component_list.update(component_list_params)
        format.html { redirect_to @component_list, notice: 'Component list was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_list }
      else
        format.html { render :edit }
        format.json { render json: @component_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_lists/1
  # DELETE /component_lists/1.json
  def destroy
    @component_list.destroy
    respond_to do |format|
      format.html { redirect_to component_lists_url, notice: 'Component list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_list
      @component_list = ComponentList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_list_params
      params.require(:component_list).permit(:components, :components_array)
    end
end
