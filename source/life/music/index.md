---
title: 音乐时光
date: 2022-08-10 18:54:31
background: url()
aplayer: true
comments: false
aside: false
---

# 音乐播放器页面

欢迎来到我的音乐世界！在这里，你可以尽情享受美妙的音乐。

<div id="music-player">
    <audio id="audio-player" controls>
        <source src="/path/to/your/music.mp3" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
</div>

<script>
    const audioPlayer = document.getElementById('audio-player');
    const musicPlayer = document.getElementById('music-player');

    // 加载完成事件
    audioPlayer.addEventListener('loadeddata', function() {
        musicPlayer.style.opacity = '1';
        musicPlayer.style.transform = 'translateY(0)';
    });

    // 播放事件
    audioPlayer.addEventListener('play', function() {
        // 这里可以添加播放时的样式变化，比如播放按钮的动画
    });

    // 暂停事件
    audioPlayer.addEventListener('pause', function() {
        // 这里可以添加暂停时的样式变化
    });

    // 播放结束事件
    audioPlayer.addEventListener('ended', function() {
        // 可以添加播放结束后的操作，比如自动播放下一首
    });
</script>