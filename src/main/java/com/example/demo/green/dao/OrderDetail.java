package com.example.demo.green.dao;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DETAIL_ID")
	private Integer id;
	private Integer ordineId;
	
	@ManyToOne
	@JoinColumn(name = "MENU_ID")
	private Product product;
	private Integer quantity;

	public OrderDetail() {
	}

	public OrderDetail(Product product, Integer quantity) {
		this.product = product;
		this.quantity = quantity;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrderId() {
		return ordineId;
	}

	public void setOrderId(Integer orderId) {
		this.ordineId = orderId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, ordineId, product, quantity);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetail other = (OrderDetail) obj;
		return Objects.equals(id, other.id) && Objects.equals(ordineId, other.ordineId)
				&& Objects.equals(product, other.product) && Objects.equals(quantity, other.quantity);
	}

	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", ordineId=" + ordineId + ", product=" + product + ", quantity=" + quantity
				+ "]";
	}

	
}
