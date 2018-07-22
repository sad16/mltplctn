# Multiplication
Demo app using Action Cable and Sidekiq, project on Heroku.

## Description
Input multiplicand. If multiplicand > 0, multiplicand range will be from 1 to multiplicand, else from multiplicand to 1.
Input multiplier. If multiplier > 0, multiplier range will be from 1 to multiplier, else from multiplier to 1.
We will get sum of all multiplication.

### Git clone
#### Clone with SSH
```
git clone git@github.com:sad16/mltplctn.git
```
#### Clone with HTTPS
```
git clone https://github.com/sad16/mltplctn.git
```
#### In directory
```
cd mltplctn
```

### Bundler
```
bundle install
```

### Create database
```
rake db:create
rake db:migrate
```

### Install Redis
[Install Redis](https://redis.io/topics/quickstart)

Run:
```
redis-server
```
### Install Sidekiq
[Install Sidekiq](https://github.com/mperham/sidekiq)

Run:
```
sidekiq
```

### Run app:
```
rails server
```