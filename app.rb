require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @list_of_categories = Category.all()
  @title = "Cookbook"
  erb(:index)
end
