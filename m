Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2B79C9
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:08 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDJVsO9006409
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=m9g5TtoHBfKTClDYE7UXQKcMBl23tpL33BltAO7ChyM=;
 b=HftxAckHoixcm6ZisaoNGGKEMcNl0ea6c+fnWtAbKE2g+aT2odyBQKnMjQEfx9AErV9U
 n3eWd2kbUe3Kl7W1LWYFAErWGk5EIz1/JY4SULMXjBnGhYrV6cHEKickSb4O9ye4DIJ4
 DCSwo/KplBqRX8v2W70242x/DqITa/8NHwCjoIUofCo2eOte2EawVkPG97w/SJoCWyiV
 EHF6fA/TYrx3lFfWPOGElSvHGhLrwS0wCc6HK394KHiBAy8HT5h78KJDVOaJgjuVvEmg
 joobdiD4Dx1jRWQC9FyCLkpTVSb9UnIdHcbKQhomsCaNCvWIhFwmWxjiCaw8nxoyRUn1 HA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3meymr8dus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BDJaxAP024651
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3meypyg0cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BDJq0gn22086320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3536120049
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:52:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60BDE20040
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:51:59 +0000 (GMT)
Received: from li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com (unknown [9.43.94.137])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS
	for <linux-staging@lists.linux.dev>; Tue, 13 Dec 2022 19:51:59 +0000 (GMT)
Date: Wed, 14 Dec 2022 01:21:52 +0530
From: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
To: linux-staging@lists.linux.dev
Subject: subscribe linux-staging
Message-ID: <Y5jX2Jr58ouioDUg@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kL03FWkDpOhSqd9_jvhIg3kXMoYyczVk
X-Proofpoint-ORIG-GUID: kL03FWkDpOhSqd9_jvhIg3kXMoYyczVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=673 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212130171

subscribe linux-staging@lists.linux.dev
