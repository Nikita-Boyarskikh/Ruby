"use strict";

$(document).ready(function () {
  function on_mouse_over() {
    $(this).css("background-color", "red");
  }
  function on_mouse_leave() {
    $(this).css("background-color", "white");
  }
  function update() {
    let $elems = $(".cost");
    $elems.mouseover(on_mouse_over);
    $elems.mouseleave(on_mouse_leave);
  }

  $("#market div.tbody div.tr").draggable({
    connectToSortable: "#basket div.tbody",
    helper: "clone",
    stop: update
  });
  $("#basket div.tbody").sortable();

  $("#add").click(function () {
    let $title = $("#one_title");
    let $cost  = $("#one_cost");
    let title  = $title.val();
    let cost   = $cost.val();

    let errors = [];
    if (!title) {
      err_msg = "You forget to type title of an item";
      $title.notify(err_msg, {position: "top"});
      errors.push(err_msg);
    }
    if (!parseInt(cost)) {
      err_msg = "Cost is not a number";
      $cost.notify(err_msg, {position: "top"});
      errors.push(err_msg);
    }
    if (errors.length > 0) {
      for (i in errors) {
        console.error(errors[i]);
      }
    } else {

      $("#basket div.tbody").append(
        "<div class="tr">" +
          "<div class="td">" + title +
          "</div>" +
          "<div class="td cost">" + cost +
          "</div>" +
        "</div>"
      );

      console.log("Added new item "" + title + "" with cost=" + cost);

      update();
    }
  });

  $("#calc_summary").click(function () {
    let summary = 0;

    try {
      summary = $("#basket div.cost").get().reduce(function (sum, cur) {
        cost = parseInt(cur.innerText);
        if(!cost) throw new Error("Cost is not a number");
        return sum + cost;
      }, 0);
      console.log("Summary = " + summary);
    } catch(e) {
      $.notify(e.message);
      console.error(e.message);
      summary = "Невозможно рассчитать итоговую стоимость.";
    }

    $("#summary").text(summary);
  });

  update();
});
