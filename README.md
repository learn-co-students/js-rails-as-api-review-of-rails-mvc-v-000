# Review of the Rails MVC

## Learning Goals

- Review the MVC structure of Rails

## Introduction

We left Rails with the ability to manage data and display it in a browser using
models, views and controllers. As we have seen, Rails can entirely handle the
front and backend of a website - one reason it is a great tool for web
development.

With Rails, though, we aren't required to strictly render ERB views. In this
code-along, we're going to briefly review the MVC structure of Rails as well as
rendering through the Rails controller. The basic files of a Rails app are 
provided in this lesson, but some files will need content from this Readme to 
function.

## Review of MVC Structure

The model, view, controller structure is a separation of concerns where groups
of files have specific jobs and interact with each other in very defined ways:

- **Models:** The 'logic' of a web application. This is where data is
  manipulated and/or saved to a database.
- **Views:** The 'frontend', user-facing part of a web application - this is
  the only part of the app that the user interacts with directly. Views generally
  consist of HTML, CSS, and Javascript.
- **Controllers:** The go-between for models and views. The controller relays
  data from the browser to the application, and from the application to the
  browser.

To review the model, view, controller structure in Rails, we're going to quickly
walk through the setting up a basic resource. 

Let's imagine we want to build an amateur bird watching website. To start, we'll 
just try to create a site that displays different types of birds. Using Rails and 
this MVC pattern, the data about these birds would be contained within a database, 
so let's set that up.

First, we need a migration to set up the database:

```ruby
# db/migrate/2019_create_birds.rb

class CreateBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :birds do |t|
      t.string :name
      t.string :species

      t.timestamps
    end
  end
end
```

Then run `rails db:migrate` to create the schema. We set this up first because
we quickly move away from working directly with the database. With
Rails, we actually want to create a model to represent and manipulate the data. Create
the following `Bird` model in `app/models/bird.rb`:

```ruby
class Bird < ApplicationRecord
end
```

> **ASIDE:** By inheriting from `ApplicationRecord`, `Bird` also inherits from
> [`ActiveRecord`][activerecord], which you may remember is an [ORM][], or Object
> Relational Map. Because of this, we gain many useful methods like `all` and
> `save` without having to include any additional methods.

With a model and the database set up, we can add a little data to help display
our view later. Some seed data is provided in `db/seeds.rb`; just run `rails
db:seed` and it should create four `Bird` records. You can always check these by
running `rails console`, then use `Bird.all` to confirm these instances are appearing.

Now we can configure a route and corresponding controller method. To keep things
simple, We'll just set up a basic `index` action with a route:

```ruby
Rails.application.routes.draw do
  get '/birds' => 'birds#index'
end
```

And a controller with corresponding action:

```ruby
class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end
end
```

Any visitors to `'/birds'` will get routed to the `index` action in the
`BirdsController`. This action shows one thing - get all instances of the `Bird`
model and store them in a variable, `@birds`. Now the controller and model are
set up to work together.

Rails favors convention over configuration. For this reason, if a **_folder_**
and **_file_** are present in the **_views_** folder that correspond to a
**_controller_** and **_action_** listed on a **_route_**, Rails will display
that **_view_** by default. 

In our example, we have a route pointed to `'birds#index'`. In `app/views`, we
_also_ have a `/birds` folder containing `index.html.erb`. Rails recognizes this
as a match and so implicitly renders this file. This is the same as writing:

```ruby
class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render 'birds/index.html.erb'
  end
end
```

The provided `birds/index.html.erb` file contains ERB code that will list out each
bird's name and species in an unordered list:

```html
<h1>Birds</h1>

<ul>
<% @birds.each do |bird| %>
    <li><%= bird.name %> - <%= bird.species %></li>
<% end %>
</ul>
```

## Conclusion

As it is currently configured, we already have a Rails app up and running using 
the MVC structure! If you run `rails server` and visit the `'/birds'` path, you 
should see a list of birds.

With minimal work, as we just saw, we were able to spin up a resource backed by
a database and serve it up in a browser. In short, when a visitor goes to
`'/birds'` on this Rails app, the controller retrieves data from the `Bird`
model and then serves that data to the visitor by displaying it in a view. 

So where does JavaScript fit in? Well, we have the skills to build out our own
frontends. As we will see in the next lesson, rather than using the ERB view,
Rails is flexible enough to give us something we can use with
JavaScript and `fetch()`.

## Resources

- [ActiveRecord Basics][activerecord]
- [Layouts and Rendering in Rails][layouts]

[activerecord]: https://guides.rubyonrails.org/active_record_basics.html
[layouts]: https://guides.rubyonrails.org/v5.2/layouts_and_rendering.html
[orm]: https://en.wikipedia.org/wiki/Object-relational_mapping
