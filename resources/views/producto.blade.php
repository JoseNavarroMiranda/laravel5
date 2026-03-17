<!DOCTYPE html>
<html>
<head>
    <title>Mi Entrevista Laravel</title>
</head>
<body>
    <h1>Crud de pruena Laravel 5!</h1>
	<div>			
    <ul class="nav navbar-nav">
		<li><a href="{{ url('/newproducto') }}">crear producto</a></li>
    </ul>
    </div>
</body>
</html>
@yield('content')