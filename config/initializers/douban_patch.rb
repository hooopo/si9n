class Douban
  def get(path, headers = {})
    access_token.get(path, headers)
  end
  def post(path,data = "", headers = {})
    access_token.post(path, data, headers)
  end
  def put(path, body = "", headers = {})
    access_token.put(path, body, headers)
  end
  def delete(path, headers = {})
    access_token.delete(path, headers)
  end
  def head(path, headers = {})
    access_token.head(path, headers)
  end

  def miniblog(data)
    post("/miniblog/saying", %Q{
        <?xml version='1.0' encoding='UTF-8'?>
        <entry xmlns:ns0="http://www.w3.org/2005/Atom" xmlns:db="http://www.douban.com/xmlns/">
          <content>#{data}</content>
        </entry>
      }, {"Content-Type" =>  "application/atom+xml"})
  end

  def search_books(q)
    response = get("/book/subjects?q=#{URI.encode(q)}")
    if response.code == '200'
      return response.body
    end
  end
end

