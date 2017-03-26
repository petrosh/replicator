---
---
cbList = document.querySelectorAll '[type="checkbox"]'
head = document.querySelector 'head'

for cb in cbList
  cb.addEventListener 'click', (e) => zio e

zio = (e) ->
	if e.target.checked
		el = document.createElement 'link'
		el.rel = "stylesheet"
		el.href = e.target.value
		head.appendChild el
	else
		find = head.querySelector "link[href$='#{e.target.value}']"
		head.removeChild find
	return
