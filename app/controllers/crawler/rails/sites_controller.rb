module Crawler
  module Rails
    class SitesController < ApplicationController
      def index
        @sites = Site.all
      end

      def show
        @site = Site.find(params[:id])
      end

      def new
        @site = Site.new
      end

      def create
        @site = Site.new(site_params)
        if @site.save
          redirect_to @site, notice: '作成しました'
        else
          render :new
        end
      end

      def edit
        @site = Site.find(params[:id])
      end

      def update
        @site = Site.find(params[:id])
        if @site.update(site_params)
          redirect_to @site, notice: '作成しました'
        else
          render :edit
        end
      end

      def crawl
        @site = Site.find(params[:id])
        @site.delay.crawl
        redirect_to @site, notice: 'キューしました'
      end

      private

      def site_params
        params.required(:site).permit!
      end
    end
  end
end
