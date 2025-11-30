<?php
// Simple script to create the MySQL database using mysqli (works with MAMP)
// Adjust host/port/user/pass if needed

$host = '127.0.0.1';
$port = 8889;
$user = 'root';
$pass = 'root';
$db   = 'habiba_gadget';

$mysqli = new mysqli($host, $user, $pass, '', $port);
if ($mysqli->connect_error) {
    fwrite(STDERR, "Connect error: " . $mysqli->connect_error . "\n");
    exit(1);
}

$sql = "CREATE DATABASE IF NOT EXISTS `{$db}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
if (!$mysqli->query($sql)) {
    fwrite(STDERR, "Query error: " . $mysqli->error . "\n");
    exit(1);
}

echo "Database '{$db}' ensured.\n";

