module Api
  class ProvideFeedsController < ApplicationController
    def index
      render :json => { name: 'yamada' }
    end
  end
end