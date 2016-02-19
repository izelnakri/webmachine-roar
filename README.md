I didn't implement the authentication yet or fully finished this as it takes too much time.
API authentication example: https://gist.github.com/izelnakri/656bcab95a5526e48da7

I might continue later but the code is already high quality for a toy script ;)

## SETUP
- install gems:
``` bundle install ```
- to add persistence via ActiveRecord:
``` createdb izel_roar ```
``` ruby migration.rb ```

## SERVER
``` ruby server.rb ```

## CLIENT
``` ruby client.tb ```
Check the resources/album.rb for the details

## CONSOLE (for debugging):
``` ruby console.rb ```

## UTILS
to delete the database:
``` dropdb izel_roar ```

## What else could be done?
- write a better api with relationships(half done)
- Meta-programming to remove duplicated code
- Capistrano deployment to VPS
- Testing
- Environments + env vars
- change server adapter

## DEPLOYMENT
maybe do it with capistrano

||= (Memoization) not thread-safe:
https://bearmetal.eu/theden/how-do-i-know-whether-my-rails-app-is-thread-safe-or-not/
instead it suggests this:
Thread.current[:expensive_var] ||= MyModel.find(id)
