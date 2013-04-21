jQuery(function () {
    var b = new Date;
    var e = b.getFullYear() + 1 + "/" + (b.getMonth() + 1) + "/" + b.getDate() + " " + b.getHours() + ":" + b.getMinutes() + ":" + b.getSeconds();
    b = -b.getTimezoneOffset() / 60;
    $('#.count').jCountdown({ timeText: e, timeZone: b, style: "flip", color: "black", width: 0, textGroupSpace: 15, textSpace: 0, reflection: !0, reflectionOpacity: 10, reflectionBlur: 0, dayTextNumber: 3, displayDay: !0, displayHour: !0, displayMinute: !0, displaySecond: !0, displayLabel: !0 });
});