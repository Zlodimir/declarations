class AddDeclarations < ActiveRecord::Migration
  def up
    create_table :operations do |t|
      t.integer :root_operation_id
      t.string :name
      t.timestamps
    end

    create_table :vehicle_types do |t|
      t.string :name, limit: 255, null: false
      t.timestamps
    end

    create_table :vehicle_categories do |t|
      t.string :name, limit: 25, null: false
      t.timestamps
    end

    create_table :declarations do |t|
      t.date    :date
      t.string  :dept_name, limit: 255
      t.integer :operation_id, null: false
      t.string  :owner_last_name, limit: 255
      t.string  :owner_first_name, limit: 255
      t.string  :owner_second_name, limit: 255
      t.string  :owner_name, limit: 255
      t.date    :owner_birth_date
      t.date    :owner_registration_date
      t.string  :owner_doc_series, limit: 8
      t.string  :owner_doc_number, limit: 8
      t.date    :owner_doc_date
      t.string  :owner_doc_dept, limit: 255
      t.string  :owner_inn, limit: 15
      t.string  :owner_address_fl, limit: 300
      t.string  :owner_address_ul, limit: 300
      t.string  :owner_telephone, limit: 10
      t.string  :owner_email, limit: 35
      t.boolean :owner_company
      t.string  :trustee_last_name, limit: 255
      t.string  :trustee_first_name, limit: 255
      t.string  :trustee_second_name, limit: 255
      t.string  :trustee_doc_series, limit: 8
      t.string  :trustee_doc_number, limit: 8
      t.date    :trustee_doc_date
      t.string  :trustee_doc_dept, limit: 255
      t.string  :trustee_address, limit: 300
      t.string  :trustee_telephone, limit: 10
      t.string  :vehicle_model, limit: 100
      t.integer :vehicle_year
      t.integer :vehicle_type_id
      t.integer :vehicle_category_id
      t.string  :vehicle_color, limit: 255
      t.string  :vehicle_regnum, limit: 12
      t.string  :vehicle_vin, limit: 17
      t.string  :vehicle_body, limit: 20
      t.string  :vehicle_chassis, limit: 20
      t.float   :vehicle_power_hp
      t.float   :vehicle_power_kvt
      t.string  :vehicle_ecological, limit: 5
      t.integer :vehicle_weight_min
      t.integer :vehicle_weight_max
      t.timestamps
    end

    add_foreign_key :declarations, :operations, on_delete: :cascade
    add_foreign_key :declarations, :vehicle_types, on_delete: :cascade
    add_foreign_key :declarations, :vehicle_categories, on_delete: :cascade

    VehicleCategory.create(name: 'A')
    VehicleCategory.create(name: 'B')
    VehicleCategory.create(name: 'C')
    VehicleCategory.create(name: 'D')
    VehicleCategory.create(name: 'E-прицеп')

    reg = Operation.create(root_operation_id: nil, name: 'Зарегистрировать')
    change = Operation.create(root_operation_id: nil, name: 'Внести изменения')
    ends = Operation.create(root_operation_id: nil, name: 'Снять с учета')
    finish = Operation.create(root_operation_id: nil, name: 'Прекратить регистрацию')

    Operation.create(root_operation_id: reg.id, name: 'Новое ТС, приобретенное в РФ')
    Operation.create(root_operation_id: reg.id, name: 'ТС ввезенное в РФ')
    Operation.create(root_operation_id: reg.id, name: 'ТС приобретенное в качестве высвобождаемого военного имущества')
    Operation.create(root_operation_id: reg.id, name: 'ТС изготовленное в РФ в индивидуальном порядке из сборочного комплекта, либо являющееся самодельным')
    Operation.create(root_operation_id: reg.id, name: 'ТС временно ввезенное в РФ на срок более 6 месяцев')

    Operation.create(root_operation_id: change.id, name: 'В связи с изменением собственника (владельца)')
    Operation.create(root_operation_id: change.id, name: 'В связи с изменением данных о собственнике (владельце)')
    Operation.create(root_operation_id: change.id, name: 'В связи с заменой, либо получением регистрационных знаков взамен утраченных или пришедших в негодность')
    Operation.create(root_operation_id: change.id, name: 'В связи с получением свидетельства о регистрации ТС и (или) ПТС взамен утраченных или пришедших в негодность')
    Operation.create(root_operation_id: change.id, name: 'В связи с изменениями регистрационных данных, не связанных с изменением конструкции')
    Operation.create(root_operation_id: change.id, name: 'В связи с изменением конструкции')

    Operation.create(root_operation_id: ends.id, name: 'В связи с вывозом ТС за пределы территории РФ и (или) окончанием срока регистрации на ограниченный срок')
    Operation.create(root_operation_id: ends.id, name: 'В связи с дальнейшей утилизацией')

    Operation.create(root_operation_id: finish.id, name: 'В связи с утратой (неизвестно место нахождения ТС или при невозможности пользоваться ТС)')
    Operation.create(root_operation_id: finish.id, name: 'В связи с хищением')
    Operation.create(root_operation_id: finish.id, name: 'В связи с продажей (передачей) другому лицу в случае, если новый собственник не зарегистрировал ТС на свое имя)')

    VehicleType.create(name: 'Легковой')
    VehicleType.create(name: 'Грузовой')
    VehicleType.create(name: 'Мотоцикл')
  end

  def down
    drop_table :operations, force: :cascade
    drop_table :vehicle_categories, force: :cascade
    drop_table :vehicle_types, force: :cascade
    drop_table :declarations, force: :cascade
  end
end
