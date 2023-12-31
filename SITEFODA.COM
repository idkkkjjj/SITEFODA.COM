<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OnlyFans</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #000000; /* Cor de fundo preta */
        }

        button {
            background-color: #6a009a; /* Cor roxa */
            color: black;
            padding: 15px 30px;
            font-size: 20px;
            font-weight: bold; /* Negrito */
            border-radius: 10px; /* Borda arredondada */
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease; /* Transições suaves de cor e transformação */
        }

        button:hover {
            background-color: #800095; /* Cor roxa mais claro ao passar o mouse */
            transform: scale(1.1); /* Efeito de escala ao passar o mouse */
        }

        #media-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: black;
            z-index: 1;
            opacity: 0;
            transition: opacity 1s ease; /* Transição suave de opacidade */
        }

        #media-container.show {
            display: flex;
            opacity: 1;
        }

        #media-container img {
            max-width: 100%;
            max-height: 100%;
            display: block;
            margin: auto;
            opacity: 0; /* Começa com opacidade 0 */
            transition: opacity 2s ease; /* Adicionando transição de opacidade */
        }

        #media-container.show img {
            opacity: 1; /* Muda para opacidade 1 quando o contêiner é exibido */
        }
    </style>
</head>
<body>
    <button onclick="showMedia()">Acesse meu perfil!</button>

    <div id="media-container">
        <img src="https://media.tenor.com/y5KVwUHOv-0AAAAi/rei-rei-plush.gif" alt="GIF">
        <audio id="audio" autoplay loop>
            <source src="file:///C:/Users/Administrator/Downloads/audio-editor-output.mp3" type="audio/mp3">
            Seu navegador não suporta o elemento de áudio.
        </audio>
    </div>

    <script>
        function showMedia() {
            const mediaContainer = document.getElementById('media-container');
            mediaContainer.classList.add('show');
            playAudio();
        }

        function closeMedia() {
            const mediaContainer = document.getElementById('media-container');
            mediaContainer.classList.remove('show');
            pauseAudio();
        }

        function playAudio() {
            const audio = document.getElementById('audio');
            audio.play();
        }

    </script>
</body>
</html>
