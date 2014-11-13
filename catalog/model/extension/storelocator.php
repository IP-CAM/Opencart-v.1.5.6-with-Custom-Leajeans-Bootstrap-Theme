<?php
class ModelExtensionStorelocator extends Model {	
	public function getStorelocator($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storelocator WHERE storelocator_id = '" . (int)$id . " AND status = 1");
		
		return $query->row;
	}
 
	public function getAllStorelocator($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storelocator WHERE status = 1 ORDER BY date_added ASC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}		
				if ($data['limit'] < 1) {
				$data['limit'] = 10;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getStoreregion($region_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storelocator WHERE storeregion_id = " . (int)$region_id . " AND status = 1";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function countStorelocator() {
		$count = $this->db->query("SELECT * FROM " . DB_PREFIX . "storelocator");
	
		return $count->num_rows;
	}
}
?>