module Crawler::Rails
  class Entry < ApplicationRecord
    belongs_to :page_source
  end
end
