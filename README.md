# Sistêmico

Sistêmico is an abundant and open no-currency.

It is based on a inexhaustible source of value: you.

## Installing

There are two ways of installing *Sistêmico* for development. Both 
requires a `FACEBOOK_APP_ID`  and a `FACEBOOK_APP_SECRET` to enable
login into the platform. Once you have finished one of the following
installation methods, start the Rails server using your Facebook
credentials:

```
FACEBOOK_APP_ID=… FACEBOOK_APP_SECRET=… rails s
```

### Locally

First, make sure your system has the following dependencies:

* Ruby 2.0+ 
* PostgreSQL 9.3+ (you'll need the postgresql contrib modules as well)

Then, simply clone the repository:

```
git clone git@github.com:danielweinmann/sistemico.git
```

And install all the gem dependencies: 

```
cd sistemico
bundle install
```

Copy `config/database.sample.yml` into `config/database.yml`,
adjusting any options to your database configuration. To create the
schema and run the migrations:

```
rake db:migrate
rake db:setup
```

...and you're ready to go! :)

### Using Vagrant

Before installing, make sure you have recent versions of
[Git](http://www.git-scm.com/), [Vagrant](https://www.vagrantup.com/)
and [VirtualBox](https://www.virtualbox.org/) installed on your
development machine.

Then, simply clone the repository:

```
git clone git@github.com:danielweinmann/sistemico.git
```

And create a Vagrant machine from the root of the project:

```
cd sistemico
vagrant up && vagrant ssh
```

This will download and install all the required dependencies, set up the
database for you, and start a ssh client to your virtual machine. The
project files are on the `/vagrant` directory.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`) 
3. Commit your changes (`git commit -am 'Add some feature'`) 
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

This project rocks and uses the [MIT LICENSE](LICENSE).