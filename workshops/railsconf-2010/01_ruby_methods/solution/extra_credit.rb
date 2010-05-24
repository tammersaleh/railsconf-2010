def log(device, item, opts = {})
  opts[:pre] ||= "Attention!"
  string = "#{opts[:pre]} #{item.inspect}"
  string.upcase! if opts[:upcase]
  device << string
end
