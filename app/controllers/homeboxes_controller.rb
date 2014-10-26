class HomeboxesController < ApplicationController
  before_filter :authenticate_user!#, except: [ :index, :show ]
  before_filter :is_admin?#, except: [ :index, :show ]

  # GET /homeboxes
  # GET /homeboxes.json
  def index
    @homeboxes = Homebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homeboxes }
    end
  end

  # GET /homeboxes/1
  # GET /homeboxes/1.json
  def show
    @homebox = Homebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @homebox }
    end
  end

  # GET /homeboxes/new
  # GET /homeboxes/new.json
  def new
    if Homebox.count < 3
    @homebox = Homebox.new
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
    else
      redirect_to homeboxes_url, alert: 'Keine weitere Aktionsbox möglich!'
    end
  end
  # def new
  #   @homebox = Homebox.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @homebox }
  #   end
  # end

  # GET /homeboxes/1/edit
  def edit
    @homebox = Homebox.find(params[:id])
  end

  # POST /homeboxes
  # POST /homeboxes.json
  def create
    if Homebox.count < 3
      @homebox = Homebox.new(params[:homebox])
      if @homebox.save
        if params[:homebox][:homeboximage].present?
          render :crop
        else
          redirect_to :back, notice: 'Datensatz erfolgreich angelegt.'
        end
      else
        respond_to do |format|
          format.html { render action: "new" }
          format.json { render json: @homebox.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to homeboxes_url, alert: 'Keine weitere Aktionsbox möglich!'
    end
  end
  # def create
  #   @homebox = Homebox.new(params[:homebox])

  #   respond_to do |format|
  #     if @homebox.save
  #       format.html { redirect_to @homebox, notice: 'Homebox was successfully created.' }
  #       format.json { render json: @homebox, status: :created, location: @homebox }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @homebox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /homeboxes/1
  # PUT /homeboxes/1.json
  def update
    @homebox = Homebox.find(params[:id])
    if @homebox.update_attributes(params[:homebox])
      if params[:homebox][:homeboximage].present?
        render :crop
      else
        redirect_to homeboxes_url, notice: 'Datensatz erfolgreich angelegt.'
        FileUtils.rm("#{Rails.root}/public/uploads/homebox/homeboximage/"+ params[:id]+"/box.jpg")
        FileUtils.cp("#{Rails.root}/public/uploads/homebox/homeboximage/"+ params[:id]+"/large_box.jpg","#{Rails.root}/public/uploads/homebox/homeboximage/"+ params[:id]+"/box.jpg")  
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @homebox.errors, status: :unprocessable_entity }
      end
    end
  end
  # def update
  #   @homebox = Homebox.find(params[:id])

  #   respond_to do |format|
  #     if @homebox.update_attributes(params[:homebox])
  #       format.html { redirect_to @homebox, notice: 'Homebox was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @homebox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /homeboxes/1
  # DELETE /homeboxes/1.json
  def destroy
    @homebox = Homebox.find(params[:id])
    @homebox.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/homebox/homeboximage/#{params[:id]}", :force => true)
    respond_to do |format|
      format.html { redirect_to homeboxes_url }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @homebox = Homebox.find(params[:id])
  #   @homebox.destroy

  #   respond_to do |format|
  #     format.html { redirect_to homeboxes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
