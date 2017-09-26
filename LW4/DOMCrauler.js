"use strict";

const RATIO = 10;

$(document).ready(function() {
    $("#build_dom_tree").click(function() {
        $(this).remove();
        console.log("Start building DOM-tree");
        let $result = $("#dom_structure");
        let res = print_tree();
        $result.html(res.join("<br>"));
        console.log("Finish building DOM-tree");
    });

    let buffer = [];
    function tab(level) {
        if (buffer[level]) {
          return buffer[level];
        }

        let i, res = [];
        for (i = 0; i < level * RATIO; i++) res.push("&nbsp;");

        return buffer[level] = res.join("");
    }

    function print_tree(root = $(document), level = 0) {
        let cur = root.children(":first");
        let res = [];
        while (cur.length > 0) {
            console.log("View elem (" + cur.prop("tagName") + ")");
            res.push(tab(level) + "&lt;" + cur.prop("tagName") + "&gt;");
            res = res.concat(print_tree(cur, level + 1));
            res.push(tab(level) + "&lt;/" + cur.prop("tagName") + "&gt;");
            console.log("End view elem (" + cur.prop("tagName") + ")");
            cur = cur.next();
        }
        return res;
    }
});
