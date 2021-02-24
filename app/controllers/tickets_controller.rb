class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :authenticate_user!,except:[:index, :show]
  before_action :correct_user, only: [:edit, :update]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    #@ticket = Ticket.new
    @ticket = current_user.tickets.build
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
   #@ticket = Ticket.new(ticket_params)
   @ticket = current_user.tickets.build(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: "Your ticket has been submitted. We will get back to you ASAP" }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "The tickey has been closed" }
      format.json { head :no_content }
    end
  end

def correct_user
  @ticket = current_user.tickets.find_by(id: params[:id])
  redirect_to tickets_path, notice:"Error, You are not authorized to view this page" if @ticket.nil?
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:first_name, :last_name, :problem, :phone, :email, :SubmitTime, :user_id)
    end
end


def emailVaild

end
