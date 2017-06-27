module Crawler
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Crawler::Rails
    end
  end
end
