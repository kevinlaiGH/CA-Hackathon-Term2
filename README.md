# README
### Hackathon brief:

Use Maslow’s hierarchy to help find needs: combine two needs from the diagram

### User stories:
- As a user, I would like to buy cream from another country
- As a user, I would like to buy cheap and good quality cream
- As the user who want to buy cream and i want to know the option which option suitable for me
- As a user I would like somebody to recommend the cream specifically for my body
- As a user I would like my item delivered quickly (express postage)

### Wireframing:

![alt Wireframing](/public/wireframe.png?raw=true)

### Entity Relationship Diagram:

![alt Entity Relationship Diagram](/public/erd.png?raw=true)



### Team Workflow On Trello
<img width="556" alt="screen shot 2017-10-25 at 23 20 21" src="https://user-images.githubusercontent.com/28947546/31998641-468dd43c-b9dc-11e7-8757-2592a000f11a.png">
<img width="275" alt="screen shot 2017-10-25 at 23 22 01" src="https://user-images.githubusercontent.com/28947546/31998643-470bb848-b9dc-11e7-878d-61df2cb367a5.png">
<img width="1407" alt="screen shot 2017-10-25 at 23 19 49" src="https://user-images.githubusercontent.com/28947546/31998644-476db7d2-b9dc-11e7-91ca-bf05eef5e96c.png">
# NippleJS

using hover and animated class and JS
```
<script>
  var bounceNipple = function(combo, animationName, showAlert) {
    var animationClasses = 'animated ' + animationName;
    $('.' + combo).addClass(animationClasses);
    //  console.log('.nipple added classes to combo: %s, %s', combo, animationClasses);
    if (showAlert == true) {
      alert("GO TO HOSPITAL!!");
    }
    setTimeout(function(){
      $('.' + combo).removeClass(animationClasses);
      // console.log('.nipple removed classes to combo: %s, %s', combo, animationClasses);
    }, 1500);
  };

  $(document).ready(function() {
      var animationActions = ['bounce', 'flash', 'tada', 'swing', 'shake'];
      var prefix = 'nipple';
      animationActions.forEach(function (animationName, animationActionNo) {
        animationActionNo += 1;
        console.log(`.nipple event listener generated: ${animationName}${animationActionNo}`); // string interpolation
        // console.log('.nipple event listener: %s%d', animationName, animationActionNo); // string placeholders
        var combo = prefix + animationActionNo;
        $('#' + combo).click (function() {
          if (animationName == 'shake')
            bounceNipple(combo, animationName, true);
          else {
            bounceNipple(combo, animationName, false);
          }
        });
      });
  });
</script>
```


# Reviews

### 1.add component from raty
https://github.com/wbotelhos/raty

・add 3 images to your rails file
```
star-on.png, star-off.png, star-half.png
```
・add 1 style js file to your rails file
```
jquery.raty.js
```

### 2.create Reviews table
```
rails g model review rating:integer  comment:text user:references product:references
```

### 3.modify the model
```
#user
  has_many :reviews

#product
    has_many :reviews
```


### 4.create reviews controller
```
rails g controller review
```

 and inside should be like this

```
class ReviewsController < ApplicationController

  before_action :find_product
  before_action :find_review,  only:[:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if review.updated(review_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_review
      @review = Review.find(params[:id])
  end

end
```

###  5.create view
```
create reviews folder
```
```
create file
・ new.html.erb
・ edit.html.erb
・_review.html.erb
・_form.html.erb
```

each file inside should be like this

```
#new.html.erb
  <div class="new-review-form">
    <h1> Post Review </h1>
      <%= render 'form' %>
  </div>
```

```
#edit.html.erb
  <div class="edit-review-form">
    <h1> Edit Review </h1>

    <%= form_for([@product, @review]) do |f| %>
      <div id="rating-form">
        <label> Rating </label>
        <%= f.label :rating %><br/>
      </div>
      <div class="field">
        <%= f.label :comment %><br />
        <%= f.text_area :comment %>
      </div>
      <div class="actions">
        <%= f.submit %>
      </div>
    <% end %>
  </div>

<script>

  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
</script>
```

```
#review.html.erb

<div class="review">

    <div class="review-rating" data-score="<%= review.rating %>"> </div>
      <p class="review-comment"> <%= review.comment %> </p>

    <p><small> commented <strong><%= time_ago_in_words(review.created_at) %> ago </strong> by <%= review.user.email %> </small></p>

      <% if review.user == current_user %>
        <%= link_to "Delete", product_review_path(review.product, review), method: :delete %>
      <% end %>
  </p>

</div>
```

```
# _form.html.erb

<%= form_for([@product, @product.reviews.build]) do |f| %>

  <div id="rating-form">
    <label> Rating <label>
  </div>

  <div class="field">
    <%= f.label :comment %><br />
    <%= f.text_area :comment %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

<script>
  $('#rating-form').raty({
    path: '/assets/',
    scoreName: 'review[rating]'
  });
</script>
```

### 6.  add  view where you want to show the result

```
  <div class="reviews">
      <strong>Review:</strong><br>
      <%= render @product.reviews %>
      <%= link_to 'Edit', edit_product_path(@product) %> |
      <%= link_to 'Back', products_path %>
  </div>
  ```
  
### Coder Academy Ruby on Rails Assignment
Due November 10th 2017


(pic of app)


#Deliverables
Design Documentation
Demonstrate your ability to break down the problem and design a solution.

- 1 One page summary of your application including problem definition, solution.
* [Summary]


- 2 User stories for the whole application.
- 3 A workflow diagram of the user journey/s.
- 4 Wireframes for at least 5 screens.
- 5 Entity Relationship Diagram (ERD).
- 6 Project plan and estimation.



Rails application code
Demonstrate Ruby on Rails development skills.

- [x] Create your application using Ruby on Rails.
- [x]  Demonstrate knowledge of Rails conventions.
- [x]  Use postgresql database in development.
- [x] Use an API (eg. Omniauth, Geocoding, Maps, other..).
- [ ] Use appropriate gems.
- [ ] Use environmental variables to protect API keys etc. (dotenv)
- [ ] Implement a payment system for your product. (e.g. Stripe)
- [ ] Your app must send transactional emails (eg. using Mailgun).
- [ ] Your app should have an internal user messaging system.
- [ ] Your app will have some type of searching, sorting and/or filtering capability.
- [ ] Your app will have some type of file uploading capability (eg. images).
- [ ] Your app will have authentication (eg. Devise, must have full functionality in place).
- [ ] Your app will have authorisation (users have restrictions on what they can see and edit).
- [ ] Your app will have an admin dashboard for the admin user to administrate the site.
- [ ] Document your application with a README that explains how to setup, configure and use your application.






# Project Title

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With



## Contributing


## Versioning


## Authors


## License

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
