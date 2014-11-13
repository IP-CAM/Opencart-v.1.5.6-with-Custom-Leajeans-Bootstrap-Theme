<?php echo $header; ?>
<div id="content" class="row-fluid">
   <h1 class="hidden"><?php echo $heading_title; ?></h1>  
<style>
  #footer {
	bottom:-300px;
	position:relative;
	z-index:6;
  }
  .pin-map {
	  cursor:pointer
  }
</style>    
 <script type="text/javascript">        
      $(function(){      
      	$('.map-locator').perfectScrollbar();
        $('#test1').gmap3({
          map:{
            options:{
			  animation:google.maps.Animation.DROP,
			  center:[-6.4140133,106.829518],
			  //navigationControl: false,
			  //scrollwheel: false,
			  //streetViewControl: false,
              zoom: 6
            }
          },
          marker:{
            values:[
				<?php 
				$i=1;
				$c = count($all_storelocator_json); 
				foreach ($all_storelocator_json as $json){ $b = ($i !== $c) ? ',' : '';	?>
				 <?php echo '{address:"'.$json['address'].'",id:"'.$json['id'].'",data:"<div><strong>'.$json['title'].'</strong></div><div>'.$json['address'].'</div><div>'.$json['phone'].'</div>",options:{"icon":"catalog/view/theme/leajeans/image/img/pin-markers.png","animation":"google.maps.Animation.DROP"}}'.$b.''; ?>
				<?php
				$i++;
				}
				?>
            ],			
            options:{
              draggable: false
            },
            events:{
			  mouseover: function(marker, event, context){
                var map = $(this).gmap3("get"),
                  infowindow = $(this).gmap3({get:{name:"infowindow"}});				  
				$('.map-'+context.id).animate({marginTop:-2,opacity:0.8});
				if (infowindow){
                  infowindow.open(map, marker);
                  infowindow.setContent(context.data);
				  //map.panTo(markers.getPosition());				  
                } else {
                  $(this).gmap3({
                    infowindow:{
                      anchor:marker, 
                      options:{content: context.data}
                    }
                  });
                }
              },
              mouseout: function(marker, event, context){
                var infowindow = $(this).gmap3({get:{name:"infowindow"}});
				$('.map-'+context.id).animate({marginTop:8,opacity:1});
                if (infowindow){
                  infowindow.close();
                }
              },
			  click: function(marker, event, context){
				//markerSelected(context.id);
				marker.setAnimation(google.maps.Animation.BOUNCE);				
				setTimeout(function(){
					marker.setAnimation(null);
				},1500);
			  }
            }
          }
        });		

		setTimeout(function(){
			$('#test1').gmap3({
			  exec: {
				//tag:"green",				
				full:"true",
				all:"true",
				func: function(data){
					// data.object is the google.maps.Marker object
					//data.object.setIcon("http://maps.google.com/mapfiles/marker_green.png")
					//console.log(data.object.position);
					//console.log(data.object.position.R.B);
					//console.log(data.object);
					if (data.object.position !== null) {
					   $('.map-'+data.id)
						  .attr('rel',data.object.position.k +','+data.object.position.B)
						  .data("id", data.id).css({'cursor':'pointer'});

					}
				}
			  }
			});
		  }, 1000);
		  
		 $('.pin-map').on('click',function(){	
			var mark_id = $(this).data( "id" ); 

			if (typeof mark_id !== 'undefined') {
				var marking = $("#test1").gmap3({"get":{"id":mark_id, callback : function(marker) {
					marker.setAnimation(google.maps.Animation.DROP);
				}}});				
			}
			var latlong = $(this).attr('rel');
				if (typeof latlong !== 'undefined') {
					var a = latlong.split(/,/);
					var map = $("#test1").gmap3("get");
						map.setZoom(10);
						map.panTo(new google.maps.LatLng(a[0],a[1]));			
			}

			$('.pin-map').hover(function() {
				var mark_id = $(this).data( "id" ); 

				if (typeof mark_id !== 'undefined') {
					var marking = $("#test1").gmap3({"get":{"id":mark_id, callback : function(marker) {
						marker.setAnimation(google.maps.Animation.BOUNCE); stop();
					}}});				
				}

			 },	function() {
				var mark_id = $(this).data( "id" ); 

				if (typeof mark_id !== 'undefined') {
					var marking = $("#test1").gmap3({"get":{"id":mark_id, callback : function(marker) {
						marker.setAnimation(null);
					}}});				
				}
			 });
		 }); 		
      });
</script>
   <div id="test1" class="gmap3"></div>
   <div class="content-inside store-addres ui-draggable">
	   
	<button type="button" class="btn btn-sm close"><span class="glyphicon glyphicon-chevron-right"></span></button>
   <div class="map-locator">
	<!--button type="button" class="btn btn-lg close" data-dismiss="alert" aria-hidden="true">&times;</button-->	
	<div class="holder">		
		<ul class="list-unstyled clear">
		<?php foreach($all_storeregionlocator as $storeregionlocator) { ?>
			<li>
				<div class="row-fluid">
				<h4 class="head-box"><strong><?php echo $storeregionlocator['title']?></strong></h4>
				<ul style="width:100%;padding: 0 0 0 0px">
				<?php foreach ($storeregionlocator['locations'] as $locations) { ?>				
				<li style="width:80%;padding: 0 0 0 0px; margin: 0px 0 8px 0">
					<span class="pin-map pull-left map-<?php echo $locations['storelocator_id']; ?>"></span>
					<div class="col-lg-12 pull-right" style="width: 100%;padding: 0 0 0 0px;left:40px">
						<div><b><?php echo $locations['title']; ?> </b></div>
						<div><?php echo $locations['address']; ?> </div>
						<div><?php echo $locations['phone']; ?></div>
					</div>	
				</li>	
				<?php } ?>
				</ul>
				</div>
			</li>	
		<?php } ?>
		</ul>
	</div>	
	</div>
   </div> 
</div>
<script type="text/javascript">
$(document).ready(function() {
  var bodyHeight = $("body").height();
  var vwptHeight = $(window).height();
  if (vwptHeight > bodyHeight) {
    // $("#footer").css("position","absolute").css("bottom",0);
    // $("#gmap").css("height",bodyHeight);
  }
});
</script> 
<?php echo $footer; ?>

