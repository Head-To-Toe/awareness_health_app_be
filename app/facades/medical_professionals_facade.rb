class MedicalProfessionalsFacade
  class << self
    def get_medical_professionals(type, state)
      case type
      when 'doctor'
        care_givers = MedicalProfessionals::IndexService.get_all_vetted_doctors(state)
      when 'mhp'
        care_givers = MedicalProfessionals::IndexService.get_all_vetted_mhps(state)
      end
      OpenStruct.new(id: nil, list: care_givers)
    end

    def create_doctor_records(doctor_params, insurances, specialties, profession)
      MedicalProfessionals::CreateService.create_doctor(doctor_params, insurances, specialties, profession)
    end

    def create_mhp_records(mhp_params, insurances, specialties, profession)
      MedicalProfessionals::CreateService.create_mhp(mhp_params, insurances, specialties, profession)
    end

    def update_doctor_or_mhp_record(first_name, last_name)
      MedicalProfessionals::UpdateService.update_doctor_or_mhp(first_name, last_name)
    end

    def delete_doctor_or_mhp_record(first_name, last_name)
      MedicalProfessionals::DeleteService.delete_doctor_or_mhp(first_name, last_name)
    end
  end
end
