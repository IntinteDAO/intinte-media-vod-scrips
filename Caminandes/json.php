<?php

$movie["title"]="Caminandes: Llama Drama";
$movie["author"]="Blender Foundation";
$movie["description"]="The films centers on the llama Koro in Patagonia and his attempts to overcome various obstacles. Koro has trouble crossing an apparent desolate road, a problem that an unwitting Armadillo does not share.";
$movie["hidden"]=0;
$movie["license"]="CC BY-NC 3.0";
$movie["website"]="http://www.caminandes.com";
$movie["rating"]=5;
$movie["genre"][0]=3;
$movie["genre"][1]=9;
$movie["genre"][2]=19;
$movie["subtitles"]="";
$movie["enchanted"]=0;
$movie["next_episode"]="";
$movie["previous_episode"]="";

echo json_encode($movie);

?>