Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7E30B520;
	Thu,  8 Jan 2026 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896182; cv=none; b=fL2omfOF1xmOzuR47UB5ap1zAk6YCJiB07Yvw9uwxeyMVOfHWwyKplaX+y0QHCbDBGLbRhTSBl4KalLJAmemk1Odd9jXdk8moAqDFoMaO5y1eph2F3IELUJM98mtt3lXUQMVGkgf0PhfGU7W+1xMmCe8QNf8kzQieGS8W8iFBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896182; c=relaxed/simple;
	bh=sZRB5ktDgcC1U4Hw94NPfel+n9hHWmhuDc3eO/6BrZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e0g1Rn3IVii1V/fG4guX4AAzPVFvnxhaO4FgnbqgVCSqxawWVoE7HsCoIMEJC3JutNkXsiETTNNy2h2hlqLLQhhYgT00B6Ce+eI2Dbcv/3uAlrvIZwh86pdLAFjqL7cJVAZm3RTc8Fw/mcRbZYO2+V6IX6HedBYWfqv2wo8u0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cq3N8xY0; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cq3N8xY0"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608GnZ59742042;
	Thu, 8 Jan 2026 18:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=qIf42gd+GkwdyCT7+FhrymDfNzY8q
	KbgYS+GqLSiwyE=; b=cq3N8xY0AkZXsxw0D5ZnE1/1ZSRR6S8ZK+DOiuviciUqm
	sjqjOiSy2NssEnD160lQ5xoLa53/XNryVORjc1K7bNLo5gffpMPrGoyyOkkZc8EF
	z7TQA6dueZz/OdV3OPPgWvgIpM3b4nLR+w4jyovdRuVN4G4LDJBmsFnPPFvN8OSp
	9pUyz2BeuwOPxtstrmXM0WpjfM39FrBnzBUbqoFGDqLWwjORanSZzJnhDAnqqwbp
	C91T8mNAurYMe8Cwow6lIyC+AIQnXONm/Hmj4gF8Fgs9yh5eMBzKRVxgy9OD1NZg
	rl8oajXHkRpVeHK4YXLcxd0NmdV+sx663siqBI6xg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjgep049t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:16:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608GYJ0c019956;
	Thu, 8 Jan 2026 18:16:12 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besjb58a9-1;
	Thu, 08 Jan 2026 18:16:12 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8723bs: fix error handling and memory leaks
Date: Thu,  8 Jan 2026 10:16:08 -0800
Message-ID: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080135
X-Proofpoint-GUID: 0QUkcxC0k65imhLkZAoxGjNlUXWljsBM
X-Authority-Analysis: v=2.4 cv=S9LUAYsP c=1 sm=1 tr=0 ts=695ff46d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=xor1aQZeT0SzzTxr8toA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzNSBTYWx0ZWRfX4o27iO5OUqzK
 6xcFVEUZ4ifHUtf4Fxs83UHNXuWPd9+wLj5DKt/jZyn/qQ5oQudMc742u/UF1b0YXR+qGQAfgN9
 +GD7ATLkf2B63nvweg6OEVR+b0oudWLfGvp+PkL/S6Wv/+MNOvXCHwETncS1nsntzOKALbpoF/X
 SVboAVKfVq7zyxInAe9mZ9YnkhUWWROtMWGhxDPD3z8R1+eD3Za7c7PvJvWKWRGhl4aVsvKvDdU
 AK5SaqUu1/4su214B3grUEygWFmwtqCl/Oqgpj5wfUTEj172IPS9UdRHpB15zemcWFWnPHuj+Y7
 MDv10FeBzF0GRvMfmGtuLO9KJV1tenm9owhfqS7R9/cVGix8V2SIBgw7/HvKvlYAwtguZQCPX1p
 uaenZtuS4RyIr8K8+zBXIAJKOepW+ltMwKyT/1TqOhjmtMShR7YsIr8O92tmMLEjqy4SnRlhGgC
 QH5sy9BRFG5G0dCAdGw==
X-Proofpoint-ORIG-GUID: 0QUkcxC0k65imhLkZAoxGjNlUXWljsBM

This series fixes memory leaks and missing error checks in rtl8723bs:

1. Firmware not released on error paths in rtl8723b_FirmwareDownload().
2. Buffer not freed when cfg80211_inform_bss_frame() fails.
3. Missing IS_ERR() check for kthread_run() in rtl8723b_start_thread().

Changes in v2:
-> Patch 1: Call release_firmware() directly in error paths instead of
using intermediate goto label.
-> Dropped patch 4 (rtw_wdev_alloc) to study cleanup chain further.

Samasth Norway Ananda (3):
  staging: rtl8723bs: fix firmware memory leak on error
  staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
  staging: rtl8723bs: add IS_ERR() check for kthread_run()

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++++
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.50.1

