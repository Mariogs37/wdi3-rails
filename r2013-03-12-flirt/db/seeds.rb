User.delete_all
Administrator.delete_all
Subscriber.delete_all
Subscription.delete_all

['Free', 'Basic', 'Flirt'].each do |name|
  Subscription.create(plan: name)
end

u1 = User.create(email: 'anonymous@gmail.com', username: 'Anonymous', password: 'a', password_confirmation: 'a')
u2 = User.create(email: 'subscriber@gmail.com', username: 'Subscriber', password: 'a', password_confirmation: 'a')
u3 = User.create(email: 'admin@gmail.com', username: 'Admin', password: 'a', password_confirmation: 'a')
admin = Administrator.create(role: 'DBA')
anonymous = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
subscriber = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)

subscriber.subscription = Subscription.first
subscriber.save

admin.user = u3
anonymous.user = u1
subscriber.user = u2
