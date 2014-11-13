<?php
class ControllerExtensionStorelocator extends Controller {
	private $error = array();
	
	public function index() {
		$this->language->load('extension/storelocator');
		$this->load->model('extension/storelocator');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		if (isset($this->session->data['warning'])) {
			$this->data['error'] = $this->session->data['warning'];
		
			unset($this->session->data['warning']);
		} else {
			$this->data['error'] = '';
		}
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
			$url .= '&page=' . $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		$data = array(
			'page' => $page,
			'limit' => $this->config->get('config_admin_limit'),
			'start' => $this->config->get('config_admin_limit') * ($page - 1),
		);
		
		$total = $this->model_extension_storelocator->countStorelocator();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('extension/storelocator', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_date'] = $this->language->get('text_date');
		$this->data['text_action'] = $this->language->get('text_action');
		$this->data['text_edit'] = $this->language->get('text_edit');
		
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		
		$this->data['insert'] = $this->url->link('extension/storelocator/insert', '&token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('extension/storelocator/delete', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['allstorelocator'] = array();
		
		$allstorelocator = $this->model_extension_storelocator->getAllStorelocator($data);
		
		foreach ($allstorelocator as $storelocator) {
			$this->data['allstorelocator'][] = array (
				'storelocator_id' => $storelocator['storelocator_id'],
				'title' => $storelocator['title'],
				'date_added' => date('d M Y', strtotime($storelocator['date_added'])),
				'edit' => $this->url->link('extension/storelocator/edit', '&storelocator_id=' . $storelocator['storelocator_id'] . '&token=' . $this->session->data['token'], 'SSL')
			);
		}
		
		$this->template = 'extension/storelocator_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());		
	}
	
	public function edit() {
		$this->language->load('extension/storelocator');
		$this->load->model('extension/storelocator');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->session->data['warning'])) {
			$this->data['error'] = $this->session->data['warning'];
		
			unset($this->session->data['warning']);
		} else {
			$this->data['error'] = '';
		}
		
		if (!isset($this->request->get['storelocator_id'])) {
			$this->redirect($this->url->link('extension/storelocator', '&token=' . $this->session->data['token'], 'SSL'));
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_storelocator->editStorelocator($this->request->get['storelocator_id'], $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('extension/storelocator/edit', '&storelocator_id=' . $this->request->get['storelocator_id'] . '&token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/storelocator', '&token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];
		
		$this->form();
	}
	
	public function insert() {
		$this->language->load('extension/storelocator');
		$this->load->model('extension/storelocator');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->session->data['warning'])) {
			$this->data['error'] = $this->session->data['warning'];
		
			unset($this->session->data['warning']);
		} else {
			$this->data['error'] = '';
		}
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_extension_storelocator->addStorelocator($this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('extension/storelocator/insert', '&token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/storelocator', '&token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];
		
		$this->form();
	}
	
	private function form() {
		$this->language->load('extension/storelocator');
		$this->load->model('extension/storelocator');
		$this->load->model('localisation/language');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_phone'] = $this->language->get('text_phone');		
		$this->data['text_address'] = $this->language->get('text_address');				
		$this->data['text_status'] = $this->language->get('text_status');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['button_submit'] = $this->language->get('button_submit');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->get['storelocator_id'])) {
			$storelocator = $this->model_extension_storelocator->getStorelocator($this->request->get['storelocator_id']);
		} else {
			$storelocator = '';
		}
		
		if (isset($this->request->post['storelocator'])) {
			$this->data['storelocator'] = $this->request->post['storelocator'];
		} elseif (!empty($storelocator)) {
			$this->data['storelocator'] = $this->model_extension_storelocator->getStorelocator($this->request->get['storelocator_id']);
		} else {
			$this->data['storelocator'] = '';
		}
		
		if (isset($this->request->post['title'])) {
			$this->data['title'] = $this->request->post['title'];
		} elseif (!empty($storelocator)) {
			$this->data['title'] = $storelocator['title'];
		} else {
			$this->data['title'] = '';
		}
		
		if (isset($this->request->post['address'])) {
			$this->data['address'] = $this->request->post['address'];
		} elseif (!empty($storelocator)) {
			$this->data['address'] = $storelocator['address'];
		} else {
			$this->data['address'] = '';
		}
		
		if (isset($this->request->post['phone'])) {
			$this->data['phone'] = $this->request->post['phone'];
		} elseif (!empty($storelocator)) {
			$this->data['phone'] = $storelocator['phone'];
		} else {
			$this->data['phone'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($storelocator)) {
			$this->data['status'] = $storelocator['status'];
		} else {
			$this->data['status'] = '';
		}
		
		$this->template = 'extension/storelocator_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	public function delete() {
		$this->language->load('extension/storelocator');
		$this->load->model('extension/storelocator');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $id) {
				$this->model_extension_storelocator->deleteStorelocator($id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
		}
		
		$this->redirect($this->url->link('extension/storelocator', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	private function validateDelete() {
		if (!$this->user->hasPermission('modify', 'extension/storelocator')) {
			$this->error['warning'] = $this->language->get('error_permission');
			
			$this->session->data['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/storelocator')) {
			$this->error['warning'] = $this->language->get('error_permission');
			$this->session->data['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>