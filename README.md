# Requirements
- Ruby 3.2.0
- Bundler 2.4.6

# Setup
- From the repository folder run `bundle install`
- Run `rails s` to start the rails server
- The API endpoints should now be available at http://localhost:3000

# API
- The API has two endpoints "/fixed" and "/decreasing"
- Both endpoints require this params:
  - amount (The total borrowed amount)
  - credit_period (The number of payments left)
  - annual_equivalent_rate (or RRSO)
