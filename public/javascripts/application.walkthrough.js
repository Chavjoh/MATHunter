$(document).ready(function() {
	$('#walkthrough').pagewalkthrough({
		steps:
		[
			{
				wrapper: '',
				margin: '0',
				popup:
				{
					content: '#type-modal',
					type: 'modal',
					offsetHorizontal: 0,
					offsetVertical: 0,
					width: '600'
				}        
			},
			{
				wrapper: '',
				margin: '0',
				popup:
				{
					content: '#type-tooltip',
					type: 'modal',
					offsetHorizontal: 0,
					offsetVertical: 0,
					width: '600'
				}     
			},
			{
				wrapper: '#navigation_menu',
				margin: '0',
				popup:
				{
					content: '#type-tooltip-bottom',
					type: 'tooltip',
					position: 'bottom',
					offsetHorizontal: 0,
					offsetVertical: 0,
					width: '600'
				}                
			},
			{
				wrapper: '',
				margin: '0',
				popup:
				{
					content: '#type-tooltip-top',
					type: 'modal',
					offsetHorizontal: 0,
					offsetVertical: 0,
					width: '600'
				}                
			},
			{
				wrapper: '',
				margin: '0',
				popup:
				{
					content: '#done-walkthrough',
					type: 'modal',
					position: '',
					offsetHorizontal: 0,
					offsetVertical: 0,
					width: '600'
				}             
			},
		],
		name: 'walkthrough',
		onLoad: true,
		onClose: function() {
			$('.main-menu ul li a#open-walkthrough').removeClass('active');
			return true;
		},
	});

	/**************\
	 * NAVIGATION *
	\**************/

	$('.main-menu ul li a').each(function() {
		$('.main-menu ul li').find('a.active').removeClass('active');
		
		$(document).on('click', this, function() {
		$(this).addClass('active');
		
		var id = $(this).attr('id').split('-');

		if(id == 'parameters') return;

		$.pagewalkthrough('show', id[1]); 
		});
	});


	$(document).on('click', '.prev-step', function(e){
		$.pagewalkthrough('prev',e);
	});

	$(document).on('click', '.next-step', function(e){
		$.pagewalkthrough('next',e);
	});

	$(document).on('click', '.restart-step', function(e){
		$.pagewalkthrough('restart',e);
	});

	$(document).on('click', '.close-step', function(e){
		$.pagewalkthrough('close');
	});
});