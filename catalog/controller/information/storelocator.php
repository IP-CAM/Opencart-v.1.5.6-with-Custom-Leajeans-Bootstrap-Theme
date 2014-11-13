<?php
class ControllerInformationStorelocator extends Controller {
 
	public function index() {
		$this->language->load('information/storelocator');
		$this->load->model('extension/storelocator');
		$this->load->model('extension/storeregion');
	 
	 
		$this->document->setTitle($this->language->get('heading_title')); 					
				
		$this->document->addScript('http://maps.googleapis.com/maps/api/js?sensor=false');		
	 	$this->document->addScript('catalog/view/javascript/gmap3v5.1.1/gmap3.min.js');	
		$this->document->addStyle('catalog/view/theme/leajeans/stylesheet/perfect-scrollbar-0.4.9.min.css');
		$this->document->addScript('catalog/view/javascript/jquery/perfect-scrollbar-0.4.9.min.js');	
		
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/storelocator'),
			'separator' => $this->language->get('text_separator')
		);
		  
		$url = '';
			
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
			$url .= '&page=' . $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$data = array(
			'page' => $page,
			'limit' => 1000,
			'start' => 10 * ($page - 1),
		);
		
		$total = $this->model_extension_storelocator->countStorelocator();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 1000;
		//$pagination->links = "nextpage";
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('information/storelocator', $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();
	 
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_phone'] = $this->language->get('text_phone');		
		$this->data['text_date'] = $this->language->get('text_date');
		$this->data['text_view'] = $this->language->get('text_view');
	 
		$all_storeregion = $this->model_extension_storeregion->getAllStoreregion(0);

		$this->data['all_storeregionlocator'] = array();
			
		foreach($all_storeregion as $storeregion) {
			$this->data['all_storeregionlocator'][] = array (
				'title' => $storeregion['title'],
				'id' => $storeregion['storeregion_id'],	
				'date_added' => date('d M Y', strtotime($storeregion['date_added'])),
				'locations' => $this->model_extension_storelocator->getStoreregion($storeregion['storeregion_id'])
			);			
		}
	
		$all_storelocator = $this->model_extension_storelocator->getAllStorelocator($data);
	 
		$all_storelocator_json = $all_storelocator;
		
		$this->data['all_storelocator'] = array();
		
		foreach ($all_storelocator as $storelocator) {		
			$this->data['all_storelocator'][] = array (
				'title' => $storelocator['title'],												
				'address' => $storelocator['address'],		
				'phone' => $storelocator['phone'],	
				'id' => $storelocator['storelocator_id'],	
				'view' => $this->url->link('information/storelocator/storelocator', 'storelocator_id=' . $storelocator['storelocator_id']),
				'date_added' => date('d M Y', strtotime($storelocator['date_added']))
			);
		}
		
		foreach ($all_storelocator_json as $storelocator_json) {		
			$this->data['all_storelocator_json'][] = array (
				'title' => $storelocator_json['title'],		
				'id' => $storelocator_json['storelocator_id'],						
				'address' => $storelocator_json['address'],						
				'phone' => $storelocator_json['phone']
			);
		}
	
		//$this->data['all_storelocator_json'] = $this->data['all_storelocator_json'];
		
		//print_r($this->data['all_storelocator_json'] );
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/storelocator_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/storelocator_list.tpl';
		} else {
			$this->template = 'default/template/information/storelocator_list.tpl'; 
		}
	 
		$this->children = array(
			'common/column_left', 
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer', 
			'common/header'
		);
	 
		$this->response->setOutput($this->render());
	}
 
   public function storelocator() {
      $this->load->model('extension/storelocator');
      $this->language->load('information/storelocator');
 
      if (isset($this->request->get['storelocator_id']) && !empty($this->request->get['storelocator_id'])) {
         $storelocator_id = $this->request->get['storelocator_id'];
      } else {
         $storelocator_id = 0;
      }
 
      $storelocator = $this->model_extension_storelocator->getStorelocator($storelocator_id);
	  
	  $this->data['storelocator_link'] = $this->url->link('information/storelocator');
	  $this->data['text_link'] = $this->language->get('link_title');
	  
      $this->data['breadcrumbs'] = array();
      $this->data['breadcrumbs'][] = array(
         'text' => $this->language->get('text_home'),
         'href' => $this->url->link('common/home'),
         'separator' => false
      );
      $this->data['breadcrumbs'][] = array(
         'text' => $this->language->get('heading_title'),
         'href' => $this->url->link('information/storelocator'),
         'separator' => $this->language->get('text_separator')
      );
 
      if ($storelocator) {
         $this->data['breadcrumbs'][] = array(
            'text' => $storelocator['title'],
            'href' => $this->url->link('information/storelocator/storelocator', 'storelocator_id=' . $storelocator_id),
            'separator' => $this->language->get('text_separator')
         );
 
         $this->document->setTitle($storelocator['title']);
 
         $this->data['heading_title'] = $storelocator['title'];
         $this->data['description'] = html_entity_decode($storelocator['description']);		 
         $this->data['date_added']	= date('d M Y', strtotime($storelocator['date_added']));
         $this->data['description'] = html_entity_decode($storelocator['description']);
 
         if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/static.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/information/static.tpl';
         } else {
            $this->template = 'default/template/information/static.tpl';
         }
 
         $this->children = array(
         'common/column_left',
         'common/column_right',
         'common/content_top',
         'common/content_bottom',
         'common/footer',
         'common/header'
         );
 
         $this->response->setOutput($this->render());
      } else {
         $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_error'),
            'href' => $this->url->link('information/storelocator', 'storelocator_id=' . $storelocator_id),
            'separator' => $this->language->get('text_separator')
         );
 
         $this->document->setTitle($this->language->get('text_error'));
 
         $this->data['heading_title'] = $this->language->get('text_error');
         $this->data['text_error'] = $this->language->get('text_error');
         $this->data['button_continue'] = $this->language->get('button_continue');
         $this->data['continue'] = $this->url->link('common/home');
 
         if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
         } else {
            $this->template = 'default/template/error/not_found.tpl';
         }
 
         $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
         );
 
         $this->response->setOutput($this->render());
      }
   }
}
?>