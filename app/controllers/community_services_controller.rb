class CommunityServicesController < ApplicationController
  before_action :set_community_service, only: [:show, :edit, :update, :destroy]

  # GET /community_services
  # GET /community_services.json
  def index
    @community_services = CommunityService.all
  end

  # GET /community_services/1
  # GET /community_services/1.json
  def show
  end

  # GET /community_services/new
  def new
    @community_service = CommunityService.new
    @users = User.all #TODO Needs to sort of current users organization if user has cancan, otherwise only them
    @events = Event.all.reverse
  end

  # GET /community_services/1/edit
  def edit
    @events = Event.all.reverse
  end

  # POST /community_services
  # POST /community_services.json
  def create
    @community_service = CommunityService.new(community_service_params)

    create_one_user_events

    respond_to do |format|
      if @community_service.save
        format.html { redirect_to @community_service, notice: 'Community service was successfully created.' }
        format.json { render :show, status: :created, location: @community_service }
      else
        format.html { render :new }
        format.json { render json: @community_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /community_services/1
  # PATCH/PUT /community_services/1.json
  def update
    respond_to do |format|
      if @community_service.update(community_service_params)
        format.html { redirect_to @community_service, notice: 'Community service was successfully updated.' }
        format.json { render :show, status: :ok, location: @community_service }
      else
        format.html { render :edit }
        format.json { render json: @community_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_services/1
  # DELETE /community_services/1.json
  def destroy
    @community_service.destroy
    respond_to do |format|
      format.html { redirect_to community_services_url, notice: 'Community service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def create_one_user_events
      UserEvent.create!(user: current_user, event: @community_service.event)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_community_service
      @community_service = CommunityService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_service_params
      params.require(:community_service).permit(:event_id, :total_hours)
    end
end
