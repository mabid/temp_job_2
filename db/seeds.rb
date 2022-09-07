1000.times do |i|
  Professional.create(name: "Professional #{i + 1}")
end

20.times do |i|
  Office.create(name: "Office #{i + 1}")
end

Office.all.each do |office|
  # Example 1: Single Booking Request to multiple professionals

  Professional.all.sample(20).each do |provider|
    100.times do |i|
      tj = TempJobPost.create(created_by: office, public: false, time_range: rand(10.years).seconds.from_now)
      tj.requests.create(sender: office, receiver: provider)
    end
  end

  # Example 2: Single Booking Proposal

  Professional.all.sample(20).each do |provider|
    100.times do |i|
      tj = TempJobPost.create(created_by: provider, public: true, time_range: rand(10.years).seconds.from_now)
      tj.requests.create(sender: provider, receiver: office)
    end
  end

  # Example 3: Temp Job Post and Multiple Applications by multiple providers
  100.times do
    tj = TempJobPost.create(created_by: office, public: true, time_range: rand(10.years).seconds.from_now)
    Professional.all.sample(10).each do |provider|
      tj.applications.create(sender: provider, receiver: office)
    end
  end

  # Example 11: Provider creates Booking Proposal, receiving owner invites other providers, then makes it a job post to be applied to

  Professional.all.sample(100).each do |provider|
    tj = TempJobPost.create(created_by: provider, public: false, time_range: rand(10.years).seconds.from_now)
    tj.requests.create(sender: provider, receiver: office)
    Professional.where.not(id: provider.id).sample(10).each do |provider2|
      tj.requests.create(sender: office, receiver: provider2)
    end
    tj.update(public: true)
  end
end
