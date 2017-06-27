module Crawler
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Crawler::Rails

      # http://blog.onk.ninja/2014/12/02/mountable_engine
      config.generators do |g|
        g.test_framework :rspec, fixture: false
        # g.fixture_replacement :factory_girl, dir: "spec/factories"
      end
    end
  end
end
