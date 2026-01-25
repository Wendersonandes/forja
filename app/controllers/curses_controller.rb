class CursesController < ApplicationController
  before_action :set_curse, only: %i[ show edit update destroy ]

  # GET /curses or /curses.json
  def index
    @curses = Curse.all
  end

  # GET /curses/1 or /curses/1.json
  def show
  end

  # GET /curses/new
  def new
    @curse = Curse.new
  end

  # GET /curses/1/edit
  def edit
  end

  # POST /curses or /curses.json
  def create
    @curse = Curse.new(curse_params)

    respond_to do |format|
      if @curse.save
        format.html { redirect_to @curse, notice: "Curse was successfully created." }
        format.json { render :show, status: :created, location: @curse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curses/1 or /curses/1.json
  def update
    respond_to do |format|
      if @curse.update(curse_params)
        format.html { redirect_to @curse, notice: "Curse was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @curse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curses/1 or /curses/1.json
  def destroy
    @curse.destroy!

    respond_to do |format|
      format.html { redirect_to curses_path, notice: "Curse was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def preview
    @preview = Curse.new(curse_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curse
      @curse = Curse.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def curse_params
      params.expect(curse: [ :title, :about, :start_date, :end_date, :apply_url, :curse_type, :address, :city, :state, :cover ])
    end
end
