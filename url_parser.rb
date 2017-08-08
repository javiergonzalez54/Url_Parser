class UrlParser
  def initialize(url)
    @new_url = url
  end
  def scheme
    @new_url.split(":")[0]
  end
  def domain
    @new_url.split("/")[2].split(":")[0]
  end
  def port
    port_test = @new_url.split(/[:\/]/)[4]
    if port_test.to_i == 0   #(":")[2].split("/")[0]
      if @new_url.include? "https"
        return "443"
      else
        return "80"
      end
    end
    port_test
  end
  def path
    path_test = @new_url.split("/")[3].split("?")[0]
    if path_test == ""
      path_test = nil
    end
    path_test
  end
  def query_string
    hash_arr = @new_url.split("?")[1].split("#")[0].split("&")
    query = {}
    hash_arr.each do |i|
      key_val = i.split("=")
      query[key_val[0]] = key_val[1]
    end
    return query
  end
  def fragment_id
    @new_url.split("#")[1]
  end
end

# @new_url = UrlParser.new "http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
