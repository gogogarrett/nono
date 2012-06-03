NoNo
================

NoNo is a simple black-list profanity filter. Given a list of fields to check against, NoNo will ensure no content with any profanity is entered into the system.

## Installation ##

Latest stable release:

    gem "NoNo"

## Usage ##

In the model you want to check for profanity its as simple as one line in the model.

	class Article < ActiveRecord::Base
	 	check_profanity
		attr_accessible :body, :title
	end

This will ensure no record will be saved into the system.

    $ > Article.create(title: "<p>boob</p>", body: "<p><em>b</em>oob</p>")
    $ (0.1ms)  begin transaction
    $ (0.1ms)  rollback transaction
    $  => #<Article id: nil, title: "<p>boob</p>", body: "<p><em>b</em>oob</p>", created_at: nil, updated_at: nil> 

This also strips all HTML tags to check againsts the literal text to prevent any work arounds to the filter.

## How to Modify ##

To add or remove words from the filter simply override or extend the array in lib/nono/banned_word.rb

## TO DO ##

Extend functionality to allow for records to be saved, but simply overriden with *'s.


