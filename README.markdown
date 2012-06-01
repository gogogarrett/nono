Profanity Filter
================

Profanity Filter is a black-list based validator. Given a list of fields to check against, Profanity Filter will ensure no content with any profanity is entered into the system.

## Installation ##

Latest stable release:

    gem "profanity_filter"

## Usage ##

In the model you want to check for profanity its as simple as long line in the model.

	class Article < ActiveRecord::Base
	 	include ProfanityFilter
		attr_accessible :body, :title
	end

This will ensure no record will be saved into the system.