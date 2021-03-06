class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    if params[:keyword]
      @ideas = Idea.search(params[:keyword])
    else
      @ideas = Idea.all.reverse
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    if params[:mode] == "random"
      @idea = Idea.random
    else
      @idea = Idea.find(params[:id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    if params[:multi_line] == 0
      respond_to do |format|
        if @idea.save
          format.html { redirect_to new_idea_path(author: @idea.author), notice: 'Idea was successfully created.' }
          format.json { render json: @idea, status: :created, location: @idea }
        else
          format.html { render action: "new" }
          format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    else
      @idea_collection = @idea.content.split(/\r?\n/)
      @idea_collection.each do |idc|
        Idea.create(author: @idea.author, content: idc, category: @idea.category)
      end
      redirect_to ideas_path
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
end
