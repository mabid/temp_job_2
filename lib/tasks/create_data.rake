namespace :create_data do
  desc 'create 1000 Offices and Professionals'
  task offices_and_professionals: :environment do
    professionals = []
    1000.times do |i|
      professionals << Professional.new(name: "Professional #{i}")
    end
    Professional.insert professionals
  end
end