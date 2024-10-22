<?php

function convertCell($cell) {
    //divide cell on column and row
    if (!preg_match('/^([A-Z]+)(\d+)$/', $cell, $matches)) {
        return "Nieprawidłowy format komórki";
    }
    
    $column = $matches[1];
    $row = $matches[2];
    
    //convert letters to numbers
    $columnNumber = 0;
    $length = strlen($column);
    
    for ($i = 0; $i < $length; $i++) {
        $columnNumber = $columnNumber * 26 + (ord($column[$i]) - ord('A') + 1);
    }
    
    //combine column and row
    return $columnNumber . '.' . $row;
}


$testCases = ['A2', 'B2', 'A500', 'Z100', 'AA1', 'ZZ999'];

foreach ($testCases as $cell) {
    echo "$cell => " . convertCell($cell) . "<br>";
}