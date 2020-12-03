$(window).ready(function () {
    $("#close_index_footer").click(function () {
        $("#footer_gg").slideUp(500);
    });
    $("#zc_box_open1").click(function () {
        if ($("#zc_box_open1").attr("src") == "img/上箭头.png") {
            $("#zc_box_open1").attr("src", "img/下箭头.png");
            $("#zc_box_city").hide();
        } else {
            $("#zc_box_open1").attr("src", "img/上箭头.png");
            $("#zc_box_city").show();
            $("#zc_box_open2").attr("src", "img/下箭头.png");
            $("#zc_box_store").hide();
        }
    });
    $("#zc_box_open2").click(function () {
        if ($("#zc_box_open2").attr("src") == "img/上箭头.png") {
            $("#zc_box_open2").attr("src", "img/下箭头.png");
            $("#zc_box_store").hide();
        } else {
            $("#zc_box_open2").attr("src", "img/上箭头.png");
            $("#zc_box_store").show();
            $("#zc_box_open1").attr("src", "img/下箭头.png");
            $("#zc_box_city").hide();
        }
    });

    $("#zc_box_ipt_city").click(function () {
        $("#zc_box_open1").attr("src", "img/上箭头.png");
        $("#zc_box_city").show();
    });
    $("#zc_box_ipt_store").click(function () {
        $("#zc_box_open2").attr("src", "img/上箭头.png");
        $("#zc_box_store").show();
    });

    $("#zc_box_ipt_city").keyup(function () {
        if ($(this).val() != null && $(this).val() != "") {
            for (var i = 0; i < $("a[class='zc_box_city_a']").length; i++) {
                if ($("a[class='zc_box_city_a']").eq(i).attr("title").indexOf($("#zc_box_ipt_city").val()) != -1) {
                    $("a[class='zc_box_city_a']").eq(i).show();
                }else {
                    $("a[class='zc_box_city_a']").eq(i).hide();
                }
            }
        }else {
            $("a[class='zc_box_city_a']").show();
        }
    });
    $("#zc_box_ipt_store").keyup(function () {
        if ($(this).val() != null && $(this).val() != "") {
            for (var i = 0; i < $("a[class='zc_box_store_a']").length; i++) {
                if ($("a[class='zc_box_store_a']").eq(i).attr("title").indexOf($("#zc_box_ipt_store").val()) != -1) {
                    $("a[class='zc_box_store_a']").eq(i).show();
                }else {
                    $("a[class='zc_box_store_a']").eq(i).hide();
                }
            }
        }else {
            $("a[class='zc_box_store_a']").show();
        }
    });

    $("a[class='zc_box_city_a']").click(function () {
        $("#zc_box_ipt_city").val($(this).attr("title"));
        $("#zc_box_city").hide();
        $("#zc_box_open1").attr("src", "img/下箭头.png");
    });
    $("a[class='zc_box_store_a']").click(function () {
        $("#zc_box_ipt_store").val($(this).attr("title"));
        $("#zc_box_store").hide();
        $("#zc_box_open2").attr("src", "img/下箭头.png");
    });

    for (var i = 0; i < $("a[class='zc_box_city_a']").length; i++) {
        if ($("a[class='zc_box_city_a']").eq(i).text().length > 4) {
            $("a[class='zc_box_city_a']").eq(i).text($("a[class='zc_box_city_a']").eq(i).text().substring(0, 3) + "...");
        }
    }
    for (var i = 0; i < $("a[class='zc_box_store_a']").length; i++) {
        if ($("a[class='zc_box_store_a']").eq(i).text().length > 8) {
            $("a[class='zc_box_store_a']").eq(i).text($("a[class='zc_box_store_a']").eq(i).text().substring(0, 7) + "...");
        }
    }
});