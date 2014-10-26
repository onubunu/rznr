class ServiceboxesController < ApplicationController
  before_filter :authenticate_user!, except: [ :index ]
  before_filter :is_admin?, except: [ :index ]
  
  # GET /serviceboxes
  # GET /serviceboxes.json
  def index
    @serviceboxes = Servicebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @serviceboxes }
    end
  end

  # GET /serviceboxes/1
  # GET /serviceboxes/1.json
  def show
    @servicebox = Servicebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @servicebox }
    end
  end

  # GET /serviceboxes/new
  # GET /serviceboxes/new.json
  def new
    @servicebox = Servicebox.new
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
  # def new
  #   @servicebox = Servicebox.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @servicebox }
  #   end
  # end

  # GET /serviceboxes/1/edit
  def edit
    @servicebox = Servicebox.find(params[:id])
  end

  # POST /serviceboxes
  # POST /serviceboxes.json
  def create
    @servicebox = Servicebox.new(params[:servicebox])
    if @servicebox.save
      if params[:servicebox][:serviceboximage].present?
        render :crop
      else
        redirect_to :back, notice: 'Leistung erfolgreich angelegt.'
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @servicebox.errors, status: :unprocessable_entity }
      end
    end
  end
 # def create
 #    @servicebox = Servicebox.new(params[:servicebox])

 #    respond_to do |format|
 #      if @servicebox.save
 #        format.html { redirect_to @servicebox, notice: 'Servicebox was successfully created.' }
 #        format.json { render json: @servicebox, status: :created, location: @servicebox }
 #      else
 #        format.html { render action: "new" }
 #        format.json { render json: @servicebox.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

  # PUT /serviceboxes/1
  # PUT /serviceboxes/1.json
  def update
    @servicebox = Servicebox.find(params[:id])
    if @servicebox.update_attributes(params[:servicebox])
      if params[:servicebox][:serviceboximage].present?
        render :crop
      else
        redirect_to serviceboxes_url, notice: 'Leistung erfolgreich aktualisiert.'
        FileUtils.rm("#{Rails.root}/public/uploads/servicebox/serviceboximage/"+ params[:id]+"/box.jpg")
        FileUtils.cp("#{Rails.root}/public/uploads/servicebox/serviceboximage/"+ params[:id]+"/large_box.jpg","#{Rails.root}/public/uploads/servicebox/serviceboximage/"+ params[:id]+"/box.jpg")  
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @servicebox.errors, status: :unprocessable_entity }
      end
    end
  end
  # def update
  #   @servicebox = Servicebox.find(params[:id])

  #   respond_to do |format|
  #     if @servicebox.update_attributes(params[:servicebox])
  #       format.html { redirect_to @servicebox, notice: 'Servicebox was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @servicebox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /serviceboxes/1
  # DELETE /serviceboxes/1.json
  def destroy
    @servicebox = Servicebox.find(params[:id])
    @servicebox.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/servicebox/serviceboximage/#{params[:id]}", :force => true)  
    respond_to do |format|
      format.html { redirect_to serviceboxes_url }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @servicebox = Servicebox.find(params[:id])
  #   @servicebox.destroy

  #   respond_to do |format|
  #     format.html { redirect_to serviceboxes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
