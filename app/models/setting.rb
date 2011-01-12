class Setting < ActiveRecord::Base
  has_one :user

  RANDOM_MODE = {
    0 => "从所有随机",
    1 => "从最新100条随机",
    2 => "从最热100条随机"
  }

end