class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /lists or /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    @type = 'POST'
    @url = lists_url
  end

  # GET /lists/1/edit
  def edit
    @type = 'PUT'
    @url = list_path(@list.id)
  end

  # POST /lists or /lists.json
  def create
    
    @list = List.new(:title => list_params[:name])
    list_params[:data].each do |k, v|
      @list.items.build(:marked => v[:marked], :description => v[:desc])
    end
    
    respond_to do |format|
      if @list.save
        format.html { redirect_to root_url, notice: "Lista criada com sucesso!" }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    
    list_params[:data].each do |k, v|
      if v.key?(:id)
        @list.items.find(v[:id]).update(:marked => v[:marked], :description => v[:desc])
      else
        @list.items.build(:marked => v[:marked], :description => v[:desc])
      end
    end
    
    respond_to do |format|
      if @list.update(:title => list_params[:name])
        format.html { redirect_to root_url, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params
    end
end
