class CasecategoriesController < ApplicationController
  before_action :set_casecategory, only: %i[ show edit update destroy ]

  # GET /casecategories or /casecategories.json
  def index
    @casecategories = Casecategory.all
  end

  # GET /casecategories/1 or /casecategories/1.json
  def show
  end

  # GET /casecategories/new
  def new
    @casecategory = Casecategory.new
  end

  # GET /casecategories/1/edit
  def edit
  end

  # POST /casecategories or /casecategories.json
  def create
    @casecategory = Casecategory.new(casecategory_params)

    respond_to do |format|
      if @casecategory.save
        format.html { redirect_to @casecategory, notice: "Casecategory was successfully created." }
        format.json { render :show, status: :created, location: @casecategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @casecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casecategories/1 or /casecategories/1.json
  def update
    respond_to do |format|
      if @casecategory.update(casecategory_params)
        format.html { redirect_to @casecategory, notice: "Casecategory was successfully updated." }
        format.json { render :show, status: :ok, location: @casecategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @casecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casecategories/1 or /casecategories/1.json
  def destroy
    @casecategory.destroy
    respond_to do |format|
      format.html { redirect_to casecategories_url, notice: "Casecategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casecategory
      @casecategory = Casecategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def casecategory_params
      params.require(:casecategory).permit(:tag, :caption)
    end
end
