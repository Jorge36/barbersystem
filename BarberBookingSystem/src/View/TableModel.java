/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import javax.swing.table.DefaultTableModel;

/**
 * I make the table no editable with this class
 * @author Jorge
 */
public class TableModel extends DefaultTableModel {
        
    public TableModel(Object[][] data, Object[] columnNames) {
        super(data, columnNames);
    }

    
    @Override
    public boolean isCellEditable(int row, int column)
    {
        return false;
    }
              
}
    

