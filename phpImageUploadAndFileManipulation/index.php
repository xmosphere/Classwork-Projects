<?php
require_once('image_utilities.php');
$dir = getcwd() . '/images/';
$imgName = '';
if (isset($_POST['view'])) {
    $imgName = $_POST['image_file'];
}
if (isset($_POST['delete'])) {
    $fName = $_POST['image_file'];
    $editFile = ImageUtilites::DeleteImageFiles($dir, $fName);
    $imName = '';
}
if (isset($_POST['upload'])) {
    $target = $dir . $_FILES['new_file']['name'];
    move_uploaded_file($_FILES['new_file']['tmp_name'],
        $target);
    ImageUtilites::ProcessImage($target);
    $imgName = '';
}
?>
<html>
    <head>
        <title>Week5 GP2 - Noah Poling</title>
    </head>
    <body>
        <h1>Week5 GP2 - Noah Poling</h1>
        <form method="POST">
            <h3>Image Files: <select name="image_file">
                <?php foreach(ImageUtilites::GetBaseImagesList($dir) as $file) : ?>
                    <option value="<?php echo $file; ?>"><?php echo $file; ?></option>
            <?php endforeach ?></select>
            <input type="submit" value="View Images" name="view">
            <input type="submit" value="Delete Image" name="delete">
        </h3>
        </form>
        <h3>Upload Image File:
            <form method="POST" enctype="multipart/form-data">
                <input type="file" name="new_file" id="new_file">
                <input type="submit" value="Upload" name="upload">
            </form>
        </h3>
        <h4>Original Image:</h4>
        <img src="images/<?php echo $imgName; ?>" alt="<?php echo $imgName; ?>">
        <h4>100px Max Image:</h4>
        <img src="images/100/<?php echo $imgName; ?>" alt="<?php echo $imgName; ?>">
        <h4>400px Max Image:</h4>
        <img src="images/400/<?php echo $imgName; ?>" alt="<?php echo $imgName; ?>">
    </body>
</html>