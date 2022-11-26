Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF31FD3
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:52:00 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AQEIZbk016827
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
 b=CJzq8Z+8xWdKXMdwRdCOqwChi17A0pO0XrzUb7d5cUqbzzkeZRplTfI22pUnm4H3M698
 EXsFMXo6ReszxpDfqu2yb/L/Ou+Mdlq8rZ2XWfW/fK0bUHo98cQav+2KFJmVLWe+/uaU
 5agU+AU+zOiJBFHho4VeOLapqwYz+n0uI5W+V2bDHml1OFYHktUM2Ep5xd+pvfg+8oq4
 3eN67HeRRHKMBYjSAtEJ/Xg5eAHZg+795jkZHU0GySsPXAkDtSrT/3g8tVt0jHZyE69O
 9+I9hCvblc06pGyrXh1JgJok8TyXUvs/U7/dlr7DtSN2HvNd0ivnWyNYR/tWLjAwpLCy 2g== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3eqjxjqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AQGpqc5014981
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae98hry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AQGpotN4784860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53A04A404D
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EF0AA4040
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:49 +0000 (GMT)
Received: from li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com (unknown [9.43.103.29])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:51:49 +0000 (GMT)
Date: Sat, 26 Nov 2022 22:21:37 +0530
From: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
To: linux-staging@lists.linux.dev
Subject: subscribe
Message-ID: <Y4JEGXjLNcUmFXe7@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tZoeb8eUVyiAs9tu21hIYmUflutglkk1
X-Proofpoint-ORIG-GUID: tZoeb8eUVyiAs9tu21hIYmUflutglkk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-26_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=522 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211260132

subscribe
