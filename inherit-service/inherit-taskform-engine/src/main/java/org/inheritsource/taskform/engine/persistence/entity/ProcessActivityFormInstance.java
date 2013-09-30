/* 
 *  Process Aware Web Application Platform 
 * 
 *  Copyright (C) 2011-2013 Inherit S AB 
 * 
 *  This program is free software: you can redistribute it and/or modify 
 *  it under the terms of the GNU Affero General Public License as published by 
 *  the Free Software Foundation, either version 3 of the License, or 
 *  (at your option) any later version. 
 * 
 *  This program is distributed in the hope that it will be useful, 
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 *  GNU Affero General Public License for more details. 
 * 
 *  You should have received a copy of the GNU Affero General Public License 
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>. 
 * 
 *  e-mail: info _at_ inherit.se 
 *  mail: Inherit S AB, Långsjövägen 8, SE-131 33 NACKA, SWEDEN 
 *  phone: +46 8 641 64 14 
 */ 
 
package org.inheritsource.taskform.engine.persistence.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="mtf_process_activity_form_instance")
public class ProcessActivityFormInstance {
	
	@Id
	@GeneratedValue
	Long processActivityFormInstanceId;
	
	/**
	 * If null, this is a not submitted start form
	 */
	String processInstanceUuid;
	
	/**
	 * If not null, this is a start form instance
	 */
	@ManyToOne
    @JoinColumn(name="startFormDefinitionId", nullable=true)
	StartFormDefinition startFormDefinition;
	
	/**
	 * if null, this is a start form
	 */
	String activityInstanceUuid;
	
	/**
	 * Data id that holds filled in form data
	 */
	@Column(unique=true, nullable=false)
	String formDocId;
	
	/**
	 * Form path to form definition
	 */
	@Column(nullable=false)
	String formPath;
	
	/**
	 * If null, this form is still not submitted, otherwise submission time stamp.
	 */
	Date submitted = null;
	
	/**
	 * The last writer to this instance
	 */
	@Column(nullable=false)
	String userId;
	// TODO rename userId to userUuid
	
	@OneToMany
	@JoinColumn(name="processActivityFormInstanceId")
	Set<ProcessActivityTag> processActivityTags; 
	
	public ProcessActivityFormInstance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getProcessActivityFormInstanceId() {
		return processActivityFormInstanceId;
	}

	public void setProcessActivityFormInstanceId(Long processActivityFormInstanceId) {
		this.processActivityFormInstanceId = processActivityFormInstanceId;
	}

	public String getProcessInstanceUuid() {
		return processInstanceUuid;
	}

	public void setProcessInstanceUuid(String processInstanceUuid) {
		this.processInstanceUuid = processInstanceUuid;
	}

	public String getActivityInstanceUuid() {
		return activityInstanceUuid;
	}

	public void setActivityInstanceUuid(String activityInstanceUuid) {
		this.activityInstanceUuid = activityInstanceUuid;
	}

	public String getFormDocId() {
		return formDocId;
	}

	public void setFormDocId(String formDocId) {
		this.formDocId = formDocId;
	}

	public String getFormPath() {
		return formPath;
	}

	public void setFormPath(String formPath) {
		this.formPath = formPath;
	}

	public Date getSubmitted() {
		return submitted;
	}

	public void setSubmitted(Date submitted) {
		this.submitted = submitted;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public StartFormDefinition getStartFormDefinition() {
		return startFormDefinition;
	}

	public void setStartFormDefinition(StartFormDefinition startFormDefinition) {
		this.startFormDefinition = startFormDefinition;
	}

	public String calcEditUrl() {
		return getFormPath() + "/edit/" + getFormDocId() + "?orbeon-embeddable=true&pawap-mode=load-deps";
	}

	public String calcViewUrl() {
		// TODO Since orbeon 4.3 Iframe work-around exclude: orbeon-embeddable=true";
		//      note: remeber to include orbeon-embeddable=true when rendering
		//            in div tag
		//            It is imortant to exclude orbeon-embeddable=true when rendering in 
		//            IFRAME...
		
		return getFormPath() + "/view/" + getFormDocId() + "?"; 
	}

	public String calcPdfUrl() {
		return getFormPath() + "/pdf/" + getFormDocId();
	}
	
	public boolean isStartForm() {
		return (activityInstanceUuid == null);
	}
	
	public Set<ProcessActivityTag> getProcessActivityTags() {
		return processActivityTags;
	}

	public void setProcessActivityTags(Set<ProcessActivityTag> processActivityTags) {
		this.processActivityTags = processActivityTags;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((activityInstanceUuid == null) ? 0 : activityInstanceUuid
						.hashCode());
		result = prime * result
				+ ((formDocId == null) ? 0 : formDocId.hashCode());
		result = prime * result
				+ ((formPath == null) ? 0 : formPath.hashCode());
		result = prime
				* result
				+ ((processActivityFormInstanceId == null) ? 0
						: processActivityFormInstanceId.hashCode());
		result = prime
				* result
				+ ((processInstanceUuid == null) ? 0 : processInstanceUuid
						.hashCode());
		result = prime
				* result
				+ ((startFormDefinition == null) ? 0 : startFormDefinition
						.hashCode());
		result = prime * result
				+ ((submitted == null) ? 0 : submitted.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProcessActivityFormInstance other = (ProcessActivityFormInstance) obj;
		if (activityInstanceUuid == null) {
			if (other.activityInstanceUuid != null)
				return false;
		} else if (!activityInstanceUuid.equals(other.activityInstanceUuid))
			return false;
		if (formDocId == null) {
			if (other.formDocId != null)
				return false;
		} else if (!formDocId.equals(other.formDocId))
			return false;
		if (formPath == null) {
			if (other.formPath != null)
				return false;
		} else if (!formPath.equals(other.formPath))
			return false;
		if (processActivityFormInstanceId == null) {
			if (other.processActivityFormInstanceId != null)
				return false;
		} else if (!processActivityFormInstanceId
				.equals(other.processActivityFormInstanceId))
			return false;
		if (processInstanceUuid == null) {
			if (other.processInstanceUuid != null)
				return false;
		} else if (!processInstanceUuid.equals(other.processInstanceUuid))
			return false;
		if (startFormDefinition == null) {
			if (other.startFormDefinition != null)
				return false;
		} else if (!startFormDefinition.equals(other.startFormDefinition))
			return false;
		if (submitted == null) {
			if (other.submitted != null)
				return false;
		} else if (!submitted.equals(other.submitted))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProcessActivityFormInstance [processActivityFormInstanceId="
				+ processActivityFormInstanceId + ", processInstanceUuid="
				+ processInstanceUuid + ", startFormDefinition="
				+ startFormDefinition + ", activityInstanceUuid="
				+ activityInstanceUuid + ", formDocId=" + formDocId
				+ ", formPath=" + formPath + ", submitted=" + submitted
				+ ", userId=" + userId + "]";
	}

	
}
