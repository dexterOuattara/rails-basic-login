class InterviewcategoriesController < ApplicationController
  before_action :set_interviewcategory, only: %i[ show edit update destroy ]

  # GET /interviewcategories or /interviewcategories.json
  def index
    @interviewcategories = Interviewcategory.all
  end

  # GET /interviewcategories/1 or /interviewcategories/1.json
  def show
  end

  # GET /interviewcategories/new
  def new
    @interviewcategory = Interviewcategory.new
  end

  # GET /interviewcategories/1/edit
  def edit
  end

  # POST /interviewcategories or /interviewcategories.json
  def create
    @interviewcategory = Interviewcategory.new(interviewcategory_params)

    respond_to do |format|
      if @interviewcategory.save
        format.html { redirect_to @interviewcategory, notice: "Interviewcategory was successfully created." }
        format.json { render :show, status: :created, location: @interviewcategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interviewcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviewcategories/1 or /interviewcategories/1.json
  def update
    respond_to do |format|
      if @interviewcategory.update(interviewcategory_params)
        format.html { redirect_to @interviewcategory, notice: "Interviewcategory was successfully updated." }
        format.json { render :show, status: :ok, location: @interviewcategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interviewcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviewcategories/1 or /interviewcategories/1.json
  def destroy
    @interviewcategory.destroy
    respond_to do |format|
      format.html { redirect_to interviewcategories_url, notice: "Interviewcategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interviewcategory
      @interviewcategory = Interviewcategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interviewcategory_params
      params.require(:interviewcategory).permit(:tag, :caption)
    end
end
