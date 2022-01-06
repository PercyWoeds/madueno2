class MedioDetailsController < ApplicationController
  before_action :set_medio_detail, only: [:show, :edit, :update, :destroy]

  # GET /medio_details
  # GET /medio_details.json
  def index
    @medio_details = MedioDetail.all
  end

  # GET /medio_details/1
  # GET /medio_details/1.json
  def show
  end

  # GET /medio_details/new
  def new
    @medio_detail = MedioDetail.new
  end

  # GET /medio_details/1/edit
  def edit
  end

  # POST /medio_details
  # POST /medio_details.json
  def create
    @medio_detail = MedioDetail.new(medio_detail_params)

    respond_to do |format|
      if @medio_detail.save
        format.html { redirect_to @medio_detail, notice: 'Medio detail was successfully created.' }
        format.json { render :show, status: :created, location: @medio_detail }
      else
        format.html { render :new }
        format.json { render json: @medio_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medio_details/1
  # PATCH/PUT /medio_details/1.json
  def update
    respond_to do |format|
      if @medio_detail.update(medio_detail_params)
        format.html { redirect_to @medio_detail, notice: 'Medio detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @medio_detail }
      else
        format.html { render :edit }
        format.json { render json: @medio_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medio_details/1
  # DELETE /medio_details/1.json
  def destroy
    @medio_detail.destroy
    respond_to do |format|
      format.html { redirect_to medio_details_url, notice: 'Medio detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medio_detail
      @medio_detail = MedioDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medio_detail_params
      params.require(:medio_detail).permit(:code, :name, :user_id, :medio_id, :references, :)
    end
end
