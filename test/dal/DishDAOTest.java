/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Dish;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import java.sql.*;
import org.mockito.*;
import static org.mockito.Mockito.*;
import org.mockito.junit.MockitoJUnitRunner;



/**
 *
 * @author Đức Thắng
 */
@RunWith(MockitoJUnitRunner.class)
public class DishDAOTest {
    
    public DishDAOTest() {
    }
    
    @Mock
    private Connection connection;

    @Mock
    private PreparedStatement preparedStatement;

    @Mock
    private ResultSet resultSet;
    
    @InjectMocks
    private DishDAO dishDAO;
    
    @Before
    public void setUp() throws SQLException {
        MockitoAnnotations.initMocks(this);
//        Mockito.lenient().
//                when(connection.prepareStatement(anyString())).
//                thenReturn(preparedStatement);
        when(connection.
                prepareStatement(anyString())).
                thenReturn(preparedStatement);
//        when(preparedStatement.executeQuery()).
//                thenReturn(resultSet);
    } 
    
    @Test
    public void testDelete_Success() throws SQLException {
    // Giả lập executeUpdate trả về 1 (số hàng bị ảnh hưởng)
        when(preparedStatement.executeUpdate()).thenReturn(1);
        
    // Gọi phương thức cần test
        dishDAO.delete(1);
        
    // Kiểm tra xem prepareStatement và executeUpdate có được gọi không
        verify(connection).
                prepareStatement("DELETE FROM [dbo].[Dish] "
                        + "WHERE DishID = ?");
        verify(preparedStatement).setInt(1, 1);
        verify(preparedStatement).executeUpdate();
    }
    
    @Test
    public void testDelete_Failure() throws SQLException {    
    // Giả lập lỗi SQL
        doThrow(new SQLException("Database error")).
                when(preparedStatement).executeUpdate();
        
    // Gọi phương thức cần test và kiểm tra xem có ném exception không
        dishDAO.delete(1);
        
    // Kiểm tra xem phương thức được gọi đúng cách
        verify(connection).
                prepareStatement("DELETE FROM [dbo].[Dish] "
                        + "WHERE DishID = ?");
        verify(preparedStatement).setInt(1, 1);
        verify(preparedStatement).executeUpdate();
    }
    
}
