<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>ConstaCloud - @yield('title')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.js"></script>
    @stack('style')
</head>
@include('layouts.partial.navbar')

<body>

    <div class="container">
        @yield('content')

    </div>
</body>
<script src="{{ asset('js/main.js') }}" type="text/javascript"></script>

</html>