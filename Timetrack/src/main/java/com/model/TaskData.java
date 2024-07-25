package com.model;
public class TaskData {
    private String label;
    private double value;

    public TaskData(String label, double value) {
        this.label = label;
        this.value = value;
    }

    // Getters and setters
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }
}
