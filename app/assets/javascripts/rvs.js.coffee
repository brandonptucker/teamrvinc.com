# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

c = (r, n, p) ->
	(r * p) / (1 - Math.pow((1 + r), -n))

recalculatePayment = (price, years, interestRate) ->
	r = (interestRate / 12) / 100
	n = years * 12
	p = price
	c(r, n, p).toFixed(2)

$ ->
	$('input#price, input#years, input#interestRate').keyup ->
		
		if $(this)[0].checkValidity()
			$(this).parents('div.control-group').removeClass('error')
			$(this).next().text('')
		else 
			$(this).parents('div.control-group').addClass('error')
			$(this).next().text(this.validationMessage)

		if $('input#price')[0].checkValidity() && $('input#years')[0].checkValidity() && $('input#interestRate')[0].checkValidity()
			$('button#recalculate').prop('disabled', false)
		else 
			$('button#recalculate').prop('disabled', true)

	$('#recalculate').click ->
		payment = recalculatePayment($('#price').val(), $('#years').val(), $('#interestRate').val())
		if payment == 'Infinity' || payment == 'NaN'
			$('#payment').text('N/A')
		else
			$('#payment').text("$" + payment)