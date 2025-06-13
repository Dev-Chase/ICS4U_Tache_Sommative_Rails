class TeacherCertificationsController < ApplicationController
  before_action :set_teacher_certification, only: %i[ show edit update destroy ]

  # GET /teacher_certifications or /teacher_certifications.json
  def index
    if params[:teacher_id]
      @teacher_certifications = TeacherCertification.where(teacher_id: params[:teacher_id])
    else
      @teacher_certifications = TeacherCertification.all
    end
  end

  # GET /teacher_certifications/1 or /teacher_certifications/1.json
  def show
  end

  # GET /teacher_certifications/new
  def new
    @teacher_certification = TeacherCertification.new
  end

  # GET /teacher_certifications/1/edit
  def edit
  end

  # POST /teacher_certifications or /teacher_certifications.json
  def create
    @teacher_certification = TeacherCertification.new(teacher_certification_params)

    respond_to do |format|
      if @teacher_certification.save
        format.html { redirect_to @teacher_certification, notice: "Teacher certification was successfully created." }
        format.json { render :show, status: :created, location: @teacher_certification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teacher_certifications/1 or /teacher_certifications/1.json
  def update
    respond_to do |format|
      if @teacher_certification.update(teacher_certification_params)
        format.html { redirect_to @teacher_certification, notice: "Teacher certification was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher_certification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher_certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_certifications/1 or /teacher_certifications/1.json
  def destroy
    @teacher_certification.destroy!

    respond_to do |format|
      format.html { redirect_to teacher_certifications_path, status: :see_other, notice: "Teacher certification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_certification
      @teacher_certification = TeacherCertification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_certification_params
      params.require(:teacher_certification).permit(:certifier, :date_obtained, :subject_id, :teacher_id)
    end
end
