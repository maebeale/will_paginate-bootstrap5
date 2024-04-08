# will_paginate-bootstrap5

---

This is a fork of the original [will_paginate-bootstrap]() gem (thank you for the 10 years I used this gem, btw!!!).

The original gem is no longer maintained, so this fork allows me to 
ensure usage of the LinkRenderer. 

Rails 7+'s new built-in pagination offers the
`paginate` method (and more), but seems to not yet include a defined LinkRenderer.


---

[![Code Climate](https://codeclimate.com/github/bootstrap-ruby/will_paginate-bootstrap.png)](https://codeclimate.com/github/bootstrap-ruby/will_paginate-bootstrap)

![Bootstrap Pagination Component](https://raw.github.com/bootstrap-ruby/will_paginate-bootstrap/master/pagination.png)

This gem integrates the [Bootstrap](http://getbootstrap.com/) [pagination component](http://getbootstrap.com/components/#pagination) with the [will_paginate](https://github.com/mislav/will_paginate) pagination gem.

Just like will_paginate, Rails and Sinatra are supported.

## Install

* For projects using Bundler (like Rails 7+):
  * add `gem 'will_paginate-bootstrap5'` to `Gemfile` (and then run `bundle install`).
    * (this works without needing to add `gem 'will_paginate'` to `Gemfile`)
* Otherwise:
  * `gem install will_paginate-bootstrap5`

## Usage

### Rails

1. Add Bootstrap CSS to your project 
    * For Rails 7+ projects, use _one_ of the following options:
        * install the `boostrap` gem
        * manually download `bootstrap.css` from the bootstrap website and save it under `[your repo]/vendor/assets/stylesheets`
            * add `//= link_tree ../../../vendor/assets/stylesheets .css` to `app/assets/config/manifest.js` so it gets compiled by sprockets/asset pipeline
        * add bootstrap's CDN url within the `<head>` of your `app/views/layout.html.erb`
        * pin the CDN in your `config/importmap.rb`
2. In your view, use the `renderer: BootstrapPagination::Rails` option with the `will_paginate` helper, for example:

```ruby
<%= will_paginate @collection, renderer: BootstrapPagination::Rails %>
```



### Sinatra

  1. Load the Bootstrap CSS in your template.
  2. `require "will_paginate-bootstrap"` in your Sinatra app.
  3. In your view, use the `renderer: BootstrapPagination::Sinatra` option with the `will_paginate` helper, for example:

```ruby
<%= will_paginate @collection, renderer: BootstrapPagination::Sinatra %>
```

## Compatibility

Starting at version 1.0, this gem no longer supports Bootstrap 2.

<table>
	<tr>
		<th>Ruby</th>
		<td>>= 1.9.2</td>
	</tr>
	<tr>
		<th>will_paginate</th>
		<td>>= 3.0.3</td>
	</tr>
	<tr>
		<th>Bootstrap</th>
		<td>>= 5.0.0</td>
	</tr>
</table>

Bootstrap 2 users can use version `0.2.5` of the original gem, which was the last version to offer Bootstrap 2 support.
