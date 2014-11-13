<?php
class ModelExtensionStoreregion extends Model {
	public function addStoreregion($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "storeregion SET date_added = NOW(), title = '" . $this->db->escape($data['title']) . "', status = '" . (int)$data['status'] . "'");		
	}
	
	public function editStoreregion($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "storeregion SET title = '" . $this->db->escape($data['title']) . ", status = '" . (int)$data['status'] . "' WHERE storeregion_id = '" . (int)$id . "'");		
	}
	
	public function getStoreregion($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storeregion WHERE storeregion_id = '" . (int)$id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
	public function getAllStoreregion($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storeregion ORDER BY date_added DESC";
		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}		
				if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
 
		return $query->rows;
	}
   
	public function deleteStoreregion($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "storeregion WHERE storeregion_id = '" . (int)$id . "'");
	}
   
	public function countStoreregion() {
		$count = $this->db->query("SELECT * FROM " . DB_PREFIX . "storeregion");
	
		return $count->num_rows;
	}
}
?>