# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

![Build Status](https://codeship.com/projects/b0175f50-0761-0135-c695-4619059f53e8/status?branch=master)
![Code Climate](https://codeclimate.com/github/MichaelA59/VenView.png)
[![Coverage Status](https://coveralls.io/repos/github/MichaelA59/VenView/badge.svg?branch=master)](https://coveralls.io/github/MichaelA59/VenView?branch=master)
Ruby version: 2.3.3.

To start, run `bundle install`.




<div class="row">
  <!-- Top banner dispay of UserName/Avatar/Email -->
  <h1 class='small-12 medium-4 columns text-left'> <%= @user.first_name %> <%= @user.last_name %> </h1>
  <% if @user.avatar_url %>
    <img src= "<%= @user.avatar_url %> class='small-12 medium-4 columns text-center'" />
  <% end %>
  <h1 class='small-12 medium-4 columns text-right profile-email'> <%= @user.email %> </h1>
</div>

<!-- ADMIN CONTROLS - - Edit | Delete Profile -->
<div class="row">
  <% if !current_user.admin? %>
    <div class="columns small-2">
      <%= link_to 'Edit Profile', edit_user_path(@user), class: 'profile-button button' %></br>
    </div>
  <% end %>

    <% if !current_user.admin? %>
      <div class="columns small-2">
        <%= link_to "Delete Account", user_registration_path, :method => :delete, class: 'profile-button button' %>
      </div>
    <% end %>

    <% if current_user.admin? %>
      <div class="columns small-2">
        <%= link_to "Delete Account", user_path, :method => :delete, class: 'profile-button button' %>
      </div>
    <% end %>
  </div>

<% if @reviews.size > 0 %>

  <!-- Users Review Header -->
  <div class="row">
    <br/>
    <h3 class='small-12 columns text-left'>My Reviews</h3>
    <div class='small-12 columns'>
      <hr/>
    </div>
  </div>

  <!-- List of all reviews tied to this user -->
  <% @reviews.each do |review| %>
    <div class="row">
      <div class="small-1 columns">
        <strong>Votes:</strong>
        <% total_upvotes = Vote.where({ review_id: review.id, up_or_down: "upvote" }).size %>
        <% total_downvotes = Vote.where({ review_id: review.id, up_or_down: "downvote" }).size %>
        <%= total_upvotes - total_downvotes %>
      </div>

      <!-- Listing of Review Title and Date Created -->
      <div class="columns small-6">
        <p>
          <span class='review-title'><%= review.title %></span><br />
          <span class='review-timestamp'><%= review.created_at.strftime("%B %d %Y") %></span><br />
          <% if review.cost %>
            <span class='review-radio'>Cost:</span>   <span class='review-radio-content'><%= review.cost %></span><br />
          <% end %>
          <% if review.sound_quality %>
            <span class='review-radio'>Sound:</span> <span class='review-radio-content'><%= review.sound_quality %></span><br/>
          <% end %>
          <% if review.parking %>
            <span class='review-radio'>Parking</span> <span class='review-radio-content'><%= review.parking %></span><br />
          <% end %>
          <%= review.body %>
        </p>
      </div>

      <!-- Edit and Delete Buttons (Edit is only for ADMIN) -->
      <% if !current_user.admin? %>
        <div class="columns small-2 float-right">
          <%= link_to 'Edit Review', edit_review_path(review), class: 'button'  %>
        </div>
      <% end %>
        <div class="columns small-2 float-left">
          <%= link_to 'Delete Review', review_path(review), method: :delete, class: 'button'  %>
        </div>
    </div>
  <% end %>
<% end %>
