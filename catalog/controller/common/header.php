<?php
class ControllerCommonHeader extends Controller {
	public function index($registerView = False) {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['customer']=["name" => $this->customer->getFirstName()." ".$this->customer->getLastName() ,"email" => $this->customer->getEmail(),"created_at"=>$this->customer->getCreated()];

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register_button'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		//Texts Customized
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_company_description'] = $this->language->get('text_company_description');
		$data['text_client_service'] = $this->language->get('text_client_service');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		/*
		BLOG
		*/

		if (isset($this->request->get['tltpath'])) {
			$path = $this->request->get['tltpath'];
		} elseif ($this->config->has('tltblog_path')) {
			$path = $this->config->get('tltblog_path');
		} else {
			$path = 'blogs';
		}
		
		$data['show_path'] = $this->config->get('tltblog_show_path');

		if ($data['show_path']) {
			if ($this->config->has('tltblog_path_title')) {
				$tmp_title = $this->config->get('tltblog_path_title');
				$root_title = $tmp_title[$this->config->get('config_language_id')]['path_title'];
			} else {
				$root_title = $this->language->get('text_title');
			}
			
			$data['blog'] = array("text" => $root_title,
    			"href" => $this->url->link('tltblog/tlttag', 'tltpath=' . $path)
			);
		}

		//MARCAS ASOCIADAS

		$marcasAsociadas=$this->model_catalog_information->getInformation(9);
		$data['marcas_Asociadas']=array(
			'text'=>$marcasAsociadas['title'], 
			'href'=>$this->url->link('information/information', 'information_id=' . 9));
		
		//Promociones
		$promociones=$this->model_catalog_information->getInformation(11);
		$data['promociones']=array(
			'text'=>$promociones['title'], 
			'href'=>$this->url->link('information/information', 'information_id=' . 11));

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		//Esta comprobacion es para el modal de iniciar sesion al querer agregar un producto al carro de compras
		if (!$this->customer->isLogged()) {
			$this->load->language('account/login');

			$data['text_register'] = $this->language->get('text_register');
			$data['text_new_customer'] = $this->language->get('text_new_customer');
			$data['text_register_account'] = $this->language->get('text_register_account');
			$data['text_returning_customer'] = $this->language->get('text_returning_customer');
			$data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
			$data['entry_email'] = $this->language->get('entry_email');
			$data['entry_password'] = $this->language->get('entry_password');
			$data['text_forgotten'] = $this->language->get('text_forgotten');
			$data['button_login'] = $this->language->get('button_login');
			$data['button_continue'] = $this->language->get('button_continue');

			$data['action'] = $this->url->link('account/login', '', true);
			$data['forgotten'] = $this->url->link('account/forgotten', '', true);
			

			if (isset($this->request->post['email'])) {
				$data['email'] = $this->request->post['email'];
			} else {
				$data['email'] = '';
			}

			if (isset($this->request->post['password'])) {
				$data['password'] = $this->request->post['password'];
			} else {
				$data['password'] = '';
			}

			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				$data['redirect'] = $this->request->post['redirect'];
			} elseif (isset($this->session->data['redirect'])) {
				$data['redirect'] = $this->session->data['redirect'];

				unset($this->session->data['redirect']);
			} else {
				$data['redirect'] = '';
			}

		}



		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'description'=>$child['description']
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'image'	   => $category['image'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if($registerView){
			$data['registerView']=True;
		}

		return $this->load->view('common/header', $data);
	}
}
