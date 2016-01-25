class Declaration < ActiveRecord::Base
  paginates_per 20

  validates :operation_id, presence: true

  belongs_to :user

  scope :by_create_date_asc, -> { order(created_at: :asc) }
  scope :by_create_date_desc, -> { order(created_at: :desc) }
  scope :belongs_to_user, -> { where("COALESCE(user_id, 0) != 0") }
  scope :not_belongs_to_user, -> { where(user_id: nil) }

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

  def trust_doc
    return '' if !self.trustee?
    trust_doc = "#{I18n.t('statement_declaration.trustee_block.entity')}: "
    trust_doc += "#{Declaration.human_attribute_name('trustee_series')}: #{self.trustee_series} " if self.trustee_series.present?
    trust_doc += "#{Declaration.human_attribute_name('trustee_number')}: #{self.trustee_number} " if self.trustee_number.present?
    trust_doc += "#{Declaration.human_attribute_name('trustee_date')}: #{self.trustee_date.strftime('%d.%m.%Y')} " if self.trustee_date.present?
    trust_doc += "#{Declaration.human_attribute_name('trustee_dept')}: #{self.trustee_dept} " if self.trustee_dept.present?
  end
end
