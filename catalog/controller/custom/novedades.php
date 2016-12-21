<?php
class ControllerCustomNovedades extends Controller {
	public function index() {
		//$this->load->language('extension/module/account');

	

		return $this->load->view('extension/custom/novedades', $data);
	}
}