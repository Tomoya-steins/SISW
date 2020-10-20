import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";
import listPlugin from "@fullcalendar/list";
import "bootstrap/dist/css/bootstrap.css";
import "@fortawesome/fontawesome-free/css/all.css";
import bootstrapPlugin from "@fullcalendar/bootstrap";
import timeGridPlugin from "@fullcalendar/timegrid";

document.addEventListener("turbolinks:load", function () {
  var calendarEl = document.getElementById("calendar");

  var calendar = new Calendar(calendarEl, {
    plugins: [
      dayGridPlugin,
      interactionPlugin,
      listPlugin,
      bootstrapPlugin,
      timeGridPlugin,
    ],
    themeSystem: "bootstrap",
    initialView: "listWeek",
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth,timeGridWeek,timeGridDay,listWeek",
    },

    buttonText: {
      prev: "前",
      next: "次",
      prevYear: "前年",
      nextYear: "翌年",
      today: "今日",
      month: "月",
      week: "週",
      day: "日",
      list: "リスト",
    },
    buttonIcons: {
      close: "fa-times",
      prev: "fa-chevron-left",
      next: "fa-chevron-right",
      prevYear: "fa-angle-double-left",
      nextYear: "fa-angle-double-right",
    },

    navLinks: true,
    editable: true,
    dayMaxEvents: true,
    // defaultTimedEventDuration: "03:00:00",
    // timeFormat: "HH:mm",
    // eventColor: "#63ceef",
    // eventTextColor: "#0000000",

    events: "/events.json",
  });

  calendar.render();
});
