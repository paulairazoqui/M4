
 TABLE 
 
 compra(IdCompra)
 gasto(IdGasto)
 tipo_gasto(IdTipoGasto)
 venta(IdVenta)
 canal_venta(IdCanal)
 cliente(ID)
 producto(IdProducto)
 empleado(ID_empleado)
 sucursal(IdSucursal)
 calendario(id)
 proveedor(IdProveedor)

-CREATE INDEX index_compra ON TABLE compra(IdCompra) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_gasto ON TABLE gasto(IdGasto) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_tipo_gasto ON TABLE tipo_gasto(IdTipoGasto) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_venta ON TABLE venta(IdVenta) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_canal_venta ON TABLE canal_venta(IdCanal) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_cliente ON TABLE cliente(ID) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_producto ON TABLE producto(IdProducto) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
-CREATE INDEX index_empleado ON TABLE empleado(ID_empleado) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
CREATE INDEX index_sucursal ON TABLE sucursal(IdSucursal) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
CREATE INDEX index_calendario ON TABLE calendario(id) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;
CREATE INDEX index_proveedor ON TABLE proveedor(IdProveedor) AS 'org.apache.hadoop.hive.ql.index.compact.CompactIndexHandler' WITH DEFERRED REBUILD;