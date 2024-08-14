package com.wit.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wit.dao.EApprovalDAO;
import com.wit.dto.ApprLineDTO;
import com.wit.dto.DocuDTO;
import com.wit.dto.DocuInfoListDTO;
import com.wit.dto.DocuListDTO;
import com.wit.dto.LatenessDTO;
import com.wit.dto.LeaveRequestDTO;
import com.wit.dto.RefeLineDTO;
import com.wit.dto.WorkPropDTO;

@Service
public class EApprovalService {

	@Autowired
	private EApprovalDAO dao;

	// 문서 상태에 따라 해당 사원이 작성한 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectByStatus(String status, String empNo) {
		return dao.selectByStatus(status, empNo);
	}

	// 문서 양식 목록을 넘겨주기 위한 메서드
	public List<DocuListDTO> getDocuList() {
		return dao.getDocuList();
	}

	// 해당 사원이 결재 문서를 작성 완료 or 임시 저장 했을 때 데이터를 입력 후 SEQ 값을 받아오기 위한 메서드
	public int insertDocu(DocuDTO dto) {
		return dao.insertDocu(dto);
	}

	// 결재 라인에 대한 정보를 저장하기 위한 메서드
	public void setApprLine(ApprLineDTO dto) {
		dao.setApprLine(dto);
	}

	// 참조 라인에 대한 정보를 저장하기 위한 메서드
	public void createRefeLine(int docuSeq, String empNo) {
		dao.createRefeLine(docuSeq, empNo);
	}

	// 업무 기안 문서에 대한 데이터를 입력하기 위한 메서드
	public void insertPropDocu(WorkPropDTO dto) {
		dao.insertPropDocu(dto);
	}

	// 지각 사유서 문서에 대한 데이터를 입력하기 위한 메서드
	public void insertLateDocu(LatenessDTO dto) {
		dao.insertLateDocu(dto);
	}

	// 휴가 신청서 문서에 대한 데이터를 입력하기 위한 메서드
	public void insertLeaveDocu(LeaveRequestDTO dto) {
		dao.insertLeaveDocu(dto);
	}
/*
	// 해당 문서의 정보를 업데이트하기 위한 메서드
	public void updateDocu(int docuSeq, String title, String emerYN) {
		dao.updateBySave(docuSeq, title, emerYN);
	} */
	
	// 해당 사원의 문서함 중 결재 대기 or 결재 예정 문서 목록을 문서 종류에 따라 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectListByType(String empNo, String status, String docuCode) {
		return dao.selectListByType(empNo, status, docuCode);
	}

	// 해당 사원이 기안한 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectWriteList(String empNo, String docuCode) {
		return dao.selectWriteList(empNo, docuCode);
	}

	// 해당 사원이 임시 저장한 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selecSavetList(String empNo, String docuCode) {
		return dao.selectSaveList(empNo, docuCode);
	}

	// 해당 사원이 결재한 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectApprovedList(String empNo, String docuCode) {
		return dao.selectApprovedList(empNo, docuCode);
	}

	// 해당 사원이 반려한 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectReturnList(String empNo, String docuCode) {
		return dao.selectReturnList(empNo, docuCode);
	}

	// 해당 사원이 참조자인 문서 목록을 넘겨주기 위한 메서드
	public List<DocuInfoListDTO> selectViewList(String empNo, String docuCode) {
		return dao.selectViewList(empNo, docuCode);
	}

	// 해당 문서의 정보를 넘겨주기 위한 메서드
	public DocuDTO getDocuInfo(int docuSeq) {
		return dao.getDocuInfo(docuSeq);
	}

	// 해당 업무 기안 문서의 세부 정보를 넘겨주기 위한 메서드
	public WorkPropDTO getPropDetail(int docuSeq) {
		return dao.getPropDetail(docuSeq);
	}

	// 해당 휴가 신청서 문서의 세부 정보를 넘겨주기 위한 메서드
	public LeaveRequestDTO getLeaveDetail(int docuSeq) {
		return dao.getLeaveDetail(docuSeq);
	}

	// 해당 지각 사유서 문서의 세부 정보를 넘겨주기 위한 메서드
	public LatenessDTO getLatenessDetail(int docuSeq) {
		return dao.getLatenessDetail(docuSeq);
	}

	// 해당 문서의 결재 라인 정보를 넘겨주기 위한 메서드
	public List<ApprLineDTO> getApprLine(int docuSeq) {
		return dao.getApprLine(docuSeq);
	}

	// 해당 문서의 참조 라인 정보를 넘겨주기 위한 메서드
	public List<RefeLineDTO> getRefeLine(int docuSeq) {
		return dao.getRefeLine(docuSeq);
	}
}
