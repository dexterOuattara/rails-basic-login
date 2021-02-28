class CasestudiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_casestudy, only: %i[ show edit update destroy ]

  # GET /casestudies or /casestudies.json
  def index
    @casecategories = Casecategory.all

    @casestudies = Casestudy.all

    @q = Casestudy.ransack(params[:q])

    cate = params[:cate]

    if !cate.nil?
      @casestudies = Casestudy.where(:casecategory_id => cate)
    else

      @casestudies = @q.result(distinct: true)

    end
  end

  # GET /casestudies/1 or /casestudies/1.json
  def show
    @casestudies = Casestudy.all

    @q = Casestudy.ransack(params[:q])
    @casestudies = @q.result(distinct: true)
  end

  # GET /casestudies/new
  def new
    @casestudy = Casestudy.new
    @casecategories = Casecategory.all

  end

  # GET /casestudies/1/edit
  def edit
    @casecategories = Casecategory.all

  end

  # POST /casestudies or /casestudies.json
  def create
    @casestudy = Casestudy.new(casestudy_params)
    @casestudy.user = current_user

    respond_to do |format|
      if @casestudy.save
        format.html { redirect_to @casestudy, notice: "Casestudy was successfully created." }
        format.json { render :show, status: :created, location: @casestudy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @casestudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casestudies/1 or /casestudies/1.json
  def update
    respond_to do |format|
      if @casestudy.update(casestudy_params)
        format.html { redirect_to @casestudy, notice: "Casestudy was successfully updated." }
        format.json { render :show, status: :ok, location: @casestudy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @casestudy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casestudies/1 or /casestudies/1.json
  def destroy
    @casestudy.destroy
    respond_to do |format|
      format.html { redirect_to casestudies_url, notice: "Casestudy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_casestudy
    @casestudy = Casestudy.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def casestudy_params
    params.require(:casestudy).permit(:title, :description, :image, :user_id, :casecategory_id)
  end
end
