package service;

import model.ThucPhamDTO;
import repository.IThucPhamRepository;
import repository.ThucPhamRepository;

import java.util.List;

public class ThucPhamService implements IThucPhamService{
        IThucPhamRepository iThucPhamRepository = new ThucPhamRepository();
    @Override
    public List<ThucPhamDTO> findAll() {
        return iThucPhamRepository.findAll();
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void create(ThucPhamDTO thucPhamDTO) {

    }
}
