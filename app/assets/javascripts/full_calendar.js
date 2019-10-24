var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev',
        center: 'title',
        right: 'next'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      duration: { days: 4 },
      events: '/events',

      select: function(start, end) {
         var group_id = $("#calendar").data("group-id");
        $.getScript('/events/new?group_id=' + group_id, function() {});

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = {
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },

      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {});
      }
    });
  })
};

$(document).ready(function(){
  initialize_calendar();
});
