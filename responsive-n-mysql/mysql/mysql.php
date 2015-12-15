$database = db.get(SELECT p_name, m_name FROM TableP, TableM WHERE TableP.pid=TableM.pid, ORDER BY p_date DESC;)


<!-- php query -->

<?php 

$sql = "SELECT p_name, m_name FROM TableP, TableM WHERE TableP.pid=TableM.pid, ORDER BY p_date DESC"
$database ->query($sql);
?>