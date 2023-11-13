<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato de segurança</title>
    <style>
        body {
            background-color: #fff; 
            color: #000; 
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #fa8072; 
        }

        form {
            max-width: 600px;
            margin: 0 auto;
        }

        b {
            color: #fa8072; 
        }

        input {
            padding: 8px;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #000; 
        }

        input[type="submit"] {
            background-color: #fa8072; 
            color: #fff; 
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #dc143c; 
        }
    </style>
</head>
<body>
    <h1>Cadastro de contato de segurança</h1>
    <form name="form1" id="form1" method="post" action="usu_cad_php.php">
        <b>Nome:</b><br>
        <input type="text" name="txtNme"><br>
        <b>Cpf:</b><br>
        <input type="text" name="txtCpf"><br>
        <b>Email:</b><br>
        <input type="text" name="txtEmail"><br>
        <b>Data de nascimento:</b><br>
        <input type="text" name="txtData_nascimento"><br>
        <b>Sexo:</b><br>
        <input type="text" name="txtSexo"><br>
        <input type="submit" value="Enviar">
        <script>
        function validateForm() {
            document.getElementById("errorNome").innerHTML = "";
            document.getElementById("errorCpf").innerHTML = "";
            document.getElementById("errorEmail").innerHTML = "";

            var nome = document.getElementById("txtNome").value;
            if (nome.trim() === "") {
                document.getElementById("errorNome").innerHTML = "Nome não pode ser vazio";
                return false;
            }

            var cpfRegex = /^\d{3}\.\d{3}\.\d{3}-\d{2}$/;
            var cpf = document.getElementById("txtCpf").value;
            if (!cpfRegex.test(cpf)) {
                document.getElementById("errorCpf").innerHTML = "CPF inválido";
                return false;
            }

            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            var email = document.getElementById("txtEmail").value;
            if (!emailRegex.test(email)) {
                document.getElementById("errorEmail").innerHTML = "Email inválido";
                return false;
            }

            return true;
        }
    </script>
    </form>
</body>
</html>
