<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_FILES['webpImage'])) {
        $webpImage = $_FILES['webpImage']['tmp_name'];
        $pngImage = pathinfo($_FILES['webpImage']['name'], PATHINFO_FILENAME) . '.png';

        $image = imagecreatefromwebp($webpImage);
        if ($image === false) {
            http_response_code(500);
            echo "无法加载 WebP 图片。";
        } else {
            header('Content-Type: image/png');
            imagepng($image, $pngImage);
            imagedestroy($image);
            echo "图片转换成功。";
        }
    } else {
        http_response_code(400);
        echo "没有文件上传。";
    }
} else {
    http_response_code(405);
    if (extension_loaded('gd')) {
        echo "GD库已安装";
    } else {
        echo "GD库未安装";
    }

    echo "API made by 2ui，实现webp转png，只支持 POST 方法。";
}
?>
