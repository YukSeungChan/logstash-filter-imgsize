# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "fastimage"

# This example filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::Imgsize < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   example {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "imgsize"

  # Replace the message with this value.
  config :image_url_field, :validate => :string, :default => "image_url"
  config :image_width_field, :validate => :string, :default => "image_width"
  config :image_height_field, :validate => :string, :default => "image_height"

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)
    @logger.debug? && @logger.debug("Running imgsize filter", :event => event)
    begin
      image_url = event[@image_url_field]
      width, height = FastImage.size(image_url)
    rescue => exception
      @logger.error("Imgszie exception occurred. Error: #{exception} ; ImageUrl: #{image_url}")
      width = height = nil
    end
    event[@image_width_field] = width
    event[@image_height_field] = height
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Example
