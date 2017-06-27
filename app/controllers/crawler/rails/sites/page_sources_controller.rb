module Crawler
  module Rails
    module Sites
      class PageSourcesController < ApplicationController
        def index
          @page_sources = PageSource.all
        end

        def show
          @page_source = PageSource.find(params[:id])
        end

        def new
          @site = Site.find(params[:site_id])
          @page_source = @site.page_sources.build
        end

        def create
          @site = Site.find(params[:site_id])
          @page_source = @site.page_sources.build(page_source_params)
          if @page_source.save
            redirect_to @site, notice: '作成しました'
          else
            render :new
          end
        end

        def edit
          @site = Site.find(params[:site_id])
          @page_source = @site.page_sources.find(params[:id])
        end

        def update
          @site = Site.find(params[:site_id])
          @page_source = @site.page_sources.find(params[:id])
          if @page_source.update(page_source_params)
            redirect_to @site, notice: '作成しました'
          else
            render :edit
          end
        end

        private

        def page_source_params
          params.required(:page_source).permit!
        end
      end
    end
  end
end
