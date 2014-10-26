class ReferenceboxesController < ApplicationController
  before_filter :authenticate_user!, except: [ :index ]
  before_filter :is_admin?, except: [ :index ]
  
  # GET /referenceboxes
  # GET /referenceboxes.json
  def index
    @referenceboxes = Referencebox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referenceboxes }
    end
  end

  # GET /referenceboxes/1
  # GET /referenceboxes/1.json
  def show
    @referencebox = Referencebox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @referencebox }
    end
  end

  # GET /referenceboxes/new
  # GET /referenceboxes/new.json
  def new
    @referencebox = Referencebox.new
    respond_to do |format|
      format.html # ne.html.erb
      format.js
    end
  end
  # def new
  #   @referencebox = Referencebox.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @referencebox }
  #   end
  # end

  # GET /referenceboxes/1/edit
  def edit
    @referencebox = Referencebox.find(params[:id])
  end

  # POST /referenceboxes
  # POST /referenceboxes.json
  def create
    @referencebox = Referencebox.new(params[:referencebox])
    if @referencebox.save
      if params[:referencebox][:referenceimage].present?
        render :crop
      else
        redirect_to :back, notice: 'Referenz erfolgreich angelegt.'
      end
    else
      respond_to do |format|
        format.html { render action: "new" }
        format.json { render json: @referencebox.errors, status: :unprocessable_entity }
      end
    end
  end
  # def create
  #   @referencebox = Referencebox.new(params[:referencebox])

  #   respond_to do |format|
  #     if @referencebox.save
  #       format.html { redirect_to @referencebox, notice: 'Referencebox was successfully created.' }
  #       format.json { render json: @referencebox, status: :created, location: @referencebox }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @referencebox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /referenceboxes/1
  # PUT /referenceboxes/1.json
  def update
    @referencebox = Referencebox.find(params[:id])
    if @referencebox.update_attributes(params[:referencebox])
      if params[:referencebox][:referenceimage].present?
        render :crop
      else
        redirect_to referenceboxes_url, notice: 'Referenz erfolgreich angelegt.'
        FileUtils.rm("#{Rails.root}/public/uploads/referencebox/referenceimage/"+ params[:id]+"/box.jpg")
        FileUtils.cp("#{Rails.root}/public/uploads/referencebox/referenceimage/"+ params[:id]+"/large_box.jpg","#{Rails.root}/public/uploads/referencebox/referenceimage/"+ params[:id]+"/box.jpg")  
      end
    else
      respond_to do |format|
        format.html { render action: "edit" }
        format.json { render json: @referencebox.errors, status: :unprocessable_entity }
      end
    end
  end
  # def update
  #   @referencebox = Referencebox.find(params[:id])

  #   respond_to do |format|
  #     if @referencebox.update_attributes(params[:referencebox])
  #       format.html { redirect_to @referencebox, notice: 'Referencebox was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @referencebox.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /referenceboxes/1
  # DELETE /referenceboxes/1.json
  def destroy
    @referencebox = Referencebox.find(params[:id])
    @referencebox.destroy
    FileUtils.remove_dir("#{Rails.root}/public/uploads/referencebox/referenceimage/#{params[:id]}", :force => true)
    respond_to do |format|
      format.html { redirect_to referenceboxes_url }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @referencebox = Referencebox.find(params[:id])
  #   @referencebox.destroy

  #   respond_to do |format|
  #     format.html { redirect_to referenceboxes_url }
  #     format.json { head :no_content }
  #   end
  # end
end
