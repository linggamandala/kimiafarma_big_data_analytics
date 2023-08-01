-- membuat dan menggunakan schema database kimia_farma --
create schema kimia_farma;
use kimia_farma;

-- membuat tabel barang
create table kimia_farma.barang (
	`kode_barang` varchar(50) not null,
	`nama_barang` varchar(50) null,
	`kemasan` varchar(50) null,
	`harga` int null,
	`nama_tipe` varchar(50) null,
	`kode_brand` int null,
	`brand` varchar(50) null,
    primary key(kode_barang)
);

-- membuat tabel penjualan
create table kimia_farma.penjualan (
	`id_distributor` VARCHAR(50) null,
	`id_cabang` varchar(50) null,
	`id_invoice` varchar(50) not null,
	`tanggal` date null,
    `id_customer` varchar(50) null,
	`id_barang` varchar(50) null,
	`jumlah_barang` int null,
	`unit` varchar(50) null,
	`harga` float null,
    `mata_uang` varchar(50) null,
    primary key(id_invoice)
);

-- mengubah kolom harga menjadi decimal --
alter table kimia_farma.penjualan modify column harga decimal(50);

-- membuat tabel pelanggan --
create table kimia_farma.pelanggan(
	`id_customer` varchar(50) not null,
    `level` varchar(50) null,
    `nama` varchar(50) null,
    `id_cabang_sales` varchar(50) null,
    `cabang_sales` varchar(50) null,
    `id_distributor` varchar(50) null,
    `group` varchar(50) null,
    primary key(id_customer)
);

-- import data csv barang, penjualan, dan pelanggan --
-- klik kanan pada tabel database kimia_farma
-- pilih Data Table Import Wizard
-- pilih file dataset csv yang ingin import dan klik next
-- pilih use existing table dan pilih tabel yang sesuai dengan dataset yang diimport
-- dataset yang akan diimport adalah 
-- Data_source_barang_ds.csv import ke tabel barang
-- Data_source_pelanggan_ds.csv import ke tabel pelanggan
-- Data_source_penjualan.csv import ke tabel penjualan
-- setelah memastikan dataset dan nama table yang akan diimport, kemudian pilih next
-- sesuaikan nama kolom, lalu pilih next
-- pilih next untuk mengeksekusi import dataset dari csv, tunggu hinggal selesai kemudian pilih next dan finish