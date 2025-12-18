Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002E243964;
	Thu, 18 Dec 2025 01:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020460; cv=none; b=Kk6IUFpa0GE5vCKWOSHwLh8mkGtMOPgEDmpjNDi/vcxBw3xMKoYmYLKN1ejME5qy42GpbkM0+dp7Jn3jl72kVJ2dZN9KyvSTyci+JkXEEKG08P89oyn/wg2JvJWcrp9qAluPzGAvZP8+N1cUz9/YWsf8xPatD+ICTLgnlgr3x3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020460; c=relaxed/simple;
	bh=DZmkBNn6fSAwHA+H+NQD/JFYsApKp1J7LL9Y/JmxmPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OE85Ymt8vtCz4VndWKgvAcs60QDcUGEzO0CvGcbT59AMbydf/XWutXQNeRWLkRTCjnY0YyXUV11qO1t+qjZiN8lDb9DfeXPqBuVmgyNcWBoAzD8x8DPLRoD39qCst55Ds27KnxVBHCjbhVrI8m9ePqh47Y0EP7afajJkb8HuWjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A1Bsns1o; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A1Bsns1o"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHMNWkQ3626095;
	Thu, 18 Dec 2025 01:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=Autse
	1JLYzzWPXq5qspQlHSixczYzbnfZMa6hV0R9p4=; b=A1Bsns1oric49jcHlwwm9
	Lc6fUrECwJ7RVky+WuYz8yOFm/CbuLFlCUCQ4lxcZ4afXE4aWOQ7nfmAFtIyLDf7
	g28Us7FzlorIqrK7Kl8FvCf1L1VHbUxzowUlXg+RbYp/A2X0L8aSd71dPaxwg+mt
	MPwMA2MnOG18EjescbCsYcDN6n/8eJGju3cp9zTtKKVtQjHFmixFT74ETKFgLph1
	usCArBkJCxCQbP2l42tEXNQ7IXxiO//emdygN56fyzTUjTPCmO0nK+LaxmZEJhif
	TVI9dauO1kJiE4iNX3tUQd9mYObIJELatOBTXWcM2JKvVWBg8InLiGfLrm0gkCdY
	g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b3xa2s5ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 01:14:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI195XS025249;
	Thu, 18 Dec 2025 01:14:16 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcgjna-4;
	Thu, 18 Dec 2025 01:14:16 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8723bs: add IS_ERR() check for kthread_run()
Date: Wed, 17 Dec 2025 17:14:13 -0800
Message-ID: <20251218011414.1781294-4-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
References: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180007
X-Authority-Analysis: v=2.4 cv=Ot5CCi/t c=1 sm=1 tr=0 ts=69435568 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=CcIRm4YFBE7ShbI5ndQA:9
X-Proofpoint-GUID: _TpnEyStYMmGijHgffcw7HxLHN1BajSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX5Y+4gbvp4W9q
 Nx+liDcFAzzIRFVaYRykO/i3H0J0RRYY9+Z4B3D2+QFGonjw5yhL+XHnAdfjYkpDECVbvz233bu
 ZlcSfzSMQJpHraGVIfYRU27cStbtXK+lDoY88FYTcj+luNTD2GBDrNOe7sDeMOZ1iPx5YqPkBPu
 /YFGTLderQQHvj4wGve22Wi1Q01RCfvuLwpLFoQaAHNTGtjvw3+ytAM9T/AhGZ5qyf53vNj7Zk/
 rjETl60Yu9yxqPiurlIuwvKvMn+WMWakIx0Wq9iooKVz3vMZmyTR7dU9+jTGOyH48XPgFbs7B9y
 AUK+bZ8+nTE4vBWzYWhTUGXyBfiTuPOLjNI9rIeFVKsROpJ3hK8EASXFhpDH5Rh6W31H+o5Rm9f
 XymFbVKj9ny7WXd9F5FuyedNJ0SOmA==
X-Proofpoint-ORIG-GUID: _TpnEyStYMmGijHgffcw7HxLHN1BajSq

Add missing error check for kthread_run() in rtl8723b_start_thread().

kthread_run() returns an ERR_PTR on failure, not NULL. Without this
check, rtl8723b_stop_thread() would later check
"if (xmitpriv->SdioXmitThread)" which evaluates to true for error
pointers, potentially causing issues when trying to complete or wait on
an invalid thread.

This follows the same pattern used elsewhere in the driver, such as in
os_dep/os_intfs.c where IS_ERR() is properly checked after kthread_run()
calls.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0eae624a36f0..88ea3518bb67 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2926,6 +2926,8 @@ void rtl8723b_start_thread(struct adapter *padapter)
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
 
 	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
+	if (IS_ERR(xmitpriv->SdioXmitThread))
+		xmitpriv->SdioXmitThread = NULL;
 }
 
 void rtl8723b_stop_thread(struct adapter *padapter)
-- 
2.50.1

