## Yelp

This is a Yelp search app using the [Yelp API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: 12 hours

### Features
I thought it would be best to focus on fundamentals of autolayout and delegates/preserving filter state.  It turns out that with my alloted time, most of it was spent trying dubious hacks to circumvent weirdness with autolayout.

Thus, I did not have any time to complete any extra options. However the required options seem to work well, except for some strange reason my initial results do not word wrap upon program start, but then wrap fine for the life of the session.  I'm perhaps cavalierly chalking this up to a bug beyond my level of knowledge at this stage of the game...

FWIW, I did find that hard-coding the type of my cateogries data structure helped alot with Xcode being super slow indexing...

#### Required

- [X ] Search results page
   - [X ] Table rows should be dynamic height according to the content height
   - [X ] Custom cells should have the proper Auto Layout constraints
   - [X ] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
- [X ] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
   - [X ] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
   - [X ] The filters table should be organized into sections as in the mock.
   - [X ] You can use the default UISwitch for on/off states. Optional: implement a custom switch
   - [X ] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
   - [X ] Display some of the available Yelp categories (choose any 3-4 that you want).

#### Optional

- [ ] Search results page
   - [ ] Infinite scroll for restaurant results
   - [ ] Implement map view of restaurant results
- [ ] Filter page
   - [ ] Radius filter should expand as in the real Yelp app
   - [ ] Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
- [ ] Implement the restaurant detail page.

### Walkthrough

![Video Walkthrough](Wk2-walkthru.gif)

