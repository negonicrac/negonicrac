Date.prototype.toISO8601 = (date) ->
  pad = (amount, width) ->
    padding = ""
    while (padding.length < width - 1 && amount < Math.pow(10, width - padding.length - 1))
      padding += "0"
      padding + amount.toString()
    padding

  date = date ? date : new Date()
  offset = date.getTimezoneOffset()
  pad(date.getFullYear(), 4) \
  + "-" + pad(date.getMonth() + 1, 2) \
  + "-" + pad(date.getDate(), 2) \
  + "T" + pad(date.getHours(), 2) \
  + ":" + pad(date.getMinutes(), 2) \
  + ":" + pad(date.getUTCSeconds(), 2) \
  + (offset > 0 ? "-" : "+") \
  + pad(Math.floor(Math.abs(offset) / 60), 2) \
  + ":" + pad(Math.abs(offset) % 60, 2)
