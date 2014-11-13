<?php
class ModelExtensionStoreregion extends Model {	
	public function getStoreregion($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storeregion WHERE storeregion_id = '" . (int)$id . " AND status = 1");
		
		return $query->row;
	}
 
	public function getAllStoreregion($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storeregion WHERE status = 1 ORDER BY date_added ASC";
		
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
	
	public function countStoreregion() {
		$count = $this->db->query("SELECT * FROM " . DB_PREFIX . "storeregion");
	
		return $count->num_rows;
	}
}
?>