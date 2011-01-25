#AdminData.config do |config|
#  timestamps = {:created_at => "创建时间", :updated_at => "更新时间"}
#  config.number_of_records_per_page = 2
#  config.column_headers = {'Signature' => {
#      :id      => 'ID',
#      :body    => '内容',
#      :rank    => "推荐值",
#      :up      => "收藏次数",
#      :user_id => "作者ID",
#      :status  => "状态"
#    }.merge(timestamps)
#  }
#
#  config.column_settings = {'Signature' => { :status => lambda {|model| Signature::STATUS[model.status] } } }
#
#  #config.is_allowed_to_view = lambda {|controller| return true if Rails.env.development? }
#  #config.is_allowed_to_update = lambda {|controller| return true if Rails.env.development? }
#
#  config.is_allowed_to_view = lambda {|controller| return false }
#  config.is_allowed_to_update = lambda {|controller| return false }
#end