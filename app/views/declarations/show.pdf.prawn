prawn_document(page_size: 'A4', margin: 15) do |pdf|
  pdf.font_families.update(
  'times' => {
    :bold => '/Users/zlodimir/ruby_projects/declarations_fonts/TimesNewRomanBold.ttf',
    :italic => '/Users/zlodimir/ruby_projects/declarations_fonts/TimesNewRomanItalic.ttf',
    :normal  => '/Users/zlodimir/ruby_projects/declarations_fonts/TimesNewRomanRegular.ttf' })

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
end
