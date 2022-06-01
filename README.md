# TWAB Redirect

## Installing dependencies

```bash
bundle install
```

## Running it locally

```bash
ruby lib/app.rb
```

## How to deploy

### Install the Heroku CLI

Download and install [the Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line).

If you haven't already, log in to your Heroku account and follow the prompts to create a new SSH public key.

```
heroku login
```

### Clone the repository

Use Git to clone twab's source code to your local machine.

```
heroku git:clone -a twab
cd twab
```

### Deploy your changes

Make some changes to the code you just cloned and deploy them to Heroku using Git.

```
git add .
git commit -am 'make it better'
git push heroku main
```
