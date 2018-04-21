// 対象のシート
var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheets()[2]

// 曜日マスタ
var dow = ['日', '月', '火', '水', '木', '金', '土'];

/**
 * 数値を2桁で0埋めして戻す
 */
function padding(num) {
  return ('00' + num).slice(-2)
}

/**
 * 現在時刻をhh:mmの形式で取得する
 */
function formattedCurrentTime() {
  var now = new Date()
  return now.getHours() + ':' + padding(now.getMinutes())
}

/**
 * 本日の出勤時刻を記入する
 */
function setStartTime() {
  var day = new Date().getDate()
  sheet.getRange(13 + day, 5).setValue(formattedCurrentTime())
}

/**
 * 本日の退勤時刻を記入する
 * ついでに休憩時刻も入力する。基本的に1時間で固定
 */
function setEndTime() {
  var day = new Date().getDate()
  sheet.getRange(13 + day, 6).setValue(formattedCurrentTime())
  sheet.getRange(13 + day, 7).setValue('1:00')
}

/**
 * 月の列を今月で初期化
 */
function setMonthRow() {
  var month = new Date().getMonth() + 1
  sheet.getRange(14, 2, 31).setValue(month)
  sheet.getRange(4, 7).setValue(month + '月度')
}

/**
 * 日の列を初期化
 */
function setDayRow() {
  for (var i = 0; i < 31; i++) {
    var daysCell = sheet.getRange(14 + i, 3)
    daysCell.setValue(i + 1)
  }
}

/**
 * 曜日の列を今月で初期化
 */
function setDowRow() {
  var firstDayDow = new Date(new Date().setDate(1)).getDay()
  for (var i =0; i < 31; i++) {
    var dowCell = sheet.getRange(14 + i, 4)
    dowCell.setValue(dow[firstDayDow + i % 7])
  }
}

/**
 * その他入力事項の初期化
 */
function setOtherInfo() {
  var currentMonth = new Date().getMonth() + 1
  sheet.getRange(4, 7).setValue(new Date().getMonth() + '月度');
}

/**
 * 勤務時間列を全てクリア
 */
function clearTimeCells() {
  sheet.getRange(14, 5, 31, 3).clearContent()
  sheet.getRange(14, 8, 31, 4).clearContent()
}

/**
 * フォーム全体を今月で初期化する
 */
function reset() {
  if (Browser.msgBox('シートの初期化', '実行していいですか？', Browser.Buttons.OK_CANCEL) === 'cancel') {
    return;
  }
  setMonthRow()
  setDayRow()
  setDowRow()
  clearTimeCells()
}
