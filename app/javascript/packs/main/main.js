//generate_year_range定義(21行目で使用このコードだとstartの値からendまで繰り返す)
function generate_year_range(start, end) {
  var years = "";
  for (var year = start; year <= end; year++) {
    years += "<option value='" + year + "'>" + year + "</option>";
  }
  return years;
}

//日付の取得
var today = new Date();
//月の取得
var currentMonth = today.getMonth();
//年の取得
var currentYear = today.getFullYear();
//()内と一致するに結果を返す(html39行目とか)
var selectYear = document.getElementById("year");
var selectMonth = document.getElementById("month");

//一番上参考
var createYear = generate_year_range(1970, 2200);

//createYearをhtmlに反映（html53行目）
document.getElementById("year").innerHTML = createYear;

//html32行目
var calendar = document.getElementById("calendar");
//calendarのdata-lengeの要素を表示
var lang = calendar.getAttribute('data-lang');

//月・曜日
var months = ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"];
var days = ["日", "月", "火", "水", "木", "金", "土"];

//<tr>は表の行部分のこと
//カレンダー１行目の曜日表示処理(html33行目)
var dayHeader = "<tr>";
for (day in days) {
  dayHeader += "<th data-days='" + days[day] + "'>" + days[day] + "</th>";
}
dayHeader += "</tr>";

document.getElementById("thead-month").innerHTML = dayHeader;

//一番上の月と年の表示(html26行目)
monthAndYear = document.getElementById("monthAndYear");
showCalendar(currentMonth, currentYear);//表示

//HTML29行目ボタンの処理（進む方）
function next() {
  currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;//月が11と等しい場合は年数+１
  currentMonth = (currentMonth + 1) % 12;//月を１進めて12の場合は1月に戻る
  showCalendar(currentMonth, currentYear);//表示
}

//HTML28行目ボタンの処理（戻る方）
function previous() {
  currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
  currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
  showCalendar(currentMonth, currentYear);
}

//html39.53行目月と年を選択して飛んでいく処理
function jump() {
  currentYear = parseInt(selectYear.value);
  currentMonth = parseInt(selectMonth.value);
  showCalendar(currentMonth, currentYear);
}

function showCalendar(month, year) {
 　
  var firstDay = (new Date(year, month)).getDay();　//曜日取得（０が日曜日１が月曜日…）

  //HTML34行目カレンダー２行目からの日付表示
  tbl = document.getElementById("calendar-body");

  tbl.innerHTML = "";

  monthAndYear.innerHTML = months[month] + " " + year;
  selectYear.value = year;
  selectMonth.value = month;
  var date = 1;
  for (var i = 0; i < 6; i++) {
    var row = document.createElement("tr");

    for (var j = 0; j < 7; j++) {
      if (i === 0 && j < firstDay) {
        cell = document.createElement("td");
        cellText = document.createTextNode("");
        cell.appendChild(cellText);
        row.appendChild(cell);
      } else if (date > daysInMonth(month, year)) {
        break;
      } else {
        cell = document.createElement("td");
        cell.setAttribute("data-date", date);
        cell.setAttribute("data-month", month + 1);
        cell.setAttribute("data-year", year);
        cell.setAttribute("data-month_name", months[month]);
        cell.className = "date-picker";
        cell.innerHTML = "<span>" + date + "</span>";

        if (date === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
          cell.className = "date-picker selected";
        }
        row.appendChild(cell);
        date++;
      }
    }

    tbl.appendChild(row);
  }

}

function daysInMonth(iMonth, iYear) {
  return 32 - new Date(iYear, iMonth, 32).getDate();
}