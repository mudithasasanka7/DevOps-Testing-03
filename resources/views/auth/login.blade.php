<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form action="{{route('login')}}" method="post">
        @csrf
        <label for="email">Enter Email</label>
        <input type="email" name="email" id="email" required>
        <label for="password">Enter Password</label>
        <input type="password" name="password" id="password" required>
        <button type="submit">Login</button>
    </form>
</body>
</html>