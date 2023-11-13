<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuário</title>
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
            background-color: #dc143c; /* Darker Salmon background on hover */
        }
    </style>
</head>
<body>
    <h1>Novo cadastro de usuário</h1>
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
        <b>Tipo de diabetes:</b><br>
        <input type="text" name="txtTipo_diabetes"><br>
        <b>Data de diagnóstico:</b><br>
        <input type="text" name="txtData_diagnostico"><br>
        <b>Nível de açúcar no sangue:</b><br>
        <input type="text" name="txtNivel_acucar_sangue"><br>
        <b>Peso:</b><br>
        <input type="text" name="txtPeso"><br>
        <b>Altura:</b><br>
        <input type="text" name="txtAltura"><br>
        <b>Pressão arterial:</b><br>
        <input type="text" name="txtPressao_arterial"><br>
        <b>Histórico médico:</b><br>
        <input type="text" name="txtHistorico_medico"><br>
        <b>Medicamentos:</b><br>
        <input type="text" name="txtMedicamentos"><br>
        <b>Alergias:</b><br>
        <input type="text" name="txtAlergias"><br>
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
