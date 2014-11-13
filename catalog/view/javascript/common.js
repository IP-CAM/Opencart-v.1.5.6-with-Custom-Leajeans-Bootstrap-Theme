$(window).load(function() {
	var $container = $('#entry-listing');      
	if ($container.isotope) {
		$container.isotope({
		  animationOptions: {
			  duration: 550,
			  layoutMode: 'fitRows',
			  easing: 'linear',
			  queue: false
		  },
		  itemSelector: 'div.entry'
		});
	}     
});
$(document).ready(function() {
	/** Lea Jeans **/
	$('.carousel-top').carousel({
		interval: 5000
	});
	$('.pin-map').hover(function(){
		$(this).animate({marginTop:-2,opacity:0.8});
	},function(){
		$(this).animate({marginTop:8,opacity:1});
	});
	$(".store-addres").draggable({
		handle: ".list-unstyled"
	});			  
	$('.close').toggle(function(){
		//$(this).find('span').toggleClass('glyphicon-chevron-right');
		$(this).find('span').attr('class','glyphicon glyphicon-chevron-down');
		$(this).parent().animate({height:'55',width:'50px'})
				.find('.map-locator')
				.attr('style','height:40px;');
	},function(){		
		//$(this).find('span').addClass('glyphicon-chevron-down');
		$(this).find('span').attr('class','glyphicon glyphicon-chevron-right');		
		$(this).parent().animate({height:'300',width:'61%'})
				.find('.map-locator')
				.attr('style','height:278px;');
	});	
	$('#featured .carousel-bot').carousel({
		interval: 6000
	});
	$('#latest .carousel-bot').carousel({
		interval: 8000
	});
	
	$("#featured, #latest").on({
		mouseenter: function(){
			$(this).find('.carousel-caption').delay(100).show('fast').animate({bottom:85});
			$(this).find('.carousel-indicators').delay(200).show('fast').animate({bottom:-60});
			$(this).find('.carousel-control.left').delay(300).animate({left:-30});
			$(this).find('.carousel-control.right').delay(400).animate({right:-42});
		},
		mouseleave: function(){
			$(this).find('.carousel-caption').delay(400).animate({bottom:-55}).hide('fast');
			$(this).find('.carousel-indicators').delay(300).animate({bottom:-30}).hide('fast');
			$(this).find('.carousel-control.left').delay(200).animate({left:5});			
			$(this).find('.carousel-control.right').delay(100).animate({right:5});
		}
	});	

	$('.carousel-top').on('slide.bs.carousel', function () {		
//		$(this).fadeOut(250).fadeIn(250);
//		$(this).find('.carousel-caption h1').hide(300).delay(300).show(600);
//		$(this).parent().find('.carousel-caption').show('slow');
	});
	
	$(".carousel-top").on({
		mouseenter: function(){
//			$(this).find('.carousel-caption').delay(100).show('fast').animate({bottom:85});
		},
		mouseleave: function(){
//			$(this).find('.carousel-caption').delay(400).animate({bottom:-55}).hide('fast');
		}
	});	
	
	/* Search */
	$('.button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var search = $('input[name=\'search\']').attr('value');
		
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		
		location = url;
	});
	
	$('#search input[name=\'search\'], #header input[name=\'search\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var search = $('input[name=\'search\']').attr('value');
			
			if (search) {
				url += '&search=' + encodeURIComponent(search);
			}
			
			location = url;
		}
	});
	
	/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart').live('mouseleave', function() {
			$(this).removeClass('active');
		});
	});
	
	/* Mega Menu */
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// IE6 & IE7 Fixes
	if ($.browser.msie) {
		if ($.browser.version <= 6) {
			$('#column-left + #column-right + #content, #column-left + #content').css('margin-left', '195px');
			
			$('#column-right + #content').css('margin-right', '195px');
		
			$('.box-category ul li a.active + ul').css('display', 'block');	
		}
		
		if ($.browser.version <= 7) {
			$('#menu > ul > li').bind('mouseover', function() {
				$(this).addClass('active');
			});
				
			$('#menu > ul > li').bind('mouseout', function() {
				$(this).removeClass('active');
			});	
		}
	}
	
	$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
	});	
});

function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}