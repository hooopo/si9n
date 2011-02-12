desc "重新计算语录rank值"
namespace :utils do
  task :ranking => :environment do
    Signature.find_each(:batch_size => 1000) do |signature|
      signature.update_attributes!(:rank => Utils.ranking(signature))
    end
  end
end