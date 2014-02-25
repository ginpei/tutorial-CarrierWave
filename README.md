# Tutorial for CarrierWave

* Ruby on Rails: http://rubyonrails.org/
* CarrierWave: https://github.com/carrierwaveuploader/carrierwave

## Basic to use

### Set up Rails app

```bash
rails new myapp
cd myapp
rails g scaffold attachment data:string
rake db:migrate
```

### Install CarrierWave

Add this to bottom of `Gemfile`:

```ruby
gem 'carrierwave'
```

Then install gems by this command:

```bash
bundle
```

### Build uploader

Now, you can use `rails generate uploader` command.

```bash
rails g uploader file
```

It makes the file `app/uploaders/file_uploader.rb`.

Uploaded files are stored at `public/uploads`. You should add this line in `.gitignore`:

```
/public/uploads
```

### Mount uploader

Add `mount_uploader` to `app/models/Attachment.rb`. Before:

```ruby
class Attachment < ActiveRecord::Base
end
```

After:

```ruby
class Attachment < ActiveRecord::Base
  mount_uploader :data, FileUploader
end
```

`:data` means `Attachment#data`. `FileUploader` class is created by `rails g uploader`.

### Make upload form

Next, edit `app/views/attachments/_form.html.erb`:

```erb
  <div class="field">
    <%= f.label :data %><br>
    <%= f.text_field :data %>
  </div>
```

to

```erb
  <div class="field">
    <%= f.label :data %><br>
    <%= f.file_field :data %>
  </div>
```

Was `Attachment#data` string? Don't worry.

Then, you can upload files BUT wait a few minutes.

### Link to uploaded files

Add link to uploaded files in `app/views/attachments/show.html.erb`:

```erb
<p>
  <strong>Data:</strong>
  <%= @attachment.data %>
</p>
```

```erb
<p>
  <strong>Data:</strong>
  <%= link_to @attachment.data, @attachment.data.url %>
</p>
```

### Let's rock!

Run server by `rails s` and open `/attachments/` to show your great app!

