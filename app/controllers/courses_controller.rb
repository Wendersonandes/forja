class CoursesController < ApplicationController
  before_action :set_curse, only: %i[ show edit update destroy ]

  # GET /curses or /curses.json
  def index
    @courses = Course.all
  end

  # GET /curses/1 or /curses/1.json
  def show
  end

  # GET /curses/new
  def new
    @course = Course.new
  end

  # GET /curses/1/edit
  def edit
  end

  # POST /curses or /curses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Curse was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curses/1 or /curses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Curse was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curses/1 or /curses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_path, notice: "Curse was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def preview
    @preview = Course.new(course_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curse
      @course = Course.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.expect(course: [ :title, :about, :start_date, :end_date, :apply_url, :curse_type, :address, :city, :state, :cover ])
    end
end
