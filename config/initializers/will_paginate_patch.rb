# encoding: utf-8
WillPaginate::ViewHelpers.pagination_options[:previous_label] = '上一页'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '下一页'
module WillPaginate::ViewHelpers::ActionView
  def paginated_section(*args, &block)
    pagination = will_paginate(*args).to_s
    (pagination + capture(&block) + pagination).try(:html_safe)
  end
end