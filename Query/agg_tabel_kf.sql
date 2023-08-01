-- membuat datamart tabel aggregate penjualan
create table kimia_farma.agg_tabel_kf (
select
id_penjualan,
id_invoice,
tanggal,
monthname(tanggal) as bulan,
id_customer,
nama,
cabang_sales,
grup,
id_barang,
nama_barang,
brand,
kemasan,
jumlah_barang,
harga as harga_satuan,
sum(harga * jumlah_barang) as total
from base_tabel_kf
group by id_penjualan
order by 3, 4, 5, 6, 8, 9, 10, 11, 12
);

select * from kimia_farma.agg_tabel_kf;