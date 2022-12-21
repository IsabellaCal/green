package com.example.demo.green.dao;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Ordine {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDINE_ID")
	private Integer id;
	private double total;
	private Integer utenteId;
	

	public Ordine() {
	}

	public Ordine(double total, Integer userId) {
		this.total = total;
		this.utenteId = userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Integer getUtenteId() {
		return utenteId;
	}

	public void setUtenteId(Integer userId) {
		this.utenteId = userId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, total, utenteId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ordine other = (Ordine) obj;
		return Objects.equals(id, other.id) && Double.doubleToLongBits(total) == Double.doubleToLongBits(other.total)
				&& Objects.equals(utenteId, other.utenteId);
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", total=" + total + ", utenteId=" + utenteId + "]";
	}
}
