if ENV["API_KEY"].blank? && Rails.env.production?
  puts "Error: API key enviornment variable is not defined!"
  exit(1)
end