const express = require('express');
const path = require('path');

const app = express();

// 静的ファイルの提供
const root_dir = path.join(__dirname, "..", "..");
console.log(`root dir ${root_dir}`);
app.use(express.static(root_dir));

// ルートへのGETリクエストを処理し、index.htmlを返す
app.get('/', (req, res) => {
    res.sendFile(path.join(root_dir, 'public', 'html', 'index.html'));
});

// サーバーの起動
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

