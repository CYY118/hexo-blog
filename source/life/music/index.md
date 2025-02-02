---
title: 八音盒
date: 2022-08-10 18:54:31
background: url(https://CYY118.github.io/jsdelivr/picr/mmexport1732510677735.ic5o2vsf3.webp)
aplayer: true
comments: false
---

# 我的音乐播放器

在这里你可以享受音乐的乐趣。

<div id="music-player">
    <audio id="audioPlayer" src="/music/your_music_file.mp3"></audio>
    <div class="controls">
        <button id="playPauseBtn">播放</button>
        <input type="range" id="volumeSlider" min="0" max="1" step="0.01" value="1">
        <span id="volumeLabel">音量: 100%</span>
    </div>
</div>