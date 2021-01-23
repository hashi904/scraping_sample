# module api
module Api
  # privide feeds class
  class ProvideFeedsController < ApplicationController
    include JwtAuthenticator
    before_action :jwt_authenticate

    def index
      render json: { feeds: Feed.all }
    end

    def create
      # status: 0: false, 1: success
      feed = Feed.new(feed_params_with_status_completed)

      if text.present? && feed.save
        render json: { status: 'success', parameters: feed_params_with_status_completed }
      else
        render json: { status: 'failed' }
      end
    rescue OpenURI::HTTPError
      render json: { http: 'not found error' }
    end

    def show
      render json: { feeds: Feed.find(params[:id]) }
    end

    def destroy
      feed = Feed.find(params[:id])
      feed.destroy
    end

    private

    def feed_params
      params.require(:feed).permit(:url, :node, :node_type)
    end

    def feed_params_with_status_completed
      feed_params.merge({ text: text, status: 1 })
    end

    def text
      Feed.save_node(
        url: feed_params[:url],
        node: feed_params[:node],
        node_type: feed_params[:node_type]
      )
    end
  end
end
