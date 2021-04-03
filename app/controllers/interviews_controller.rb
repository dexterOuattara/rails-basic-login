class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /interviews or /interviews.json
  def index
    @interviewcategories = Interviewcategory.all
    @interviews = Interview.all

    @q = Interview.ransack(params[:q])

    cate = params[:cate]

    if !cate.nil?
      @interviews = Interview.where(:interviewcategory_id => cate)
    else

      @interviews = @q.result(distinct: true)

    end

  end


  # GET /interviews/1 or /interviews/1.json
  def show
    @interviews = Interview.all

    @q = Interview.ransack(params[:q])
    @interviews = @q.result(distinct: true)

  end

  # GET /interviews/new
  def new
    @interview = Interview.new
    @interviewcategories = Interviewcategory.all
  end

  # GET /interviews/1/edit
  def edit

    @interviewcategories = Interviewcategory.all

  end

  # POST /interviews or /interviews.json
  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: "Interview was successfully created." }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1 or /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: "Interview was successfully updated." }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1 or /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: "Interview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.require(:interview).permit(:title, :description, :image, :user_id, :interviewcategory_id)
    end
end
