package hospital.dao;

import hospital.user.Department;
import hospital.user.Hospital;

import java.util.List;

public interface DepartmentDao {
    public List<Department> findAll();
    public void delete(int id);
    public Department add(Department department);
    public boolean update(Department department);
    public Department find(int id);
}
