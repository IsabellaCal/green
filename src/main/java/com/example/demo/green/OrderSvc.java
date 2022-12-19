package com.example.demo.green;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.green.dao.OrderDetail;

@Service
public class OrderSvc {

	public Double getTotal(List<OrderDetail> details) {
		Double total = 0.0;
		for (int i = 0; i < details.size(); i++) {
			total += details.get(i).getQuantity() * details.get(i).getProduct().getPrice();
		}
		return total;
	}
	
	public Integer getNumberItems(List<OrderDetail> details) {
		Integer result = 0;
		for (int i = 0; i < details.size(); i++) {
			result += details.get(i).getQuantity();
		}
		return result;
	}
}
