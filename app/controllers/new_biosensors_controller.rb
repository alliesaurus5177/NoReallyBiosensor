class NewBiosensorsController < ApplicationController
   helper_method :sort_column, :sort_direction
   before_action :set_new_biosensor, only: [:show, :edit, :update, :destroy]
 
  # GET /new_biosensors
  # GET /new_biosensors.json
  def index 
    #sort_column and sort_direction are defined at the bottom.
    @new_biosensor = NewBiosensor.order(sort_column + ' ' + sort_direction)
    respond_to do |format|
      format.html
      format.csv { send_data @new_biosensor.to_csv } 
      #Allows Excel functionality
      format.xlsx
    end 
  end  
  #Import function: for importing Excel spreadsheets of data 
  def import 
    NewBiosensor.import(params[:file])
    redirect_to root_url, notice: "Biosensors imported" 
  end 

  # GET /new_biosensors
  # GET /new_biosensors.json

  # GET /new_biosensors/1
  # GET /new_biosensors/1.json
  def show
  end

  # GET /new_biosensors/new
  def new
    @new_biosensor = NewBiosensor.new
  end

  # GET /new_biosensors/1/edit
  def edit
  end

  # POST /new_biosensors
  # POST /new_biosensors.json
  def create
    @new_biosensor = NewBiosensor.new(new_biosensor_params)

    respond_to do |format|
      if @new_biosensor.save
        format.html { redirect_to @new_biosensor, notice: 'New biosensor was successfully created.' }
        format.json { render :show, status: :created, location: @new_biosensor }
      else
        format.html { render :new }
        format.json { render json: @new_biosensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_biosensors/1
  # PATCH/PUT /new_biosensors/1.json
  def update


    respond_to do |format|
      if @new_biosensor.update(new_biosensor_params)
        format.html { redirect_to @new_biosensor, notice: 'New biosensor was successfully updated.' }
        format.json { render :show, status: :ok, location: @new_biosensor }
      else
        format.html { render :edit }
        format.json { render json: @new_biosensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_biosensors/1
  # DELETE /new_biosensors/1.json
  def destroy
    @new_biosensor.destroy
    respond_to do |format|
      format.html { redirect_to new_biosensors_url, notice: 'New biosensor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   #  Use callbacks to share common setup or constraints between actions.
     def set_new_biosensor
      @new_biosensor = NewBiosensor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_biosensor_params
      params.require(:new_biosensor).permit(:sensor_target_type, :specificity, :specificity_htm, :sensor_name, :sensor_name_htm,:sensor_type, :anal_tech, :iv_props, :organism, :binding_protein, :fluorophore, :pub_med_id, :pi_name, :sequence, :addgene_url)

    end
  
    def sort_column
      NewBiosensor.column_names.include?(params[:sort]) ? params[:sort] : "sensor_target_type"
    end 
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end 
end
