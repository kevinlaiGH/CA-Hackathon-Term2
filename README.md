# README
### Hackathon brief:

Use Maslow’s hierarchy to help find needs: combine two needs from the diagram

### User stories:
- As a user, I would like to buy nipple cream from another country
- As a user, I would like to buy cheap and good quality nipple cream
- As the user who want to buy a nipple creame and i want to know the option which option suitable for me
- As a user I would like somebody to recommend nipple cream specifically for my nipples
- As a user I would like my item delivered quickly (express postage)

### Entity Relationship Diagram:
![alt Entity Relationship Diagram](/Users/kevinlai/Public/ERD.png?raw=true)


# NippleJS

using hover and aniameted class and JS
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
