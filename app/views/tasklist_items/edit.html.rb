<%= form_for [@tasklist, @tasklist_item] do |form| %>

  <% if @tasklist_item.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@tasklist_item.errors.count, "error") %> prohibited this tasklist item from being saved:</h2>

      <ul>
      <% @tasklist_item.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

	<%= form.label :content %>
	<%= form.text_field :content %>

	<%= form.submit "Save" %>

<% end %>