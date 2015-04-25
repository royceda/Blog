class PostAttachmentsController < ApplicationController
  before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]

  def show
    @post_attachments = @post.post_attachments.all
  end

  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        params[:post_attachments]['image'].each do |a|
          @post_attachment = @post.post_attachments.create!(:image => a, :post_id => @post.id)
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

def update
  respond_to do |format|
    if @post_attachment.update(post_attachment_params)
      format.html { redirect_to @post_attachment.post, notice: 'Post attachment was successfully updated.' }
    end 
  end
end

  private
  def post_params
    params.require(:post).permit(:title, post_attachments_attributes: [:id, :post_id, :image])
  end
end
