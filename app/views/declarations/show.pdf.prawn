prawn_document(page_size: 'A4', margin: 15) do |pdf|
  pdf.font_families.update(
  'times' => {
    :bold => "#{Rails.root}/lib/assets/fonts/TimesNewRomanBold.ttf",
    :italic => "#{Rails.root}/lib/assets/fonts/TimesNewRomanItalic.ttf",
    :normal  => "#{Rails.root}/lib/assets/fonts/TimesNewRomanRegular.ttf" })

  pdf.font 'times', size: 12
  pdf.draw_text t('statement_declaration.declaration_block.header').mb_chars.upcase.to_s, style: :bold, at: [250, 800]
  pdf.draw_text t('statement_declaration.declaration_block.where'), at: [7, 783]

  pdf.bounding_box([120, 791], width: 440, height: 12) do
    #pdf.stroke_bounds
    pdf.text @declaration.dept_name, align: :center
  end

  pdf.draw_text t('statement_declaration.declaration_block.dept'), at: [200, 773], size: 8

  pdf.stroke do
    # wrapper block
    pdf.rectangle [0, 810], 565, 470
    pdf.vertical_line 750, 340, at: 120
    pdf.draw_text t('statement_declaration.declaration_block.iam'), at: [7, 760]
    pdf.horizontal_line 25, 520, at: 759
    pdf.draw_text t('statement_declaration.declaration_block.request'), at: [525, 760]
    pdf.draw_text t('statement_declaration.declaration_block.person_attrs'), size: 8, at: [200, 752]
    pdf.bounding_box([23, 769], width: 500, height: 12) do
      #pdf.stroke_bounds
      pdf.text @declaration.trustee? ? @declaration.trustee_name : @declaration.owner_name, align: :center
    end

    ###################################
    # main block
    pdf.horizontal_line 0, 565, at: 780
    pdf.horizontal_line 0, 565, at: 750
    pdf.horizontal_line 120, 565, at: 735
    pdf.horizontal_line 120, 565, at: 720
    pdf.horizontal_line 120, 565, at: 705
    pdf.horizontal_line 120, 565, at: 682
    pdf.draw_text t('statement_declaration.declaration_block.register_action'), at: [12, 705]
    pdf.draw_text t('statement_declaration.declaration_block.up_link'), at: [12, 697], size: 8

    # reg vehicle block
    operation(pdf, @declaration, 5, t('statement_declaration.declaration_block.register_actions.new_vehicle'), 123, 747)
    operation(pdf, @declaration, 6, t('statement_declaration.declaration_block.register_actions.import_vehicle'), 123, 732)
    operation(pdf, @declaration, 7, t('statement_declaration.declaration_block.register_actions.military_vehicle'), 123, 717)
    operation(pdf, @declaration, 8, t('statement_declaration.declaration_block.register_actions.individual_vehicle'), 123, 705, 25, -2)
    operation(pdf, @declaration, 9, t('statement_declaration.declaration_block.register_actions.temporary_vehicle'), 123, 681)    
    pdf.horizontal_line 0, 565, at: 668

    # change vehicle block
    pdf.horizontal_line 120, 565, at: 653
    pdf.horizontal_line 120, 565, at: 638
    pdf.horizontal_line 120, 565, at: 608
    pdf.horizontal_line 120, 565, at: 578
    pdf.horizontal_line 120, 565, at: 563
    pdf.horizontal_line 0, 565, at: 548
    pdf.bounding_box([12, 617], width: 100, height: 30) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.declaration_block.change_action'), leading: -3
    end
    pdf.draw_text t('statement_declaration.declaration_block.up_link'), at: [12, 591], size: 8

    operation(pdf, @declaration, 10, t('statement_declaration.declaration_block.change_actions.owner'), 123, 666)
    operation(pdf, @declaration, 11, t('statement_declaration.declaration_block.change_actions.owner_attributes'), 123, 651)
    operation(pdf, @declaration, 12, t('statement_declaration.declaration_block.change_actions.car_plate'), 123, 635, 32, -1)
    operation(pdf, @declaration, 13, t('statement_declaration.declaration_block.change_actions.vehicle_passport'), 123, 604, 32, -1)
    operation(pdf, @declaration, 14, t('statement_declaration.declaration_block.change_actions.registration_data'), 123, 576)
    operation(pdf, @declaration, 15, t('statement_declaration.declaration_block.change_actions.construction'), 123, 561)


    # end vehicle block
    pdf.horizontal_line 120, 565, at: 518
    pdf.horizontal_line 0, 565, at: 488
    pdf.bounding_box([12, 540], width: 100, height: 45) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.declaration_block.end_action')
    end
    pdf.draw_text t('statement_declaration.declaration_block.up_link'), at: [12, 498], size: 8
    operation(pdf, @declaration, 16, t('statement_declaration.declaration_block.end_actions.foreign'), 123, 544, 30, -1)
    operation(pdf, @declaration, 17, t('statement_declaration.declaration_block.end_actions.trash'), 123, 510)

    # finish block
    pdf.horizontal_line 120, 565, at: 458
    pdf.horizontal_line 120, 565, at: 443
    pdf.horizontal_line 0, 565, at: 400
    pdf.bounding_box([12, 473], width: 100, height: 55) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.declaration_block.finish_action')
    end
    pdf.draw_text  t('statement_declaration.declaration_block.up_link'), at: [12, 418], size: 8
    operation(pdf, @declaration, 18, t('statement_declaration.declaration_block.finish_actions.lost'), 123, 485, 30, -1)
    operation(pdf, @declaration, 19, t('statement_declaration.declaration_block.finish_actions.theft'), 123, 457)
    operation(pdf, @declaration, 20, t('statement_declaration.declaration_block.finish_actions.sell'), 123, 439, 40, -1)

    # vehicle block
    pdf.horizontal_line 120, 565, at: 385
    pdf.horizontal_line 120, 565, at: 370
    pdf.horizontal_line 120, 565, at: 355
    pdf.bounding_box([12, 383], width: 100, height: 55) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.declaration_block.vehicle')
    end
    pdf.draw_text t('statement_declaration.declaration_block.vehicle_attrs.model', model: @declaration.vehicle_model), at: [123, 388]
    pdf.draw_text t('statement_declaration.declaration_block.vehicle_attrs.year', year: @declaration.vehicle_year), at: [123, 373]
    pdf.draw_text t('statement_declaration.declaration_block.vehicle_attrs.vin', vin: @declaration.vehicle_vin), at: [123, 358]
    pdf.draw_text t('statement_declaration.declaration_block.vehicle_attrs.car_plate', regnum: @declaration.vehicle_regnum), at: [123, 343]
    
    ###################################
    # owner block
    ###################################
    pdf.rectangle [0, 335], 565, 170
    pdf.draw_text t('statement_declaration.owner_block.header').mb_chars.upcase.to_s, style: :bold, at: [110, 324]
    pdf.horizontal_line 10, 555, at: 309
    pdf.draw_text t('statement_declaration.owner_block.owner_link'), size: 8, at: [135, 303]
    pdf.draw_text t('statement_declaration.owner_block.date'), at: [10, 289]
    pdf.horizontal_line 400, 555, at: 287
    pdf.draw_text t('statement_declaration.owner_block.document'), at: [10, 274]
    pdf.horizontal_line 205, 555, at: 271
    pdf.draw_text t('statement_declaration.owner_block.document_link'), size: 8, at: [220, 264]
    pdf.horizontal_line 10, 555, at: 251
    pdf.draw_text t('statement_declaration.owner_block.inn'), at: [10, 239]
    pdf.horizontal_line 220, 555, at: 237
    pdf.draw_text t('statement_declaration.owner_block.address'), at: [10, 223]
    pdf.horizontal_line 460, 555, at: 222
    pdf.horizontal_line 10, 555, at: 206
    pdf.draw_text t('statement_declaration.owner_block.address_link'), at: [130, 201], size: 8
    pdf.horizontal_line 10, 555, at: 187
    pdf.draw_text t('statement_declaration.owner_block.telephone'), at: [10, 172]
    pdf.horizontal_line 35, 162, at: 170
    pdf.draw_text t('statement_declaration.owner_block.email'), at: [170, 172]
    pdf.horizontal_line 385, 555, at: 170

    # owner filling
    pdf.bounding_box([10, 320], width: 555, height: 15) do
      #pdf.stroke_bounds
      pdf.text @declaration.owner_company? ? @declaration.owner_company_name : @declaration.owner_name, align: :center
    end
    
    pdf.draw_text @declaration.owner_company? ? @declaration.owner_registration_date : @declaration.owner_birth_date, at: [450, 290]

    pdf.bounding_box([205, 282], width: 340, height: 31) do
      #pdf.stroke_bounds
      pdf.text @declaration.owner_document, leading: 7 unless @declaration.owner_company?
    end

    pdf.draw_text @declaration.owner_inn, at: [230, 240] if @declaration.owner_company?

    pdf.bounding_box([10, 217], width: 545, height: 31) do
      #pdf.stroke_bounds
      pdf.text @declaration.owner_company? ? @declaration.owner_address_ul : @declaration.owner_address_fl, leading: 6
    end
    
    pdf.draw_text @declaration.owner_telephone, at: [35, 173]
    
    pdf.draw_text @declaration.owner_email, at: [390, 173]
    
    ###################################
    # trustee block
    ###################################
    pdf.rectangle [0, 160], 565, 160
    pdf.draw_text t('statement_declaration.trustee_block.header').mb_chars.upcase.to_s, style: :bold, at: [180, 150]
    pdf.horizontal_line 10, 555, at: 135
    pdf.draw_text t('statement_declaration.trustee_block.trustee_link'), size: 8, at: [200, 129]
    pdf.horizontal_line 207, 555, at: 112
    pdf.horizontal_line 10, 555, at: 91
    pdf.draw_text t('statement_declaration.trustee_block.document_link'), size: 8, at: [300, 104]
    pdf.horizontal_line 232, 555, at: 75
    pdf.draw_text t('statement_declaration.trustee_block.address_link'), size: 8, at: [240, 69]
    pdf.horizontal_line 10, 555, at: 54
    pdf.horizontal_line 10, 555, at: 34
    pdf.horizontal_line 10, 110, at: 17
    pdf.horizontal_line 120, 555, at: 17
    pdf.draw_text t('statement_declaration.trustee_block.telephone'), size: 8, at: [40, 10]
    pdf.draw_text t('statement_declaration.trustee_block.date'), size: 8, at: [150, 10]
    pdf.draw_text t('statement_declaration.trustee_block.signature'), size: 8, at: [280, 10]
    pdf.draw_text t('statement_declaration.trustee_block.name'), size: 8, at: [430, 10]
    
    # trustee filling
    pdf.bounding_box([10, 146], width: 550, height: 12) do
      #pdf.stroke_bounds
      pdf.text @declaration.trustee_name, align: :center
    end

    pdf.bounding_box([10, 123], width: 550, height: 33) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.trustee_block.document') + ' ' + @declaration.trustee_document.to_s, leading: 9
    end
    
    pdf.bounding_box([10, 86], width: 550, height: 50) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration.trustee_block.address') + ' ' + @declaration.trustee_address, leading: 9
    end
    pdf.draw_text @declaration.trustee_telephone, at: [15, 20]
    pdf.draw_text @declaration.date, at: [140, 20]
    pdf.bounding_box([320, 28], width: 240, height: 13) do
      #pdf.stroke_bounds
      pdf.text @declaration.sign_person, align: :center
    end
  end

  pdf.start_new_page
  pdf.stroke do
    ###################################
    # vehicle block
    ###################################
    pdf.rectangle [0, 810], 565, 270
    pdf.horizontal_line 0, 565, at: 760
    pdf.horizontal_line 0, 565, at: 745
    pdf.horizontal_line 0, 565, at: 730
    pdf.horizontal_line 0, 565, at: 715
    pdf.horizontal_line 0, 565, at: 700
    pdf.horizontal_line 0, 565, at: 685
    pdf.horizontal_line 0, 565, at: 670
    pdf.horizontal_line 0, 565, at: 655
    pdf.horizontal_line 0, 565, at: 640
    pdf.horizontal_line 0, 565, at: 625
    pdf.horizontal_line 0, 565, at: 610
    pdf.horizontal_line 0, 565, at: 595
    pdf.horizontal_line 0, 565, at: 580
    pdf.vertical_line 810, 580, at: 186
    pdf.vertical_line 810, 580, at: 375
    pdf.horizontal_line 5, 555, at: 553

    pdf.bounding_box([1, 809], width: 185, height: 30) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration_second.vehicle_block.heading').mb_chars.upcase.to_s, style: :bold, align: :center
    end

    pdf.bounding_box([186, 809], width: 185, height: 50) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration_second.vehicle_block.passport'), align: :center
    end

    pdf.bounding_box([380, 809], width: 185, height: 50) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration_second.vehicle_block.revision'), align: :center
    end

    pdf.draw_text t('statement_declaration_second.vehicle_block.model'), at: [5, 748]
    pdf.draw_text @declaration.vehicle_model, at: [190, 748]
    
    pdf.draw_text t('statement_declaration_second.vehicle_block.year'), at: [5, 733]
    pdf.draw_text @declaration.vehicle_year, at: [190, 733]

    pdf.draw_text t('statement_declaration_second.vehicle_block.type'), at: [5, 718]
    pdf.draw_text @declaration.vehicle_type + '/' + @declaration.vehicle_category, at: [190, 718]
        
    pdf.draw_text t('statement_declaration_second.vehicle_block.color'), at: [5, 703]
    pdf.draw_text @declaration.vehicle_color, at: [190, 703]
        
    pdf.draw_text t('statement_declaration_second.vehicle_block.regnum'), at: [5, 688]
    pdf.draw_text @declaration.vehicle_regnum, at: [190, 688]

    pdf.draw_text t('statement_declaration_second.vehicle_block.vin'), at: [5, 673]
    pdf.draw_text @declaration.vehicle_vin, at: [190, 673]

    pdf.draw_text t('statement_declaration_second.vehicle_block.body'), at: [5, 658]
    pdf.draw_text @declaration.vehicle_body, at: [190, 658]
        
    pdf.draw_text t('statement_declaration_second.vehicle_block.chassis'), at: [5, 643]
    pdf.draw_text @declaration.vehicle_chassis, at: [190, 643]

    pdf.draw_text t('statement_declaration_second.vehicle_block.power'), at: [5, 628]
    pdf.draw_text @declaration.vehicle_power_hp.to_s + '/' + @declaration.vehicle_power_kvt.to_s, at: [190, 628]

    pdf.draw_text t('statement_declaration_second.vehicle_block.ecological'), at: [5, 613]
    pdf.draw_text @declaration.vehicle_ecological_class, at: [190, 613]

    pdf.draw_text t('statement_declaration_second.vehicle_block.max_weight'), at: [5, 598]
    pdf.draw_text @declaration.vehicle_weight_max, at: [190, 598]

    pdf.draw_text t('statement_declaration_second.vehicle_block.min_weight'), at: [5, 583]
    pdf.draw_text @declaration.vehicle_weight_min, at: [190, 583]


    pdf.draw_text t('statement_declaration_second.vehicle_block.confirm'), at: [130, 570]
    pdf.draw_text t('statement_declaration_second.vehicle_block.date'), at: [10, 545], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 545], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 545], size: 8

    ###################################
    # changes block
    ###################################
    pdf.rectangle [0, 535], 565, 80
    pdf.horizontal_line 0, 565, at: 485
    pdf.vertical_line 535, 485, at: 262
    pdf.horizontal_line 266, 560, at: 520
    pdf.horizontal_line 266, 560, at: 505
    pdf.horizontal_line 266, 560, at: 490
    pdf.horizontal_line 5, 555, at: 465

    pdf.bounding_box([4, 532], width: 257, height: 48) do
      #pdf.stroke_bounds
      pdf.text "<b>#{t('statement_declaration_second.changes_block.heading').mb_chars.upcase.to_s}</b> <font size='8'>#{t('statement_declaration_second.changes_block.heading_link')}</font>", inline_format: true
    end
    
    pdf.draw_text t('statement_declaration_second.vehicle_block.date'), at: [10, 458], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 458], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 458], size: 8

    ###################################
    # decision block
    ###################################
    pdf.rectangle [0, 450], 565, 155
    pdf.horizontal_line 0, 565, at: 400
    pdf.horizontal_line 0, 565, at: 370
    pdf.horizontal_line 0, 565, at: 325
    pdf.vertical_line 450, 400, at: 170
    pdf.vertical_line 370, 325, at: 170
    pdf.horizontal_line 5, 555, at: 380
    pdf.horizontal_line 5, 555, at: 305

    pdf.bounding_box([4, 445], width: 165, height: 40) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration_second.wanted_block.heading').mb_chars.upcase.to_s, align: :center, style: :bold
    end

    pdf.draw_text t('statement_declaration_second.wanted_block.date'), at: [10, 374], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 374], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 374], size: 8

    pdf.bounding_box([4, 359], width: 165, height: 30) do
      #pdf.stroke_bounds
      pdf.text t('statement_declaration_second.decision_block.heading').mb_chars.upcase.to_s, align: :center, style: :bold
    end

    pdf.draw_text t('statement_declaration_second.decision_block.date'), at: [10, 298], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 298], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 298], size: 8
    
    ###################################
    # taken block
    ###################################
    pdf.rectangle [0, 290], 565, 145
    pdf.horizontal_line 0, 565, at: 275
    pdf.horizontal_line 0, 565, at: 260
    pdf.horizontal_line 0, 565, at: 245
    pdf.horizontal_line 0, 565, at: 230
    pdf.horizontal_line 0, 565, at: 215
    pdf.horizontal_line 0, 565, at: 200
    pdf.horizontal_line 0, 565, at: 185
    pdf.vertical_line 275, 185, at: 350
    pdf.horizontal_line 5, 555, at: 157

    pdf.draw_text t('statement_declaration_second.taken_documents_block.heading').mb_chars.upcase.to_s, style: :bold, at: [195, 279]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.regnum'), at: [5, 264]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.veh_passport'), at: [5, 249]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.own_doc'), at: [5, 234]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.insurance'), at: [5, 219]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.other'), at: [5, 204]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.payment'), at: [5, 189]
    pdf.draw_text t('statement_declaration_second.taken_documents_block.checked'), at: [230, 175]

    pdf.draw_text t('statement_declaration_second.taken_documents_block.date'), at: [10, 150], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 150], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 150], size: 8

    ###################################
    # issue block
    ###################################
    pdf.rectangle [0, 140], 565, 105
    pdf.horizontal_line 0, 565, at: 125
    pdf.horizontal_line 0, 565, at: 110
    pdf.horizontal_line 0, 565, at: 95
    pdf.horizontal_line 0, 565, at: 80
    pdf.horizontal_line 0, 565, at: 65
    pdf.vertical_line 125, 65, at: 350
    pdf.horizontal_line 5, 555, at: 48

    pdf.draw_text t('statement_declaration_second.get_documents_block.heading').mb_chars.upcase.to_s, style: :bold, at: [210, 127]

    pdf.draw_text t('statement_declaration_second.get_documents_block.regnum'), at: [5, 112]
    pdf.draw_text t('statement_declaration_second.get_documents_block.veh_passport'), at: [5, 97]
    pdf.draw_text t('statement_declaration_second.get_documents_block.sts'), at: [5, 82]
    pdf.draw_text t('statement_declaration_second.get_documents_block.other'), at: [5, 67]

    pdf.draw_text t('statement_declaration_second.get_documents_block.date'), at: [10, 41], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 41], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 41], size: 8

    ###################################
    # sign block
    ###################################
    pdf.rectangle [0, 30], 565, 30
    pdf.horizontal_line 5, 555, at: 13

    pdf.draw_text t('statement_declaration_second.sign_block.date'), at: [10, 6], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.sign'), at: [250, 6], size: 8
    pdf.draw_text t('statement_declaration_second.vehicle_block.official'), at: [450, 6], size: 8
  end
end
