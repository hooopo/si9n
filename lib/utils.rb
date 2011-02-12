module Utils
  #ranking算法from：
  #http://www.guwendong.com/post/2008/social_media_algorithm_reddit.html
  #http://www.cnblogs.com/zhengyun_ustc/archive/2010/12/15/amir.html
  def ranking(signature)
    start_time = Time.mktime(2011,1,1)
    Math.log(signature.up + 1) + (signature.created_at.to_f - start_time.to_f) / 45000
  end
  module_function :ranking
end