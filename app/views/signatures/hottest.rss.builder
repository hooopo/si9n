xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "最热语录--语录网"
    xml.description "语录推荐系统-挖掘有意思的签名，段子，冷笑话等"
    xml.link hottest_signatures_url

    for signature in @signatures
      xml.item do
        xml.title truncate(signature.body, :length => 15)
        xml.description signature.body
        xml.pubDate signature.created_at.to_s(:rfc822)
        xml.link signature_url(signature)
        xml.guid signature_url(signature)
      end
    end
  end
end