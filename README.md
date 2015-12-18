# dwolla-token-generator
A Rails-based OAuth token generator for Dwolla. 

## Getting started
First, install dependencies.  You'll need Bundler and Ruby 2.x.x.

```
bundle install
```

Then, to run locally:

```
rails s -e development
```

## Run in docker
```
docker build -t dwolla-token-generator .
docker run -e development
```

## Contributing

Feel free to submit an issue or pull request!
