# README

📚 Books Store Rails Application

A Ruby on Rails application for managing a bookstore. Users can browse, add, and manage books efficiently.

Setup
# Install dependencies
bundle install
yarn install

# Database
rails db:create
rails db:migrate
rails db:seed

# Run server
rails server

Tests
bundle exec rspec
rails test:system

Services

Sidekiq (background jobs)

Redis (required for Sidekiq)

Active Storage (file uploads)

Deployment
git push -u origin main
heroku create your-app-name
git push heroku main
rails db:migrate

Project Structure
app/      controllers, models, views, jobs
config/   routes.rb, database.yml
db/       migrate, seeds.rb
