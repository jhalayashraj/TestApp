class CommentsController < ApplicationController
  before_action :set_post, except: [:content_validator_comment]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.create(comment_params)
    # @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        flash[:success] = "Comment was successfully created."
        format.html { redirect_to post_path(@post) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        flash[:success] = "Comment was successfully updated."
        format.html { redirect_to post_path(@post) }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      flash[:danger] = "Comment was successfully destroyed."
      format.html { redirect_to @comment.post }
      format.json { head :no_content }
    end
  end

  def content_validator_comment
    @content = Comment.find_by_content(params[:comment][:content])

    respond_to do |format|
      format.json { render :json => !@content.present? }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id, reviews_attributes: [:user_id, :id, :content, :_destroy])
    end
end
