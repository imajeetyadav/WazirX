package com.codingprotocols.wazirx.models;
// Not Required Now
public class Ticker {
    String  base_unit;
    String quote_unit;
    double low;
    double high;
    double last;
    String type;
    double open;
    double volume;
    double sale;
    double buy;
    String at;
    String name;

    public Ticker(String base_unit, String quote_unit, double low, double high, double last, String type, double open, double volume, double sale, double buy, String at, String name) {
        this.base_unit = base_unit;
        this.quote_unit = quote_unit;
        this.low = low;
        this.high = high;
        this.last = last;
        this.type = type;
        this.open = open;
        this.volume = volume;
        this.sale = sale;
        this.buy = buy;
        this.at = at;
        this.name = name;
    }

    public String getBase_unit() {
        return base_unit;
    }

    public void setBase_unit(String base_unit) {
        this.base_unit = base_unit;
    }

    public String getQuote_unit() {
        return quote_unit;
    }

    public void setQuote_unit(String quote_unit) {
        this.quote_unit = quote_unit;
    }

    public double getLow() {
        return low;
    }

    public void setLow(double low) {
        this.low = low;
    }

    public double getHigh() {
        return high;
    }

    public void setHigh(double high) {
        this.high = high;
    }

    public double getLast() {
        return last;
    }

    public void setLast(double last) {
        this.last = last;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getOpen() {
        return open;
    }

    public void setOpen(double open) {
        this.open = open;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public double getBuy() {
        return buy;
    }

    public void setBuy(double buy) {
        this.buy = buy;
    }

    public String getAt() {
        return at;
    }

    public void setAt(String at) {
        this.at = at;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Ticker{" +
                "base_unit='" + base_unit + '\'' +
                ", quote_unit='" + quote_unit + '\'' +
                ", low=" + low +
                ", high=" + high +
                ", last=" + last +
                ", type='" + type + '\'' +
                ", open=" + open +
                ", volume=" + volume +
                ", sale=" + sale +
                ", buy=" + buy +
                ", at='" + at + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
