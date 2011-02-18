# encoding: utf-8
module SignaturesHelper
  def feed_link(options = {})
    options = {:image => "feed.gif", :title => "订阅"}.merge(options)
    link_to "#{image_tag(options[:image])} #{options[:title]}".html_safe, options[:feed], "data-popup" => true
  end
end
