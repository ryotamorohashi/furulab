# Entry system used furulab student
## Setup

Download gemfile

```
    $ bundle install
```

Create DB

```
    $ rake db:create
```

During early development, there may be breaking changes in migration. If standard `rails db:migrate` does not work, try rerunning migration from the beginning (which eraces all existing records).

```
    $ rails db:migrate:reset
```
