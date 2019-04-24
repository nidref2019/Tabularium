package  org.nidref.tabularium.model.adapter; 
								
import java.sql.Connection; 
import java.sql.PreparedStatement; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
								
import org.nidref.core.Implem.AdapterImplementation; 
import org.nidref.tabularium.model.container.TabulariumAssessmentContainer; 
import org.nidref.tabularium.model.entity.TabulariumAssessmentEntity; 
								
public class TabulariumAssessmentAdapter extends AdapterImplementation{ 
	TabulariumAssessmentEntity lEntity = (TabulariumAssessmentEntity)entity; 
	TabulariumAssessmentContainer lContainer = (TabulariumAssessmentContainer)container; 
	public TabulariumAssessmentAdapter(TabulariumAssessmentEntity pEntity){ 
		super(pEntity); 
	}							
								
	public TabulariumAssessmentAdapter(TabulariumAssessmentContainer pContainer){
		super(pContainer); 
	} 							
								
	public PreparedStatement getLoadStatement(Connection con) throws SQLException{ 
 												
		PreparedStatement pstmt; 
		StringBuffer st = new StringBuffer(); 
		st.append("SELECT          "); 
		st.append(" *              "); 
		st.append("FROM            "); 
		st.append(" tabularium_assessment     "); 
		st.append("WHERE           "); 
		st.append(" ASSESSMENT_ID = ? AND "); 
		st.append(" DELETED_FL = 'N' "); 
												
		pstmt = con.prepareStatement(st.toString()); 
													
		int i = 1;	
		pstmt.setLong(i++, lEntity.getAssessmentId()); 
		return pstmt; 
	}												
	public PreparedStatement getCreateStatement(Connection con) throws SQLException{ 
									  
		PreparedStatement pstmt;   
		StringBuffer st = new StringBuffer();  
		st.append("INSERT INTO       ");  
		st.append(" tabularium_assessment (     ");  
		st.append(" ASSESSMENT_CD,  "); 
		st.append(" INTERACTION_ID,  "); 
		st.append(" INTERACTION_TYPE_ID,  "); 
		st.append(" DIAGNOSIS_ID,  "); 
		st.append(" COMMENTS_DE,  "); 
		st.append(" STATUS_DE,  "); 
		st.append(" CREATE_DT,  "); 
		st.append(" UPDATE_DT,  "); 
		st.append(" DELETED_FL  "); 
		st.append("  )               ");  
		st.append("  VALUES (        ");  
		st.append(" ? ,  "); 
		st.append(" ? ,  "); 
		st.append(" ? ,  "); 
		st.append(" ? ,  "); 
		st.append(" ? ,  "); 
		st.append(" ? ,  "); 
		st.append(" NOW() ,  "); 
		st.append(" NOW() ,  "); 
		st.append(" 'N'   "); 
		st.append("  )               ");  
		pstmt = con.prepareStatement(st.toString());  
													 
													 
		int i = 1;									 
		pstmt.setString(i++, lEntity.getAssessmentCd().toString()); 
		pstmt.setLong(i++, lEntity.getInteractionId()); 
		pstmt.setLong(i++, lEntity.getInteractionTypeId()); 
		pstmt.setLong(i++, lEntity.getDiagnosisId()); 
		pstmt.setString(i++, lEntity.getCommentsDe().toString()); 
		pstmt.setString(i++, lEntity.getStatusDe().toString()); 
		 											
		return pstmt;	 							
	}									 			
	public PreparedStatement getUpdateStatement(Connection con) throws SQLException{ 
													 
		if (lEntity.getUpdateType() == TabulariumAssessmentEntity.UPDATE_BY_CD){ 
			return getUpdateStatementByCd(con); 
		}else if(lEntity.getUpdateType() == TabulariumAssessmentEntity.UPDATE_BY_ID){ 
			return getUpdateStatementById(con); 
		} 
													 
		else { 
													 
		return null;								 
		}											 
	}												 
	public PreparedStatement getUpdateStatementByCd(Connection con) throws SQLException{ 
												 
		PreparedStatement pstmt; 
		StringBuffer st = new StringBuffer(); 
												 
		st.append("UPDATE                    "); 
		st.append(" tabularium_assessment                "); 
		st.append("  SET                     "); 
		st.append(" ASSESSMENT_CD  = ?,  "); 
		st.append(" INTERACTION_ID  = ?,  "); 
		st.append(" INTERACTION_TYPE_ID  = ?,  "); 
		st.append(" DIAGNOSIS_ID  = ?,  "); 
		st.append(" COMMENTS_DE  = ?,  "); 
		st.append(" STATUS_DE  = ?,  "); 
		st.append("      UPDATE_DT = NOW()   "); 
		st.append(" WHERE                     "); 
		st.append(" ASSESSMENT_CD  = ?  "); 
													 
		pstmt = con.prepareStatement(st.toString()); 
													 
		int i = 1; 
		pstmt.setLong(i++, lEntity.getInteractionId()); 
		pstmt.setLong(i++, lEntity.getInteractionTypeId()); 
		pstmt.setLong(i++, lEntity.getDiagnosisId()); 
		pstmt.setString(i++, lEntity.getCommentsDe().toString()); 
		pstmt.setString(i++, lEntity.getStatusDe().toString()); 
		pstmt.setString(i++, lEntity.getAssessmentCd().toString()); 
		return pstmt;  
	}							 
	public PreparedStatement getUpdateStatementById(Connection con) throws SQLException{ 
												 
		PreparedStatement pstmt; 
		StringBuffer st = new StringBuffer(); 
												 
		st.append("UPDATE                    "); 
		st.append(" tabularium_assessment                "); 
		st.append("  SET                     "); 
		st.append(" ASSESSMENT_CD  = ?,  "); 
		st.append(" INTERACTION_ID  = ?,  "); 
		st.append(" INTERACTION_TYPE_ID  = ?,  "); 
		st.append(" DIAGNOSIS_ID  = ?,  "); 
		st.append(" COMMENTS_DE  = ?,  "); 
		st.append(" STATUS_DE  = ?,  "); 
		st.append("      UPDATE_DT = NOW()   "); 
		st.append(" WHERE                     "); 
		st.append(" ASSESSMENT_ID  = ?  "); 
													 
		pstmt = con.prepareStatement(st.toString()); 
													 
		int i = 1; 
		pstmt.setString(i++, lEntity.getAssessmentCd().toString()); 
		pstmt.setLong(i++, lEntity.getInteractionId()); 
		pstmt.setLong(i++, lEntity.getInteractionTypeId()); 
		pstmt.setLong(i++, lEntity.getDiagnosisId()); 
		pstmt.setString(i++, lEntity.getCommentsDe().toString()); 
		pstmt.setString(i++, lEntity.getStatusDe().toString()); 
		pstmt.setLong(i++, lEntity.getAssessmentId()); 
		return pstmt;  
	}							 
	public PreparedStatement getDeleteStatement(Connection con) throws SQLException{ 
								 
		PreparedStatement pstmt; 
		StringBuffer st = new StringBuffer(); 
		st.append("UPDATE                           "); 
		st.append(" tabularium_assessment                "); 
		st.append("SET                              "); 
		st.append(" DELETED_FL = 'Y',               "); 
		st.append(" UPDATE_DT = NOW()               "); 
		st.append("WHERE                            "); 
		st.append(" ASSESSMENT_ID  = ?  "); 
										 
		pstmt = con.prepareStatement(st.toString()); 
										 
		int i = 1; 
		pstmt.setLong(i++, lEntity.getAssessmentId()); 
										 
										 
		return pstmt;					 
										 
	}									 
	public PreparedStatement getBulkLoadStatement(Connection con) throws SQLException{ 
								 
		PreparedStatement pstmt; 
		StringBuffer st = new StringBuffer(); 
		st.append("SELECT       "); 
		st.append(" *           "); 
		st.append("FROM         "); 
		st.append(" tabularium_assessment  "); 
		st.append("WHERE        "); 
		st.append(" ASSESSMENT_CD  LIKE ? AND "); 
		st.append(" DELETED_FL='N'        "); 
		pstmt = con.prepareStatement(st.toString()); 
										 
		int i =1; 
		if(lContainer.getAssessmentCd() == null && lContainer.getAssessmentCd().length() == 0){ 
			lContainer.setAssessmentCd("%"); 
		}else{ 
			pstmt.setString(i++, lContainer.getAssessmentCd().toString() + "%"); 
		} 
		 
		 
		return pstmt; 
	} 
	public TabulariumAssessmentEntity getRestore(ResultSet rs) throws SQLException{ 
		TabulariumAssessmentEntity tabularium_assessmentEntity = new TabulariumAssessmentEntity(); 
		while(rs.next()){ 
		tabularium_assessmentEntity.setAssessmentId(rs.getLong("ASSESSMENT_ID")); 
		tabularium_assessmentEntity.setAssessmentCd(rs.getString("ASSESSMENT_CD").toString()); 
		tabularium_assessmentEntity.setInteractionId(rs.getLong("INTERACTION_ID")); 
		tabularium_assessmentEntity.setInteractionTypeId(rs.getLong("INTERACTION_TYPE_ID")); 
		tabularium_assessmentEntity.setDiagnosisId(rs.getLong("DIAGNOSIS_ID")); 
		tabularium_assessmentEntity.setCommentsDe(rs.getString("COMMENTS_DE").toString()); 
		tabularium_assessmentEntity.setStatusDe(rs.getString("STATUS_DE").toString()); 
		tabularium_assessmentEntity.setCreateDt(rs.getString("CREATE_DT").toString()); 
		tabularium_assessmentEntity.setUpdateDt(rs.getString("UPDATE_DT").toString()); 
		tabularium_assessmentEntity.setDeletedFl(rs.getString("DELETED_FL").toString()); 
		} 
		return tabularium_assessmentEntity;  
	} 
	public TabulariumAssessmentContainer getBulkRestore(ResultSet rs) throws SQLException{ 
		TabulariumAssessmentContainer tabularium_assessmentContainer = new TabulariumAssessmentContainer(); 
		while(rs.next()){ 
		TabulariumAssessmentEntity tabularium_assessmentEntity = new TabulariumAssessmentEntity(); 
		tabularium_assessmentEntity.setAssessmentId(rs.getLong("ASSESSMENT_ID")); 
		tabularium_assessmentEntity.setAssessmentCd(rs.getString("ASSESSMENT_CD").toString()); 
		tabularium_assessmentEntity.setInteractionId(rs.getLong("INTERACTION_ID")); 
		tabularium_assessmentEntity.setInteractionTypeId(rs.getLong("INTERACTION_TYPE_ID")); 
		tabularium_assessmentEntity.setDiagnosisId(rs.getLong("DIAGNOSIS_ID")); 
		tabularium_assessmentEntity.setCommentsDe(rs.getString("COMMENTS_DE").toString()); 
		tabularium_assessmentEntity.setStatusDe(rs.getString("STATUS_DE").toString()); 
		tabularium_assessmentEntity.setCreateDt(rs.getString("CREATE_DT").toString()); 
		tabularium_assessmentEntity.setUpdateDt(rs.getString("UPDATE_DT").toString()); 
		tabularium_assessmentEntity.setDeletedFl(rs.getString("DELETED_FL").toString()); 
		tabularium_assessmentContainer.add(tabularium_assessmentEntity); 
		} 
		return tabularium_assessmentContainer; 
	} 
								
}	
