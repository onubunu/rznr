class HomeslidersController < ApplicationController
  before_filter :authenticate_user!#, except: [ :index, :show ]
  before_filter :is_admin?#, except: [ :index, :show ]
  
  # GET /homesliders
  # GET /homesliders.json
  def index
    @homesliders = Homeslider.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homesliders }
    end
  end

  # GET /homesliders/1
  # GET /homesliders/1.json
  def show
    @homeslider = Homeslider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homeslider }
    end
  end

  # GET /homesliders/new
  # GET /homesliders/new.json
  def new
    @homeslider = Homeslider.new
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
  # def new
  #   @homeslider = Homeslider.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @homeslider }
  #   end
  # end

  # GET /homesliders/1/edit
  def edit
    @homeslider = Homeslider.find(params[:id])
  end

  # POST /homesliders
  # POST /homesliders.json
  def create
    @homeslider = Homeslider.new(params[:homeslider])
    if @homeslider.save
      if params[:homeslider][:sliderimage].present?
        render :crop
      else
        redirect_to homesliders_url, notice: 'Datensatz erfolgreich angelegt.'
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @homeslider.errors, status: :unprocessable_entity }
      end
    end
  end
  #   def create
  #   @homeslider = Homeslider.new(params[:homeslider])

  #   respond_to do |format|
  #     if @homeslider.save
  #       format.html { redirect_to @homeslider, notice: 'Homeslider was successfully created.' }
  #       format.json { render json: @homeslider, status: :created, location: @homeslider }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @homeslider.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /homesliders/1
  # PUT /homesliders/1.json
  def update
    @homeslider = Homeslider.find(params[:id])
    if @homeslider.update_attributes(params[:homeslider])
      if params[:homeslider][:sliderimage].present?
        render :crop
      else
        redirect_to homesliders_url, notice: 'Datensatz erfolgreich angelegt.'
        FileUtils.rm("#{Rails.root}/public/uploads/homeslider/sliderimage/"+ params[:id]+"/sliderimage.jpg")
        FileUtils.cp("#{Rails.root}/public/uploads/homeslider/sliderimage/"+ params[:id]+"/large_sliderimage.jpg","#{Rails.root}/public/uploads/homeslider/sliderimage/"+ params[:id]+"/sliderimage.jpg")  
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @homeslider.errors, status: :unprocessable_entity }
      end
    end
  end
  # def update
  #   @homeslider = Homeslider.find(params[:id])

  #   respond_to do |format|
  #     if @homeslider.update_attributes(params[:homeslider])
  #       format.html { redirect_to @homeslider, notice: 'Homeslider was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @homeslider.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /homesliders/1
  # DELETE /homesliders/1.json
  def destroy
    @homeslider = Homeslider.find(params[:id])
    @homeslider.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/homeslider/sliderimage/#{params[:id]}", :force => true)
    respond_to do |format|
      format.html { redirect_to homesliders_url }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @homeslider = Homeslider.find(params[:id])
  #   @homeslider.destroy

  #   respond_to do |format|
  #     format.html { redirect_to homesliders_url }
  #     format.json { head :no_content }
  #   end
  # end
end
