<?php
class ModelExtensionStorelocator extends Model {
	public function addStorelocator($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "storelocator SET date_added = NOW(), title = '" . $this->db->escape($data['title']) . "', phone = '" . $this->db->escape($data['phone']) . "', address = '" . $this->db->escape($data['address']) . "', storeregion_id = '" . $this->db->escape($data['storeregion_id']) . "', status = '" . (int)$data['status'] . "'");		
	}
	
	public function editStorelocator($id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "storelocator SET title = '" . $this->db->escape($data['title']) . "', phone = '" . $this->db->escape($data['phone']) . "',address = '" . $this->db->escape($data['address']) . "', storeregion_id = '" . $this->db->escape($data['storeregion_id']) . "', status = '" . (int)$data['status'] . "' WHERE storelocator_id = '" . (int)$id . "'");		
	}
	
	public function getStorelocator($id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storelocator WHERE storelocator_id = '" . (int)$id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
	
	public function getAllStorelocator($data) {
		$sql = "SELECT * FROM " . DB_PREFIX . "storelocator ORDER BY date_added DESC";
		
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
   
	public function deleteStorelocator($id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "storelocator WHERE storelocator_id = '" . (int)$id . "'");
	}
   
	public function countStorelocator() {
		$count = $this->db->query("SELECT * FROM " . DB_PREFIX . "storelocator");
	
		return $count->num_rows;
	}
	
	public function getStorelocatorregion($storeregion_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "storeregion WHERE storeregion_id = '" . (int)$id . "'"); 
 
		if ($query->num_rows) {
			return $query->row;
		} else {
			return false;
		}
	}
   
}
?>