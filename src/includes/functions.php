<?php
//Vérifie qu'il n'y a pas d'espace ou caractère indésirable
function trimDatasPost(array $post) {

    $emptyField = false;
    $a = [];
    foreach ($post as $k => $v):
        if(empty(trim($v)) && trim($v) !== '0') {
            $emptyField = true;
            break;
        }else $a[] = trim($v);
    endforeach;

    return $emptyField ? false : $a;
}
