class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    if params[:search].present?
      @links = Link.global_search(params[:search])
    else
      @links = Link.all
    end
    @links.limit(20).reverse
    @total_links_count = Link.all.count
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @categories = Category.all.sort_by{ |e| e.name.downcase }
  end

  # GET /links/new
  def new
    @link = Link.new
    @categories = Category.all.sort_by{ |e| e.name.downcase }
  end

  # GET /links/1/edit
  def edit
    @categories = Category.all
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    puts "Link: "
    puts link_params
    puts @link.to_s
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url, category_ids: []).merge(user_id: current_user.id)
    end
end
