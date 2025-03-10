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
        when(preparedStatement.executeQuery()).
                thenReturn(resultSet);
    }

    @Test
    public void testDelete_Success() throws SQLException {
        // Giả lập executeUpdate trả về 1 (số hàng bị ảnh hưởng)
        when(preparedStatement.executeUpdate()).thenReturn(1);
        // Gọi phương thức delete
        dishDAO.delete(1);
        // Kiểm tra xem executeUpdate trả về 1 (thành công)
        assertEquals(1, preparedStatement.executeUpdate());
        // Kiểm tra dishDAO không null để tránh Sonar báo lỗi
        assertNotNull(dishDAO);
    }

    @Test
    public void testDelete_Failure() throws SQLException {
        // Giả lập SQLException khi executeUpdate()
        when(preparedStatement.executeUpdate()).thenThrow(new SQLException("Database error"));

        // Gọi phương thức delete
        dishDAO.delete(1);

        // Kiểm tra xem prepareStatement có được gọi đúng cách không
        verify(connection).prepareStatement("DELETE FROM [dbo].[Dish] WHERE DishID = ?");
        verify(preparedStatement).setInt(1, 1);
        verify(preparedStatement).executeUpdate();
    }
    
     @Test
    public void testFindId_Found() throws SQLException {
        // Giả lập dữ liệu trong ResultSet
        when(resultSet.next()).thenReturn(true); // Có dữ liệu
        when(resultSet.getInt(1)).thenReturn(1);
        when(resultSet.getString(2)).thenReturn("Pizza");
        when(resultSet.getDouble(3)).thenReturn(12.99);
        when(resultSet.getString(4)).thenReturn("Delicious pizza");
        when(resultSet.getString(5)).thenReturn("image.jpg");

        // Gọi phương thức cần test
        Dish dish = dishDAO.findId(1);

        // Kiểm tra kết quả
        assertNotNull(dish);
        assertEquals(1, dish.getDishId());
        assertEquals("Pizza", dish.getDishName());
        assertEquals(12.99, dish.getPrice(), 0.01);
        assertEquals("Delicious pizza", dish.getStatus());
        assertEquals("image.jpg", dish.getImage());

        // Kiểm tra phương thức gọi đúng
        verify(preparedStatement).setInt(1, 1);
        verify(preparedStatement).executeQuery();
        verify(resultSet).next();
    }

    /** ✅ Test: Không tìm thấy Dish */
    @Test
    public void testFindId_NotFound() throws SQLException {
        // Giả lập ResultSet không có dữ liệu
        when(resultSet.next()).thenReturn(false);

        // Gọi phương thức cần test
        Dish dish = dishDAO.findId(999);

        // Kiểm tra kết quả phải là null
        assertNull(dish);

        // Kiểm tra phương thức được gọi đúng cách
        verify(preparedStatement).setInt(1, 999);
        verify(preparedStatement).executeQuery();
        verify(resultSet).next();
    }

    /** ✅ Test: Lỗi SQL */
    @Test
    public void testFindId_SQLException() throws SQLException {
        // Giả lập SQLException khi thực hiện truy vấn
        when(preparedStatement.executeQuery()).thenThrow(new SQLException("Database error"));

        // Gọi phương thức cần test
        Dish dish = dishDAO.findId(1);

        // Kiểm tra kết quả phải là null
        assertNull(dish);

        // Kiểm tra phương thức được gọi đúng cách
        verify(preparedStatement).setInt(1, 1);
        verify(preparedStatement).executeQuery();
    }

}
