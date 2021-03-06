class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def trips
  end

  def account
  end
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(session[:user_id])
    @trips = []
    @user.trips.each_with_index do |trip, index|
      @trips << {
        origin: Planet.find(trip.origin_id), 
        destination: Planet.find(trip.destination_id), 
        rocket: trip.rocket, 
        carrier: trip.carrier, 
        distance: Planet.find(trip.origin_id).distance_from_earth + Planet.find(trip.destination_id).distance_from_earth, 
        duration: Planet.find(trip.destination_id).distance_from_earth/trip.rocket.speed}
    end 
    @total_distance = @trips.map {|arr| arr[:distance]}.sum
    @total_time = @trips.map {|arr| arr[:duration]}.sum
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.sparklegasm = rand(50..3000)

    # respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        render :new
        
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
