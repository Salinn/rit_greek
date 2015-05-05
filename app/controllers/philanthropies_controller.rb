class PhilanthropiesController < ApplicationController
  before_action :set_philanthropy, only: [:show, :edit, :update, :destroy]

  # GET /philanthropies
  # GET /philanthropies.json
  def index
    @philanthropies = Philanthropy.all
  end

  # GET /philanthropies/1
  # GET /philanthropies/1.json
  def show
  end

  # GET /philanthropies/new
  def new
    @philanthropy = Philanthropy.new
    user_organization = UserOrganization.find_by(user_id: current_user)
    organization = Organization.find(user_organization.organization_id)
    @users = organization.users #TODO Needs to get users from current users organization with less calls
    @events = Event.all.reverse
  end

  # GET /philanthropies/1/edit
  def edit
    @events = Event.all.reverse
  end

  # POST /philanthropies
  # POST /philanthropies.json
  def create
    @philanthropy = Philanthropy.new(philanthropy_params)

    create_one_user_events

    respond_to do |format|
      if @philanthropy.save
        format.html { redirect_to @philanthropy, notice: 'Philanthropy was successfully created.' }
        format.json { render :show, status: :created, location: @philanthropy }
      else
        format.html { render :new }
        format.json { render json: @philanthropy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /philanthropies/1
  # PATCH/PUT /philanthropies/1.json
  def update
    respond_to do |format|
      if @philanthropy.update(philanthropy_params)
        format.html { redirect_to @philanthropy, notice: 'Philanthropy was successfully updated.' }
        format.json { render :show, status: :ok, location: @philanthropy }
      else
        format.html { render :edit }
        format.json { render json: @philanthropy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /philanthropies/1
  # DELETE /philanthropies/1.json
  def destroy
    @philanthropy.destroy
    respond_to do |format|
      format.html { redirect_to philanthropies_url, notice: 'Philanthropy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def organizations_events
    @organization = Organization.find(params[:organization_id])
    if @organization.nil?
      format.html { redirect_to root_path, notice: 'That organization could not be found' }
      format.json { render json: @philanthropy.errors, status: :unprocessable_entity }
    end
  end

  private
    def create_one_user_events
      UserEvent.create!(user: current_user, event: @philanthropy.event)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_philanthropy
      @philanthropy = Philanthropy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def philanthropy_params
      params.require(:philanthropy).permit(:event_id, :total_raised)
    end
end
