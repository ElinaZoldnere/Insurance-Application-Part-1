package lv.javaguru.travel.insurance.core.repositories.entities;

import lv.javaguru.travel.insurance.core.domain.entities.AgreementPersonEntity;
import lv.javaguru.travel.insurance.core.domain.entities.AgreementPersonRisksEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AgreementPersonRisksEntityRepository extends JpaRepository<AgreementPersonRisksEntity, Long> {
    List<AgreementPersonRisksEntity> findByAgreementPersonEntity(AgreementPersonEntity agreementPersonEntity);

}
