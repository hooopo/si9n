# 语录推荐系统

__ 通过它来分享有意思的语言吧，可以与豆瓣同步 __

## TODO List

- 页面UI基本达到可用程度
- 将js的alert替换成更友好的提示
- 在豆瓣建立机器人账户，通过此账户转发有意思的段子，签名，冷笑话等
- 排行榜添加显示作者头像和链接
- 添加GA
- 对signature#show页面进行访问限制，referer的domain只能为douban.com
- rss订阅 排行榜（一周最热，一年最热，本月最热）以后再说  

## 怎么样在本地运行？

  环境：__environment: ruby 1.9, rails 3__

      bundle check
      bundle install
      rake db:create:all
      rake db:migrate
      rake db:seed
      rails s thin
