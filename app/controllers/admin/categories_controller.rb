class Admin::CategoriesController < Admin::ApplicationController
  load_and_authorize_resource
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.where(:name => params[:id]).first
    @links = Link.where(:category_id => @category.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @chapters = Category.where(:chapter => 0).collect {|p| [ p.name, p.id ] }
    p @chapters
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
    @chapters = Category.where(:chapter => 0).collect {|p| [ p.name, p.id ] }
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category])
    @category.chapter = 0 if params[:is_chapter]
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end
end
