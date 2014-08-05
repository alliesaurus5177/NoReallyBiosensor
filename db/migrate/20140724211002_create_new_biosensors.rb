class CreateNewBiosensors < ActiveRecord::Migration
  def change
    create_table :new_biosensors do |t|
      t.text :sensor_target_type
      t.text :specificity
      t.text :specificity_htm
      t.text :sensor_name
      t.text :sensor_name_htm
      t.text :sensor_type
      t.text :anal_tech
      t.text :iv_props
      t.text :organism
      t.text :binding_protein
      t.text :fluorophore
      t.text :pub_med_id
      t.text :pi_name
 
     t.timestamps
    end
  end
end
