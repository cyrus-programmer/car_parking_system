<?php
    include "main.php";
    include "config.php";
    if(!$conn)
    {
        echo json_encode("Connection Failed");
    }
    if($_POST["service"]=="Add Vehicle"){
        $addvehicle = new DBServices();
        $addvehicle->addVehicle($conn,$_POST["owner_name"],$_POST["phone_number"],$_POST["modal_number"], $_POST["vehicle_id"], $_POST["vehicle_type"],$_POST["charges"],$_POST["CNIC"], $_POST["slot_no"], $_POST["floor_no"]);
    } elseif($_POST["service"]=="Verify User"){
        $login = new DBServices();
        $login->verifyUser($conn,$_POST["username"],$_POST["password"]);
    } elseif($_POST["service"]=="Add Membership"){
        $addmembership = new DBServices();
        $addmembership->addMembership($conn,$_POST["owner_name"],$_POST["phone_number"],$_POST["modal_number"], $_POST["membership_number"], $_POST["start_date"],$_POST["expiry_date"],$_POST["CNIC"]);
    }elseif($_POST["service"]=="View Vehicles"){
        $viewVehicles = new DBServices();
        $viewVehicles->viewVehicleList($conn);
    }elseif($_POST["service"]=="Floor Data"){
        $floorData = new DBServices();
        $floorData->floorData($conn);
    }
  // tell browser that its a json data
?>