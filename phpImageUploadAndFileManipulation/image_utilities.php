<?php
Class ImageUtilites {
    public static function GetBaseImagesList($dir) {
        $images = array();
        foreach(scandir($dir) as $file) {
            $ext = pathinfo($file, PATHINFO_EXTENSION);
            if (is_file($dir . $file) &&
                ($ext === 'png' || $ext === 'jpg')) {
                    $images[] = $file;
                }
        }
        return $images;
    }
    private static function CreateDirectories($dir) {
        if (!file_exists($dir . '/100')) {
            mkdir($dir . '/100');
        }
        if (!file_exists($dir . '/400')) {
            mkdir($dir . '/400');
        }
    }
    private static function ResizeImage($orig, $type, $max) {
        $origImage = '';
        if ($type === IMAGETYPE_PNG) {
            $origImage = imagecreatefrompng($orig);
        } else if ($type === IMAGETYPE_JPEG) {
            $origImage = imagecreatefromjpeg($orig);
        }
        $origWidth = imagesx($origImage);
        $origHeight = imagesy($origImage);

        $ratioWidth = $origWidth / $max;
        $ratioHeight = $origHeight / $max;
        $ratio = max($ratioWidth, $ratioHeight);

        $newWidth = round($origWidth / $ratio);
        $newHeight = round($origHeight / $ratio);

        $newImg = imagecreatetruecolor($newWidth, $newHeight);

        imagecopyresampled($newImg, $origImage, 0, 0, 0, 0,
            $newWidth, $newHeight, $origWidth, $origHeight);
        imagedestroy($origImage);
        return $newImg;
    }
    public static function ProcessImage($file) {
        $fInfo = pathinfo($file);
        $file100 = $fInfo['dirname'] . '/100/' . $fInfo['basename'];
        $file400 = $fInfo['dirname'] . '/400/' . $fInfo['basename'];
        self::CreateDirectories($fInfo['dirname']);

        $imgType = getimagesize($file)[2];
        $newImg100 = self::ResizeImage($file, $imgType, 100);
        $newImg400 = self::ResizeImage($file, $imgType, 400);

        switch($imgType) {
            case IMAGETYPE_PNG:
                imagepng($newImg100, $file100);
                imagepng($newImg400, $file400);
                break;
            case IMAGETYPE_JPEG:
                imagejpeg($newImg100, $file100);
                imagejpeg($newImg400, $file400);
                break;
            default;
                exit;
        }
        imagedestroy($newImg100);
        imagedestroy($newImg400);
    }
    public static function DeleteImageFiles($dir, $base) {
        unlink($dir . $base);
        unlink($dir . '100/' . $base);
        unlink($dir . '400/' . $base);
    }
}