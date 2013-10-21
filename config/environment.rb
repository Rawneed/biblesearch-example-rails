# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BiblesearchExample::Application.initialize!

BiblesearchExample::Application.configure do
  ENV["DEFAULT_VERSION"] ||= "eng-GNTD"
  ENV["SITE_VERSIONS"] ||= "eng-GNTD,eng-CEV,spa-RVR60"
end