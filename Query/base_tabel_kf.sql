-- membuat datamart tabel penjualan penggabungan dataset barang, pelanggan, dan penjualan --
create table kimia_farma.base_tabel_kf(
select 
concat(pnj.id_invoice,' ',pnj.id_barang) as id_penjualan,
pnj.id_invoice,
pnj.tanggal,
pnj.id_customer,
plg.nama,
plg.level,
plg.id_cabang_sales,
plg.cabang_sales,
plg.id_distributor,
plg.group as grup,
pnj.id_barang,
brg.nama_barang,
brg.kemasan,
brg.nama_tipe,
brg.kode_brand,
brg.brand,
pnj.jumlah_barang,
pnj.harga,
pnj.mata_uang
from penjualan pnj
	left join barang brg
		on brg.kode_barang = pnj.id_barang
	right join pelanggan plg
		on plg.id_customer = pnj.id_customer
order by pnj.tanggal
);

-- menghapus null value pada row pertama --
delete from kimia_farma.base_tabel_kf
where id_penjualan is null and id_invoice is null and tanggal is null and id_customer is null and id_barang is null
and jumlah_barang is null and mata_uang is null and harga is null and nama_barang is null 
and kemasan is null and nama_tipe is null and kode_brand is null and brand is null and `level`=''  
and nama='' and id_cabang_sales='' and cabang_sales='' and id_distributor='' and grup='';

alter table kimia_farma.base_tabel_kf modify column harga decimal(50);

-- membuat id_penjualan menjadi primary key pada datamart tbl_penjualan --
alter table kimia_farma.base_tabel_kf add primary key(id_penjualan);

select * from kimia_farma.base_tabel_kf;