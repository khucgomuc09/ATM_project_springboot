<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
</head>
<body>
	<!-- DataTables JavaScript -->
	<script
		src="../../../resources/admin/js/dataTables/jquery.dataTables.min.js"></script>
	<script
		src="../../../resources/admin/js/dataTables/dataTables.bootstrap.min.js"></script>

	<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>
</body>
</html>