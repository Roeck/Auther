User.create(email: "admin@example.com", password: "123123", password_confirmation: "123123" )
User.create(email: "1@example.com", password: "123123", password_confirmation: "123123" )

User.update_all confirmed_at: DateTime.now