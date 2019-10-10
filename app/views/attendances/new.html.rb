<%=form_for([@group, @content], validate: true ) do |f| %>

<%= image_tag( "ava.jpg", alt: "Rails", class: "background-image-content" )%>
<%= current_user.fullname %>

<%=f.submit class: 'btn btn-primary btn-large' %>
