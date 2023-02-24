class MediationsController < PlatformsController
  before_action :set_mediation, only: [:show, :edit, :update, :destroy]
  # GET user/:id/mediations
  # GET user/:id/mediations.json
  def index
  end

  # GET user/:id/mediations/:id
  # GET /mediations/:id.json
  def show
  end

  # GET /mediations/new
  def new
    @mediation = Mediation.new
  end

  # GET /mediations/:id/edit
  def edit
  end

  # POST user/:id/mediations
  # POST user/:id/mediations.json
  def create
    @mediation = mediation.new(mediation_params)

    respond_to do |format|
      if @mediation.save
        format.html { redirect_to @mediation, notice: 'mediation was successfully created.' }
        format.json { render :show, status: :created, location: @mediation }
      else
        format.html { render :new }
        format.json { render json: @mediation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT user/:id/mediations/:id
  # PATCH/PUT user/:id/mediations/:id.json
  def update
    respond_to do |format|
      if @mediation.update(mediation_params)
        format.html { redirect_to @mediation, notice: 'mediation was successfully updated.' }
        format.json { render :show, status: :ok, location: @mediation }
      else
        format.html { render :edit }
        format.json { render json: @mediation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE user/:id/mediations/:id
  # DELETE user/:id/mediations/:id.json
  def destroy
    @mediation.destroy
    respond_to do |format|
      format.html { redirect_to mediations_url, notice: 'mediation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_mediation
      @mediation = Mediation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mediation_params
      params.require(:mediation).permit(:mediation_type, :protocol_number, :user_id)
    end
end
