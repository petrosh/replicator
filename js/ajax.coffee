---
---
# DOM is ready (defer)
console.log $().jquery

request = $.ajax 'https://api.github.com/users/petrosh/starred',
	type: 'get',
	dataType: 'json',
	headers: {"Accept": "application/vnd.github.mercy-preview+json"},
	error: (jqXHR, textStatus, errorThrown) ->
		$('#out').append "AJAX Error: #{textStatus}"
	success: (data, textStatus, jqXHR) ->
		for page in jqXHR.getResponseHeader('link').split(', ').reverse()
			$('<a>',{
				text: /rel="(.*?)"/g.exec(page.split('; ')[1])[1] +
					/page=(.*?)>/g.exec(page.split('; ')[0])[1],
				title: 'Blah',
				href: /<(.*?)>/g.exec(page.split('; ')[0])[1],
				click: ->
					return false
			}).appendTo '#out'
			# console.log link,page,text

# $.when(request).then((data, textStatus, jqXHR) ->
# 	$('#out').append "Successful AJAX call: #{textStatus}<br>Link header: " + request.getResponseHeader('link')
# )
