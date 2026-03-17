<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ingresar datos crud</title>


    <div class="container">
        <h2>Nuevo producto</h2>
        <form action="POST">
            <table>
                <tr>
                    <td><label>Nombre del producto</label></td>
                    <td><input type="text" name="nombreProducto" required></input></td>
                </tr>
                <tr>
                    <td><label>Precio</label></td>
                    <td><input type="number" name="precio" required></input></td>
                </tr>
                <tr>
                    <td><label>Cantidad</label></td>
                    <td><input type="number" name="cantidad" required></input></td>
                </tr>
                <tr>
                    <td><label>Descripcion del producto</label></td>
                    <td><input type="text" name="descripcion" required></input></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit">Guardar producto</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</head>
<body>
    
</body>
</html>

@extends('producto')