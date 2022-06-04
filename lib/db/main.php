<?php
    
    class DBServices{
        public
        function sendJSONResponse($response){
            header('Content-Type: application/json');
            echo json_encode($response);
        }
        function addVehicle($conn, $owner_name, $phone_number, $modal_number, $vehicle_id, $vehicle_type, $charges, $cnic, $slot_no, $floor_no){            
            try {
                $query3 = "INSERT INTO slot(slot_no, vehicle_number, floor_no) VALUES (?,?,?)";
                  $sql = $conn->prepare($query3);
                  $sql->execute([$slot_no, $vehicle_id, $floor_no]);
                $query = "INSERT INTO vehicles(vehicle_number, vehicle_modal, vehicle_type, slot_no) VALUES (?,?,?,?)";
                  $sql = $conn->prepare($query);
                  $sql->execute([$vehicle_id, $vehicle_type, $modal_number, $slot_no]);
                  $query2 = "INSERT INTO vehicle_owner(cnic, name, phone, vehicle_number) VALUES (?,?,?,?)";
                  $sql = $conn->prepare($query2);
                  $sql->execute([$cnic, $owner_name, $phone_number, $vehicle_id]);
                  
    
                  $response["message"] = "Successfully Added";
                  $obj = new DBServices();
                $obj->sendJSONResponse($response); 
            } catch (Exception $e) {
                $response["message"] = $e;
                $obj = new DBServices();
                $obj->sendJSONResponse($response);
            }
            
        }
        function verifyUser($conn, $username, $password){
            $sql = "SELECT * FROM login WHERE username = ? limit 1";
            $query_2 = $conn->prepare($sql);
            $query_2->execute([$username]);
            $count = $query_2->rowCount();
            $result   = $query_2->fetch(PDO::FETCH_OBJ);

            if ($count==1){
                if ($password == $result->password){
                    $response["success"] = true;
                    // $return["username"] = $result->username;
                    $response["type"] = $result->type;
                    $obj = new DBServices();
                $obj->sendJSONResponse($response);
                }
            else{
                $response["success"] = false;

                $return["message"] = "Error";
                $obj = new DBServices();
                $obj->sendJSONResponse($response);
            }
            }
            
    }
    function addMembership($conn,$owner_name, $phone_number, $modal_number, $membership_number, $start_date, $expiry_date, $cnic){
        try {
            $query = "INSERT INTO membership(cnic, name, phone, vehicle_modal, membership_no, start_date, expiry_date) VALUES (?,?,?,?,?,?,?)";
              $sql = $conn->prepare($query);
              $sql->execute([$cnic,$owner_name, $phone_number, $modal_number, $membership_number, $start_date, $expiry_date]);
              $response["message"] = "Successfully Added";
              $obj = new DBServices();
            $obj->sendJSONResponse($response); 
        } catch (Exception $e) {
            $response["message"] = $e;
            $obj = new DBServices();
            $obj->sendJSONResponse($response);
        }
        
    }

    function viewVehicleList($conn, $floor_no){
        try{
            $query = "SELECT vehicles.slot_no, name, phone, vehicles.vehicle_number FROM slot inner join vehicles on slot.slot_no=vehicles.slot_no inner join vehicle_owner on vehicles.vehicle_number=vehicle_owner.vehicle_number WHERE floor_no = ? ORDER BY vehicles.slot_no";
            $db_data = array();
            $result = $conn->prepare($query);
            $result->execute([$floor_no]);
            $result1 = $result->fetchAll(PDO::FETCH_OBJ);
            
                foreach($result1 as $row){
                    $db_data[] = $row;
                }
                echo json_encode($db_data);
        } catch(Exception $e){
            echo json_encode($e);
        }
    }
    function floorData($conn){
        try {
            $query = "SELECT * FROM floor";
            $sql = $conn->query($query);
            $db_data = array();
            $result = $sql->fetchAll(PDO::FETCH_OBJ);
            foreach($result as $row){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        } catch (Exception $e) {
            echo json_encode($e);
        }
    }
    

        }
        
?>