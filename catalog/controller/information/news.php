<?php
class ControllerInformationNews extends Controller {
 
	public function index() {
		$this->language->load('information/news');
		$this->load->model('extension/news');
	 
		$this->document->setTitle($this->language->get('heading_title')); 
		
		$this->document->addScript('catalog/view/javascript/jquery/jquery.ias.min.js');		
	 	$this->document->addScript('catalog/view/javascript/jquery/jquery.isotope.js');			
		
	 
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home'),
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/news'),
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
			'limit' => 10,
			'start' => 10 * ($page - 1),
		);
		
		$total = $this->model_extension_news->countNews();
		
		$pagination = new Pagination();
		$pagination->total = $total;
		$pagination->page = $page;
		$pagination->limit = 10;
		//$pagination->links = "nextpage";
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('information/news', $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();
	 
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_title'] = $this->language->get('text_title');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_date'] = $this->language->get('text_date');
		$this->data['text_view'] = $this->language->get('text_view');
		$this->data['text_share'] = $this->language->get('text_share');
	 
		$all_news = $this->model_extension_news->getAllNews($data);
	 
		$this->data['all_news'] = array();
	 
		$image = '';
		foreach ($all_news as $news) {
			preg_match_all('/<img[^>]+>/i',html_entity_decode($news['description']), $images);
			$image = $images[0];
						
			preg_match_all('#<iframe(.*?)></iframe>#is',html_entity_decode($news['description']), $videos);
			$videos = $videos[0];
			
			$cover = '';
			
			if (!empty($image)){
				$cover = '<div class="img-news img-thumbnail">';
				$cover .= '<a href="'.$this->url->link('information/news/news', 'news_id=' . $news['news_id']).'" title="'.$news['title'].'">';
			    $cover .= $image[0];
		        $cover .= '</a>';
				$cover .= '</div>';
			} else if(!empty($videos)) {
				$cover = '<div class="format-video"><div id="player" class="player">';
				$cover .= $videos[0];
				$cover .= '</div></div>';
			}

			$this->data['all_news'][] = array (
				'title' => $news['title'],												
				'cover' => $cover,
				'description' => (strlen(strip_tags(html_entity_decode($news['description']),"\n\r\x00..\x1F&nbsp;")) > 300 ? substr(strip_tags(html_entity_decode($news['description'])), 0, 140) . '...' : strip_tags(html_entity_decode($news['description']))),
				'view' => $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' => date('d M Y', strtotime($news['date_added']))
			);
		}
	 
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/news_list.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/news_list.tpl';
		} else {
			$this->template = 'default/template/information/news_list.tpl'; 
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
 
   public function news() {
      $this->load->model('extension/news');
      $this->language->load('information/news');
 
      if (isset($this->request->get['news_id']) && !empty($this->request->get['news_id'])) {
         $news_id = $this->request->get['news_id'];
      } else {
         $news_id = 0;
      }
 
      $news = $this->model_extension_news->getNews($news_id);
	  
	  $this->data['news_link'] = $this->url->link('information/news');
	  $this->data['text_link'] = $this->language->get('link_title');
	  $this->data['text_share'] = $this->language->get('text_share');
	  
      $this->data['breadcrumbs'] = array();
      $this->data['breadcrumbs'][] = array(
         'text' => $this->language->get('text_home'),
         'href' => $this->url->link('common/home'),
         'separator' => false
      );
      $this->data['breadcrumbs'][] = array(
         'text' => $this->language->get('heading_title'),
         'href' => $this->url->link('information/news'),
         'separator' => $this->language->get('text_separator')
      );
 
      if ($news) {
         $this->data['breadcrumbs'][] = array(
            'text' => $news['title'],
            'href' => $this->url->link('information/news/news', 'news_id=' . $news_id),
            'separator' => $this->language->get('text_separator')
         );
 
         $this->document->setTitle($news['title']);
 
         $this->data['heading_title'] = $news['title'];
         $this->data['description'] = html_entity_decode($news['description']);		 
		 	
			$gallery	= '';
			$videos		= '';
			
			preg_match_all('/<iframe[^>]*?>.*?<\/iframe>/si',html_entity_decode($news['description']), $_videos);
			
			if (!empty($_videos[0])) {
				$videos = '<div class="row-fluid">';			
				foreach ($_videos as $video => $val) {
					$videos .='<div class="video-iframe player">';
					$videos .= implode('</div><div class="video-iframe player">', $val);
					$videos .='</div>';
				}				
				$videos .= '</div>';			
			} else if (count($_videos[0]) == 1) {
				$videos = '<div class="video-iframe player">'.$_videos[0].'</div>';
			}
			
			preg_match_all('/<img[^>]+>/i',html_entity_decode($news['description']), $images);
			$image = $images[0];
			
			/***** uncomment this after get the right video gallery
			if(count($videos) > 1 && !empty($videos)) { 
				$gallery .= '<div class="head-gallery"><div class="video-iframe" id="player">';
				$j=0;
				foreach ($videos as $vid) {
					$active = ($j == 0) ? 'active' : '';
					$gallery .= '<div class="'.$active.'">';
					$gallery .= $vid;
					$gallery .= '</div>';
					$j++;
				}
				$gallery .= '</div></div>';
			} else if (count($videos) == 1) {
				$gallery .= '<div class="video-iframe text-center">'.$videos[0].'</div>';
			}
			*/
			
			if(count($image) > 1 && !empty($image)) {
				$gallery .= '<div class="head-gallery"><div data-ride="carousel" class="carousel carousel-fade slide" id="carousel-gallery">';
				$gallery .= '<div class="carousel-inner">';
				$i=0;
				foreach ($image as $img) {
					$active = ($i == 0) ? 'active' : '';
					$gallery .= '<div class="item '.$active.'">';
					$gallery .= preg_replace('/style="(.*)"+/', 'class="img-thumbnail"', $img);
					//$gallery .= $img;
					
					$gallery .= '</div>';
					$i++;
				}
				$gallery .= '</div>';
				$gallery .= '<a data-slide="prev" href="#carousel-gallery" class="left carousel-control">
							  <span class="glyphicon glyphicon-chevron-left"></span></a>
							<a data-slide="next" href="#carousel-gallery" class="right carousel-control">
							  <span class="glyphicon glyphicon-chevron-right"></span></a>';
				$gallery .= '</div></div>';
			} else if (count($image) == 1) {
				$gallery .= '<div class="text-center">'.preg_replace('/style="(.*)"+/', 'class="img-thumbnail"', $image[0]).'</div>';
			}
						
         $this->data['date_added']	= date('d M Y', strtotime($news['date_added']));
         $this->data['description'] = strip_tags(html_entity_decode($news['description']),'<p><strong><div><ul><li><ol><b><br><span>');
		 $this->data['gallery']		= $gallery;
		 $this->data['videos']		= $videos;
 
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
            'href' => $this->url->link('information/news', 'news_id=' . $news_id),
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