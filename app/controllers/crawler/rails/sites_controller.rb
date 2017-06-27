module Crawler
  module Rails
    class SitesController < ApplicationController
      def index
        @sites = Site.all
      end
    end
  end
end
