class CourseSessionsController < ApplicationController
  before_action :set_course_session, only: %i[ show edit update destroy ]

  # GET /course_sessions or /course_sessions.json
  def index
    if params[:course_id]
      @course_sessions = CourseSession.where(course_id: params[:course_id])
    else
      @course_sessions = CourseSession.all
    end
  end

  # GET /course_sessions/1 or /course_sessions/1.json
  def show
  end

  # GET /course_sessions/new
  def new
    @course_session = CourseSession.new
  end

  # GET /course_sessions/1/edit
  def edit
  end

  # POST /course_sessions or /course_sessions.json
  def create
    @course_session = CourseSession.new(course_session_params)

    respond_to do |format|
      if @course_session.save
        format.html { redirect_to @course_session, notice: "Course session was successfully created." }
        format.json { render :show, status: :created, location: @course_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_sessions/1 or /course_sessions/1.json
  def update
    respond_to do |format|
      if @course_session.update(course_session_params)
        format.html { redirect_to @course_session, notice: "Course session was successfully updated." }
        format.json { render :show, status: :ok, location: @course_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_sessions/1 or /course_sessions/1.json
  def destroy
    @course_session.destroy!

    respond_to do |format|
      format.html { redirect_to course_sessions_path, status: :see_other, notice: "Course session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_session
      @course_session = CourseSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_session_params
      params.require(:course_session).permit(:course_id, :room_id, :start_time, :duration, :day_of_week)
    end
end
