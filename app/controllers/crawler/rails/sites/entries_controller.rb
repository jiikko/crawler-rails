module Crawler
  module Rails
    module Sites
      class EntriesController < ApplicationController
        def new
          @site = Site.find(params[:site_id])
          @entry = @site.entries.build
        end

        def create
          @site = Site.find(params[:site_id])
          @entry = @site.entries.build(entry_params)
          if @entry.save
            redirect_to @site, notice: '作成しました'
          else
            render :new
          end
        end

        def edit
          @site = Site.find(params[:site_id])
          @entry = @site.entries.find(params[:id])
        end

        def update
          @site = Site.find(params[:site_id])
          @entry = @site.entries.find(params[:id])
          if @entry.update(entry_params)
            redirect_to @site, notice: '作成しました'
          else
            render :edit
          end
        end

        def test_run
          @site = Site.find(params[:site_id])
          page_source = @site.page_sources.find(params[:page_source_id])
          entry = @site.entries.build(page_source_id: page_source.id,
                                      scraping_code: params[:scraping_code])
          @out = entry.scrape
          @out = [@out, Time.now.to_s].join("\n") # add timestamp
          respond_to do |format|
            format.js { render :test_run }
            format.any { head :not_found }
          end
        end

        private

        def entry_params
          params.required(:entry).permit!
        end
      end
    end
  end
end
