<?php
$checksum = crc32($_GET["p"]);
printf("%u\n", $checksum);
?>