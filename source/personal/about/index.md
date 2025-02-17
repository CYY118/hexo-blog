---
title: 关于
date: 2022-08-10 16:05:11
---

{% note warning modern %}<b>非商免字体、网图</b>等资源未经授权仅限个人使用，不得用于商业用途。本站平时仅用于交流和学习，如涉及侵权请联系站长删除对应资源，谢谢！ —— 致版权方{% endnote %}

## 0.网站自述视频🎬

<div class="about_page">
  <div align=center class="aspect-ratio">
      <iframe src="这里写自己的网址" 
      scrolling="no" 
      border="0" 
      frameborder="no" 
      framespacing="0" 
      high_quality=1
      danmaku=1 
      allowfullscreen="true"> 
      </iframe>
  </div>
</div>

<br>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>给最爱的宝贝的生日惊喜</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            background: linear-gradient(45deg, #ff6b6b, #ff8e8e, #ffb3b3);
            overflow: hidden;
            font-family: 'Microsoft YaHei', sans-serif;
        }

        .container {
            position: relative;
            z-index: 1;
            text-align: center;
            padding-top: 20vh;
        }

        h1 {
            color: #fff;
            font-size: 4em;
            text-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
            animation: float 3s ease-in-out infinite;
        }

        .heart {
            position: absolute;
            background: #ff4081;
            pointer-events: none;
            transform: rotate(-45deg);
        }

        .heart::before,
        .heart::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: inherit;
            border-radius: 50%;
        }

        .heart::before {
            top: -50%;
            left: 0;
        }

        .heart::after {
            left: 50%;
            top: 0;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .message {
            color: #fff;
            font-size: 2em;
            margin: 30px 0;
            opacity: 0;
            animation: fadeIn 2s forwards;
            animation-delay: 1s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .firework {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #fff;
            border-radius: 50%;
            animation: explode 1.5s ease-out forwards;
        }

        @keyframes explode {
            0% { transform: scale(1); opacity: 1; }
            100% { transform: scale(15); opacity: 0; }
        }

        button {
            padding: 15px 30px;
            font-size: 1.2em;
            background: #ff4081;
            border: none;
            border-radius: 30px;
            color: white;
            cursor: pointer;
            transition: transform 0.3s;
        }

        button:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 生日快乐！我的宝贝 🎂</h1>
        <div class="message" id="message">你是我的全世界 ❤️</div>
        <button onclick="showLove()">点击收获惊喜</button>
    </div>

    <audio id="bgMusic" autoplay loop>
        <source src="https://www.bensound.com/bensound-music/bensound-happyrock.mp3" type="audio/mpeg">
    </audio>

    <script>
        function createHearts() {
            for (let i = 0; i < 50; i++) {
                const heart = document.createElement('div');
                heart.classList.add('heart');
                heart.style.left = Math.random() * 100 + 'vw';
                heart.style.width = heart.style.height = Math.random() * 20 + 10 + 'px';
                heart.style.animation = `fall ${Math.random() * 3 + 2}s linear infinite`;
                document.body.appendChild(heart);
            }
        }

        function showLove() {
            // 创建烟花效果
            for (let i = 0; i < 20; i++) {
                const firework = document.createElement('div');
                firework.classList.add('firework');
                firework.style.left = Math.random() * 95 + '%';
                firework.style.top = Math.random() * 95 + '%';
                firework.style.animationDelay = Math.random() * 0.5 + 's';
                document.body.appendChild(firework);
            }

            // 更新祝福语
            const messages = [
                "愿所有美好都属于你",
                "爱你胜过昨日，略逊明日",
                "你是我生命中最美的礼物",
                "余生请多指教",
                "生日快乐，我的唯一"
            ];
            document.getElementById('message').textContent = 
                messages[Math.floor(Math.random() * messages.length)];
        }

        // 初始化爱心雨
        createHearts();

        // 添加鼠标移动爱心效果
        document.addEventListener('mousemove', (e) => {
            const heart = document.createElement('div');
            heart.classList.add('heart');
            heart.style.left = e.clientX + 'px';
            heart.style.top = e.clientY + 'px';
            heart.style.width = heart.style.height = Math.random() * 20 + 10 + 'px';
            document.body.appendChild(heart);
            
            setTimeout(() => heart.remove(), 2000);
        });
    </script>
</body>
</html>


