package repository;

import model.ThucPhamDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThucPhamRepository implements IThucPhamRepository{
    private static final String FIND_ALL = "select * from thuc_pham t join loai_thuc_pham l  on t.ma_loai_thuc_pham = l.ma_loai_thuc_pham" ;
    @Override
    public List<ThucPhamDTO> findAll() {
        List<ThucPhamDTO> list = new ArrayList<>();
        try(Connection connection = DBConnection.getConnection() ;
        PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL)) {
            ResultSet resultSet = preparedStatement.getResultSet();
            ThucPhamDTO thucPhamDTO ;
            while (resultSet.next()){
                thucPhamDTO = new ThucPhamDTO();
                thucPhamDTO.setTenThucPham(resultSet.getString("ten_thuc_pham"));
                thucPhamDTO.setTenThucPham(resultSet.getString("ngay_san_xuat"));
                thucPhamDTO.setTenThucPham(resultSet.getString("han_su_dung"));
                thucPhamDTO.setTenThucPham(resultSet.getString("nha_cung_cap"));
                thucPhamDTO.setTenThucPham(resultSet.getString("ten_loai_thuc_pham"));
                list.add(thucPhamDTO);
                preparedStatement.executeQuery();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void create(ThucPhamDTO thucPhamDTO) {

    }

    @Override
    public void delete(int id) {

    }
}
