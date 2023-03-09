namespace :dev do
  desc "Resets the database"
  task resetdb: :environment do
    puts %x(rails db:drop:_unsafe)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
  end

end
