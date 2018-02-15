<?php
header('content-type: application/json; charset=utf-8');

//simple counter to test sessions. should increment on each page reload.
session_start();
$count = isset($_SESSION['count']) ? $_SESSION['count'] : 1;

$_SESSION['count'] = ++$count;

$date = date("Y-m-d H:i:s");

$info = array(
    "sessions"=>$count,
    "date"=>$date);

$data = json_encode($info);

echo $data;

# write data to fifo stream
$log = trim(getenv('LOG_STREAM'));
$handle = fopen($log, 'a') or die('Cannot open file:  '.$log);
fwrite($handle, $data."\n");

?>
