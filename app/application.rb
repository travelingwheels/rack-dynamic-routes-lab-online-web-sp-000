class Application
  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split(/item/).last
      @@items.each do |item|
      resp.write "#{item}\n"
    end
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end