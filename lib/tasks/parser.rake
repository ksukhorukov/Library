require 'nokogiri'
require 'pp'

namespace :parser do
  desc "Get the data from XML files that forms our library"
  task parse: :environment do
  	ParserWorker.perform_async
  end

end
