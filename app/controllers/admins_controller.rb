# admin controller
class AdminsController < ApplicationController
  def index; end

  def new
    @feed = Feed.new
  end

  def create
    text = @feed.save_node(url: feed_params[:url], node: feed_params[:node], node_type: feed_params[:node_type])
    # todo adminsにも入力情報を保存する
    @feed.create(text: text) if text.present?

    if @feed.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def feed_params
    params.require(:admin).permit(:url, :node, :node_type)
  end
end
