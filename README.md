# EssentialFeed
EssentialFeed App

[![Build Status](https://app.travis-ci.com/krishnascoding/EssentialFeed.svg?branch=main)](https://app.travis-ci.com/krishnascoding/EssentialFeed)

Essential App Case Study
  

Image Feed Feature Specs
Story: Customer requests to see their image feed
Narrative #1
As an online customer
I want the app to automatically load my latest image feed
So I can always enjoy the newest images of my friends
Scenarios (Acceptance criteria)
Given the customer has connectivity
 When the customer requests to see their feed
 Then the app should display the latest feed from remote
  And replace the cache with the new feed
Narrative #2
As an offline customer
I want the app to show the latest saved version of my image feed
So I can always enjoy images of my friends
Scenarios (Acceptance criteria)
Given the customer doesn't have connectivity
  And there’s a cached version of the feed
  And the cache is less than seven days old
 When the customer requests to see the feed
 Then the app should display the latest feed saved

Given the customer doesn't have connectivity
  And there’s a cached version of the feed
  And the cache is seven days old or more
 When the customer requests to see the feed
 Then the app should display an error message

Given the customer doesn't have connectivity
  And the cache is empty
 When the customer requests to see the feed
 Then the app should display an error message
Use Cases
Load Feed From Remote Use Case
Data:
URL
Primary course (happy path):
Execute "Load Image Feed" command with above data.
System downloads data from the URL.
System validates downloaded data.
System creates image feed from valid data.
System delivers image feed.
Invalid data – error course (sad path):
System delivers invalid data error.
No connectivity – error course (sad path):
System delivers connectivity error.
Load Feed Image Data From Remote Use Case
Data:
URL
Primary course (happy path):
Execute "Load Image Data" command with above data.
System downloads data from the URL.
System validates downloaded data.
System delivers image data.
Cancel course:
System does not deliver image data nor error.
Invalid data – error course (sad path):
System delivers invalid data error.
No connectivity – error course (sad path):
System delivers connectivity error.
Load Feed From Cache Use Case
Primary course:
Execute "Load Image Feed" command with above data.
System retrieves feed data from cache.
System validates cache is less than seven days old.
System creates image feed from cached data.
System delivers image feed.
Retrieval error course (sad path):
System delivers error.
Expired cache course (sad path):
System delivers no feed images.
Empty cache course (sad path):
System delivers no feed images.
Load Feed Image Data From Cache Use Case
Data:
URL
Primary course (happy path):
Execute "Load Image Data" command with above data.
System retrieves data from the cache.
System delivers cached image data.
Cancel course:
System does not deliver image data nor error.
Retrieval error course (sad path):
System delivers error.
Empty cache course (sad path):
System delivers not found error.
Validate Feed Cache Use Case
Primary course:
Execute "Validate Cache" command with above data.
System retrieves feed data from cache.
System validates cache is less than seven days old.
Retrieval error course (sad path):
System deletes cache.
Expired cache course (sad path):
System deletes cache.
Cache Feed Use Case
Data:
Image Feed
Primary course (happy path):
Execute "Save Image Feed" command with above data.
System deletes old cache data.
System encodes image feed.
System timestamps the new cache.
System saves new cache data.
System delivers success message.
Deleting error course (sad path):
System delivers error.
Saving error course (sad path):
System delivers error.
Cache Feed Image Data Use Case
Data:
Image Data
Primary course (happy path):
Execute "Save Image Data" command with above data.
System caches image data.
System delivers success message.
Saving error course (sad path):
System delivers error.
Flowchart
Feed Loading Feature

Model Specs
Feed Image
Property	Type
id	UUID
description	String (optional)
location	String (optional)
url	URL
Payload contract
GET /feed

200 RESPONSE

{
	"items": [
		{
			"id": "a UUID",
			"description": "a description",
			"location": "a location",
			"image": "https://a-image.url",
		},
		{
			"id": "another UUID",
			"description": "another description",
			"image": "https://another-image.url"
		},
		{
			"id": "even another UUID",
			"location": "even another location",
			"image": "https://even-another-image.url"
		},
		{
			"id": "yet another UUID",
			"image": "https://yet-another-image.url"
		}
		...
	]
}
Image Comments Feature Specs
Story: Customer requests to see image comments
Narrative
As an online customer
I want the app to load image commments
So I can see how people are engaging with images in my feed
Scenarios (Acceptance criteria)
Given the customer has connectivity
 When the customer requests to see comments on an image
 Then the app should display all comments for that image
Given the customer doesn't have connectivity
 When the customer requests to see comments on an image
 Then the app should display an error message
Use Cases
Load Image Comments From Remote Use Case
Data:
ImageID
Primary course (happy path):
Execute "Load Image Comments" command with above data.
System loads data from remote service.
System validates data.
System creates comments from valid data.
System delivers comments.
Invalid data – error course (sad path):
System delivers invalid data error.
No connectivity – error course (sad path):
System delivers connectivity error.
Model Specs
Image Comment
Property	Type
id	UUID
message	String
created_at	Date (ISO8601 String)
author	CommentAuthorObject
Image Comment Author
Property	Type
username	String
Payload contract
GET /image/{image-id}/comments

2xx RESPONSE

{
	"items": [
		{
			"id": "a UUID",
			"message": "a message",
			"created_at": "2020-05-20T11:24:59+0000",
			"author": {
				"username": "a username"
			}
		},
		{
			"id": "another UUID",
			"message": "another message",
			"created_at": "2020-05-19T14:23:53+0000",
			"author": {
				"username": "another username"
			}
		},
		...
	]
}
App Architecture
