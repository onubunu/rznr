class SettingsController < ApplicationController
  before_filter :authenticate_user!#, except: [ :index, :show ]
  before_filter :is_admin?#, except: [ :index, :show ]

  def index
    FileUtils.remove_dir("#{Rails.root}/public/uploads/tmp", :force => true)
    if Setting.first(1).blank?
      @setting = Setting.new
      render action: "new"
    else
      @setting = Setting.first
      render action: "show"
    end
  end

  def show
    if Setting.first(1).blank?
      @setting = Setting.new
      render action: "new"
    else
      @setting = Setting.first
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @setting }
      end
    end
  end

  # def new
  #   if Setting.first(1).present?
  #     @setting = Setting.first
  #     render action: "edit"
  #   else
  #   @setting = Setting.new
  #     respond_to do |format|
  #       format.html # new.html.erb
  #       format.json { render json: @setting }
  #     end
  #   end
  # end
  def new
    @setting = Setting.first
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  def edit
    @setting = Setting.first
  end

  # def create
  #   @setting = Setting.new(params[:setting])
  #   respond_to do |format|
  #     if @setting.save
  #       format.html { redirect_to @setting, notice: 'Setting was successfully created.' }
  #       format.json { render json: @setting, status: :created, location: @setting }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @setting.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def create
    @setting = Setting.new(params[:setting])
    if @setting.save
      if params[:setting][:firmlogo].present?
        render :crop
      else
        redirect_to :back, notice: 'Einstellungen erfolgreich aktualisiert.'
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @setting = Setting.first
  #   respond_to do |format|
  #     if @setting.update_attributes(params[:setting]).to_s
  #       format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @setting.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def update
    @setting = Setting.first
    if @setting.update_attributes(params[:setting]).to_s
      if params[:setting][:firmlogo].present?
        render :crop
      else
        redirect_to settings_url, notice: 'Einstellungen erfolgreich aktualisiert.'
        FileUtils.rm("#{Rails.root}/public/uploads/setting/firmlogo/"+ params[:id]+"/logo.png")
        FileUtils.cp("#{Rails.root}/public/uploads/setting/firmlogo/"+ params[:id]+"/large_logo.png","#{Rails.root}/public/uploads/setting/firmlogo/"+ params[:id]+"/logo.png")  
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # # GET /settings
  # # GET /settings.json
  # def index
  #   @settings = Setting.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @settings }
  #   end
  # end

  # # GET /settings/1
  # # GET /settings/1.json
  # def show
  #   @setting = Setting.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @setting }
  #   end
  # end

  # # GET /settings/new
  # # GET /settings/new.json
  # def new
  #   @setting = Setting.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @setting }
  #   end
  # end

  # # GET /settings/1/edit
  # def edit
  #   @setting = Setting.find(params[:id])
  # end

  # # POST /settings
  # # POST /settings.json
  # def create
  #   @setting = Setting.new(params[:setting])

  #   respond_to do |format|
  #     if @setting.save
  #       format.html { redirect_to @setting, notice: 'Setting was successfully created.' }
  #       format.json { render json: @setting, status: :created, location: @setting }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @setting.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /settings/1
  # # PUT /settings/1.json
  # def update
  #   @setting = Setting.find(params[:id])

  #   respond_to do |format|
  #     if @setting.update_attributes(params[:setting])
  #       format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @setting.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /settings/1
  # # DELETE /settings/1.json
  # def destroy
  #   @setting = Setting.find(params[:id])
  #   @setting.destroy

  #   respond_to do |format|
  #     format.html { redirect_to settings_url }
  #     format.json { head :no_content }
  #   end
  # end
end
