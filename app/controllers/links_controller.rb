class LinksController < ApplicationController
  load_and_authorize_resource
  # GET /links
  # GET /links.json
  def index
    @links = Link.validated.order("created_at DESC")
    @trends_links = Link.validated.order("clicks DESC").limit(5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])
    @link.update_click
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new
    @categories = Category.all.collect {|p| [ p.name, p.id ] }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
    @categories = Category
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  def get_title
    duplicates = Link.where(:url=>params[:url])
    begin
      doc = Nokogiri::HTML(open params[:url])
      p doc.css('html').first.attributes["lang"]
      title = doc.css('title').inner_text.gsub(/\r\n?/, "").strip
      render :json => {url_title: title, exists:duplicates.empty?}
    rescue
      render :json => {wrong_url: true, }
    end
  end
end
