class BookingHistoriesController < ApplicationController
 # before_action :set_booking_history, only: [:show, :edit, :update, :destroy, :search]

  # GET /booking_histories
  # GET /booking_histories.json

  def index
    @booking_histories = BookingHistory.all
  end

  def new
    @booking_history = BookingHistory.new
  end

  def search
    #@booked_list = BookingHistory.where(room_num: params[:room_num])
    @booking = BookingHistory.new(booking_history_params)
    @booked_list = BookingHistory.all
    @booked_entry = @booked_list.select do |bh|
     # bh.room_num == params[:room_num]
      bh.room_num == @booking.room_num
    end


  end

  # GET /booking_histories/1
  # GET /booking_histories/1.json
  # @return [Object]
  def show
    @booking_history = BookingHistory.find(params[:room_num])
  end


  # GET /booking_histories/new


  # GET /booking_histories/1/edit
  def edit
  end

  # POST /booking_histories
  # POST /booking_histories.json
  def create
    check = 0;
    @booking_history = BookingHistory.new(booking_history_params)
    @booked_list = BookingHistory.all
    @booked_entry = @booked_list.select do |bh|
      bh.room_num == @booking_history.room_num
    end

    #@booked_entry.each do |entry|
     # if entry != nil
      #  then

     #   if ((@booking_history.end_time <= entry.start_time)\
     #      || (@booking_history.start_time >= entry.end_time)\
     #      && (@booking_history.start_time < @booking_history.end_time))\
      #  then
       #   check = 0
       # else
       #   check = 1
      #end
#    end
 #   end
   #  if check == 0
  #   flash[:error] = "Could not reserve a room, please recheck the timings"


    respond_to do |format|
      if (@booking_history.save)
        flash[:notice] = "Booking was successfully created. Booking id #{@booking_history.id}"
        format.html { redirect_to booking_histories_path}
       # format.json { render :show, status: :created, location: @booking_history }
      else
        format.html { render :new }
        format.json { render json: @booking_history.errors, status: :unprocessable_entity }
      end
    end
    end


  # PATCH/PUT /booking_histories/1
  # PATCH/PUT /booking_histories/1.json
  def update
    respond_to do |format|
      if @booking_history.update(booking_history_params)
        format.html { redirect_to @booking_history, notice: 'Booking history was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_history }
      else
        format.html { render :edit }
        format.json { render json: @booking_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_histories/1
  # DELETE /booking_histories/1.json
  def destroy
    @booking_history.destroy
    respond_to do |format|
      format.html { redirect_to booking_histories_url, notice: 'Booking history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_history
      @booking_history = BookingHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_history_params
      params.require(:booking_history).permit(:id, :username, :room_num, :start_t, :end_t, :date)
    end
end

