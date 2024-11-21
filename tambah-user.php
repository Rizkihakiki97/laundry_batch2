<?php
session_start();
include 'koneksi.php';
$tampilLevel = mysqli_query($koneksi, "SELECT * FROM level");

// jika button simpan di tekan
if (isset($_POST['simpan'])) {
    $nama     = $_POST['nama'];
    $email    = $_POST['email'];
    $password = $_POST['password'];
    $username = $_POST['username'];
    $id_level = $_POST['id_level'];

    // $_POST: form input name=''
    // $_GET : url ?param='nilai'
    // $_FILES: ngambil nilai dari input type file
    // if (!empty($_FILES['foto']['name'])) {
    //     $nama_foto = $_FILES['foto']['name'];
    //     $ukuran_foto = $_FILES['foto']['size'];

    // png, jpg, jpeg
    // $ext = array('png', 'jpg', 'jpeg');
    // $extFoto = pathinfo($nama_foto, PATHINFO_EXTENSION);

    // JIKA EXTENSI FOTO TIDAK ADA EXT YANG TERDAFTAR DI ARRAY EXT
    // if (!in_array($extFoto, $ext)) {
    //     echo "Ext tidak ditemukan";
    //     die;
    // } else {
    // pindahkan gambar dari tmp folder ke folder yang sudah kita buat
    //     move_uploaded_file($_FILES['foto']['tmp_name'], 'upload/' . $nama_foto);

    //     $insert = mysqli_query($koneksi, "INSERT INTO user (nama, email, password, foto)
    //     VALUES ('$nama','$email','$password','$nama_foto')");
    // }
    // } else {
    $insert = mysqli_query($koneksi, "INSERT INTO user (id_level, nama, email, password, username)
            VALUES ('$id_level', '$nama','$email','$password', '$username')");
    // }

    header("location:user.php?tambah=berhasil");
}

$id  = isset($_GET['edit']) ? $_GET['edit'] : '';
$queryEdit = mysqli_query($koneksi, "SELECT * FROM user WHERE id ='$id'");
$rowEdit   = mysqli_fetch_assoc($queryEdit);


// jika button edit di klik

if (isset($_POST['edit'])) {
    $nama   = $_POST['nama'];
    $email  = $_POST['email'];
    $username = $_POST['username'];
    $id_level = $_POST['id_level'];

    // jika password di isi sama user
    if ($_POST['passsword']) {
        $password = $_POST['password'];
    } else {
        $password = $rowEdit['password'];
    }

    $update = mysqli_query($koneksi, "UPDATE user SET nama='$nama', 
    email='$email', password ='$password', id_level='$id_level', username='$username' WHERE id='$id'");
    header("location:user.php?ubah=berhasil");
}
?>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
    lang="en"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="../assets/"
    data-template="vertical-menu-template-free">

<head>
    <meta charset="utf-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <?php include 'inc/head.php' ?>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <?php include 'inc/sidebar.php'; ?>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <?php include 'inc/nav.php'; ?>
                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->

                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header"><?php echo isset($_GET['edit']) ? 'Edit' : 'Tambah' ?> User</div>
                                    <div class="card-body">
                                        <?php if (isset($_GET['hapus'])): ?>
                                            <div class="alert alert-success" role="alert">
                                                Data berhasil dihapus
                                            </div>
                                        <?php endif ?>

                                        <form action="" method="post" enctype="multipart/form-data">
                                            <div class="mb-3 row">
                                                <div class="col-sm-12">
                                                    <label for="" class="form-label">Level</label>
                                                    <select class="form-control" name="id_level" id="">
                                                        <option value="">--Pilih Level--</option>
                                                        <?php
                                                        while ($row = mysqli_fetch_assoc($tampilLevel)) {
                                                            if (isset($_GET['edit']) && $row['id'] == $rowEdit['id_level']) {
                                                                $selected = 'selected';
                                                            } else {
                                                                $selected = '';
                                                            }
                                                        ?>
                                                            <option <?php echo $selected ?> value="<?php echo $row['id'] ?>"><?php echo $row['nama_level'] ?></option>
                                                        <?php
                                                        }
                                                        ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-6">
                                                    <label for="" class="form-label">Nama</label>
                                                    <input type="text"
                                                        class="form-control"
                                                        name="nama"
                                                        placeholder="Masukkan nama anda"
                                                        required
                                                        value="<?php echo isset($_GET['edit']) ? $rowEdit['nama'] : '' ?>">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label for="" class="form-label">Email</label>
                                                    <input type="email"
                                                        class="form-control"
                                                        name="email"
                                                        placeholder="Masukkan email anda"
                                                        required
                                                        value="<?php echo isset($_GET['edit']) ? $rowEdit['email'] : '' ?>">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-12">
                                                    <label for="" class="form-label">Username</label>
                                                    <input type="text"
                                                        name="username"
                                                        placeholder="Masukkan Username anda"
                                                        class="form-control"
                                                        id="" value="<?php echo isset($_GET['edit']) ? $rowEdit['username'] : '' ?>">
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                                <div class="col-sm-12">
                                                    <label for="" class="form-label">Password</label>
                                                    <input type="password"
                                                        name="password"
                                                        placeholder="Masukkan password anda"
                                                        class="form-control"
                                                        id="">
                                                </div>
                                            </div>
                                            <!-- <div class="mb-3 row">
                                                <div class="col-sm-12">
                                                    <label for="" class="form-label">Foto</label>
                                                    <input type="file"
                                                        name="foto">
                                                </div>
                                            </div> -->
                                            <div class="mb-3">
                                                <button class="btn btn-primary" name="<?php echo isset($_GET['edit']) ? 'edit' : 'simpan' ?>" type="submit">
                                                    Simpan
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                , made with ❤️ by
                                <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                            </div>
                            <div>
                                <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                                <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                                <a
                                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                                    target="_blank"
                                    class="footer-link me-4">Documentation</a>

                                <a
                                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                                    target="_blank"
                                    class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/assets/vendor/js/bootstrap.js"></script>
    <script src="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>