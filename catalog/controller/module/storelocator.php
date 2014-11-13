<?php  
class ControllerModuleStorelocator extends Controller {
	protected function index() {
		$this->language->load('module/storelocator');
		$this->load->model('extension/storelocator');
		
		$data = array(
			'page' => 1,
			'limit' => 5,
			'start' => 0,
		);
	 
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$all_storelocator = $this->model_extension_storelocator->getAllStorelocator($data);
	 
		$this->data['all_storelocator'] = array();
	 
		foreach ($all_storelocator as $storelocator) {
			$this->data['all_storelocator'][] = array (
				'title' => $storelocator['title'],
				'description' => (strlen(strip_tags(html_entity_decode($storelocator['description']))) > 50 ? substr(strip_tags(html_entity_decode($storelocator['description'])), 0, 50) . '...' : strip_tags(html_entity_decode($storelocator['description']))),
				'view' => $this->url->link('information/storelocator/storelocator', 'storelocator_id=' . $storelocator['storelocator_id']),
				'date_added' => date('d M Y', strtotime($storelocator['date_added']))
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/storelocator.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/storelocator.tpl';
		} else {
			$this->template = 'default/template/module/storelocator.tpl'; 
		}
		
		$this->render();
	}
}
?>