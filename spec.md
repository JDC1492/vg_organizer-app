# Specifications for the Rails Assessment

Specs:
<!-- - [x] Using Ruby on Rails for the project -->
<!-- - [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)  -->
<!-- - [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -->
<!-- - [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -->
<!-- - [/] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -->
<!-- - [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise) -->
<!-- - [x] Include third party signup/login (how e.g. Devise/OmniAuth) -->
<!-- - [x] Include nested resource show or index (URL e.g. users/2/recipes) -->
<!-- - [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -->
<!-- - [x] Include form display of validation errors (form URL e.g. /recipes/new) -->



Confirm:
- [] The application is pretty DRY
- [] Limited logic in controllers
- [] Views use helper methods if appropriate
- [] Views use partials if appropriate



Project To-Do's
Throughout: Keep in mind partials and helpers -- for use in views 
-[ ] map out your project models - include tables, attr, fields, relationships - as you expect them to be
-[ ] generate rails with - rails new NAME
-[ ] if devise:
    - install devise immediately
    - generate user model and all devise structures
    - add in omniauth & 3rd party authentication
-[ ] if not devise:
    - generate user/s model
    - build out authentication
        -using bcrypt
    - add in omniauth & 3rd party authentication
-[ ] generate your migrations for your tables
    -make sure that you do your join tables last (in order to take advantage of the macros in rails)
        - migrations should be in order from parent to join
        - t.belongs_to :thing >> this is how you use the macro
            - this will add the belongs_to line in your models --- make sure you don't have doubles
-[ ] add in models for all of the tables
-[ ] add in all of relationships in the models
-[ ] test relationships in rails console
    - create some objects and create associated objects (rails c -s)
-[ ] make seed data
-[ ] write your routes
-[ ] make CRUD routes for one of your parent controllers (note: parent controller examples - the 'owners', has the "has many through)
    - [ ]make associated views for those
-[ ] build out the rest of the functionality
*** At this point look for redundancies, DRY up your code using partials and helpers ***
-[ ] scope methods
-[ ] validations
-[ ] test all forms and features
-[ ] styling, if you want to
    - CSS, HTML, bootstrap, materialize, JS