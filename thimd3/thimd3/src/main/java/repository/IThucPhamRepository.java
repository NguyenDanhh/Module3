package repository;

import model.ThucPhamDTO;

import java.util.List;

public interface IThucPhamRepository {
    List<ThucPhamDTO> findAll();
    void create (ThucPhamDTO thucPhamDTO) ;
    void delete(int id );
}
