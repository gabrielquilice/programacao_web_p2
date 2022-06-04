/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.Timestamp;


public class Actor {
    private int actor_id;
    private String first_name;
    private String last_name;
    private Timestamp last_update;

    /**
     * @return the actor_id
     */
    public int getActor_id() {
        return actor_id;
    }

    /**
     * @param actor_id the actor_id to set
     */
    public void setActor_id(int actor_id) {
        this.actor_id = actor_id;
    }

    /**
     * @return the first_name
     */
    public String getFirst_name() {
        return first_name;
    }

    /**
     * @param first_name the first_name to set
     */
    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    /**
     * @return the last_name
     */
    public String getLast_name() {
        return last_name;
    }

    /**
     * @param last_name the last_name to set
     */
    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    /**
     * @return the last_update
     */
    public Timestamp getLast_update() {
        return last_update;
    }

    /**
     * @param last_update the last_update to set
     */
    public void setLast_update(Timestamp last_update) {
        this.last_update = last_update;
    }
    
}
