---
permalink: /code
layout: default
---
```cs
cbList = document.querySelectorAll '[type="checkbox"]'
head = document.querySelector 'head'
codeCss = document.getElementById 'code-css'

for cb in cbList
  cb.addEventListener 'click', (e) => zio e

zio = (e) ->
	code = document.querySelector("section [data-file='#{e.target.value}']")
	if e.target.checked
		el = document.createElement 'link'
		el.rel = "stylesheet"
		el.href = e.target.value
		head.appendChild el
		if code then code.removeAttribute 'hidden'
	else
		find = head.querySelector "link[href$='#{e.target.value}']"
		head.removeChild find
		if code then code.setAttribute 'hidden', ''
	return
```
