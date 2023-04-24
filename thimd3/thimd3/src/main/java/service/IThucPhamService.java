package service;

import model.ThucPhamDTO;

import java.util.List;

public interface IThucPhamService {
    List<ThucPhamDTO> findAll();
    void delete(int id ) ;
    void create(ThucPhamDTO thucPhamDTO);
}
