class Declaration < ActiveRecord::Base

  validates :operation_id, presence: true

  def owner_name
    [self.owner_last_name, self.owner_first_name, self.owner_second_name].join(' ')
  end

  def trustee_name
    [self.trustee_last_name, self.trustee_first_name, self.trustee_second_name].join(' ')
  end

  def trustee?
    trustee_name.present?
  end

  def owner_document
    document = self.owner_doc_series + ' ' + self.owner_doc_number
    document += ' ' + I18n.t('declaration_form.issue') + ' ' + self.owner_doc_dept if self.owner_doc_dept.present?
    document += ' ' + self.owner_doc_date.strftime('%d.%m.%Y') if self.owner_doc_date.present?
  end

  def trustee_document
    document = self.trustee_doc_series + ' ' + self.trustee_doc_number
    document += ' ' + I18n.t('declaration_form.issue') + ' ' + self.trustee_doc_dept if self.trustee_doc_dept.present?
    document += ' ' + self.trustee_doc_date.strftime('%d.%m.%Y') if self.trustee_doc_date.present?
  end

  def sign_person
    if trustee? 
      sign_person = self.trustee_first_name.chars.first.upcase + '. ' if self.trustee_first_name.present?
      sign_person += self.trustee_second_name.chars.first.upcase + '. ' if self.trustee_second_name.present?
      sign_person += self.trustee_last_name.upcase if self.trustee_last_name.present?
    else
      sign_person = self.owner_first_name.chars.first.upcase + '. ' if self.owner_first_name.present?
      sign_person += self.owner_second_name.chars.first.upcase + '. ' if self.owner_second_name.present?
      sign_person += self.owner_last_name.upcase if self.owner_last_name.present?
    end

    return sign_person
  end
end
