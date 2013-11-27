# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Ticket::Application.config.secret_key_base = '65dd51e4f8c3172484ddff263ae4f7479b52a54471a7784ddc709f1a3520cd232e7c0c964f60c5442e8aacc76545cac648c2e9e4f9349095a6c3c9439f1a6651'
