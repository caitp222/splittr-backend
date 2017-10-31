# SplittR

This is the Ruby on Rails API for SplittR, a mobile app that allows users to create groups, scan receipts using the Google Vision API and track total group expenditure and how much each member of the group owes. Upon settling up a group, the total that each user has spend is displayed, along with how much they are owed/owe the rest of the group.

Please see the React-Native front-end repository [here](https://github.com/caitp222/splittr-frontend).

# To Run Locally
- `git clone https://github.com/caitp222/splittr-backend.git`
- `cd splittr-backend`
- `bundle install`
- `rails db:create && rails db:migrate`
- `rails s`
- The API will run on localhost:3000 by default.
