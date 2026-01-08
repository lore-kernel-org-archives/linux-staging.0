Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D783090F5;
	Thu,  8 Jan 2026 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896182; cv=none; b=ln4Kq7/J1X/DoNsv9pNMp/q7FGhZng9fy8Hv5LHX7qIQY6bn84dJ7sGxBMmVcgmC1Ja3BF3kuzUPFqCruNVO9QeLlJ0fFS9Cl3bBaktFBuC5YJWxnNQFpV38QlHKX3fAzTbfk2NIDn/Ej0rwSdLdLnv7df1kJtdLpJiAhY46W6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896182; c=relaxed/simple;
	bh=yYAlt6Wec9Vi1J7KODs8VqCjNE+ngcL+M0x2Ukmdyu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqrEQ+XYZitP+N4qQJ4BRzTsDypfZC/gsqeQICeAmuz2ZSGZeSwWI6uccr43bJmIOFE+UpsZZtWZPtj3a4OgJ/GBGfBSwgRuyMHiQxnS2mPLv7YIZvRiskDYm1LCSPq2uTWXb/QEyuuxgJjEyMYPBBEFfkT9x3VDc/q5u6AY3hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZaPCg7As; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZaPCg7As"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FnVW2425571;
	Thu, 8 Jan 2026 18:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=wPu8M
	xHBDyWWNqLG9PORAsEoDBF9GHetvqkS05GaYXY=; b=ZaPCg7AskxsvyzBgld3Oa
	THDBePO0t9msPqF62rA9NNs4vXtoeR9/Qu4vGUln461I1Mv8uLW+LWBRqUDT34rc
	4Hh5oKj4DO/i9e+qRKC5Fxznk0DyY0GLHoumB+Wlrdht3cNIS0Xuq5FTYLubS8t/
	WaKq5qKN1XeUKyOEe4WNkCwgqhiWhottvKE5XlEFqa3NSPK2G3G5EzipbQmiFtZQ
	K/N+sjrJDhVh4G51AVi3BvWIcs5SSgtKfHRY97P06NBAoVt0BJP8tq5foToq5VNo
	FG1jyaC7WIvBfzzHFRnjPsBMJ8U+gApJA+d5Yjckpr2mh9ZRbsHJq38YggYhStUy
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjfjd87mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:16:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608GYJ0f019956;
	Thu, 8 Jan 2026 18:16:14 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besjb58a9-4;
	Thu, 08 Jan 2026 18:16:14 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: rtl8723bs: add IS_ERR() check for kthread_run()
Date: Thu,  8 Jan 2026 10:16:11 -0800
Message-ID: <20260108181612.2340796-4-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
References: <20260108181612.2340796-1-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-ORIG-GUID: -Lb4BfXSEnrHVBX5O5hijPTs0BOFsghE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzNSBTYWx0ZWRfX731fN4vAZJZW
 5Q9kgkJ+WLPctbAUKoInXQUX3ymfDV0rYX65yyH2UDJWWL4uzLYmClYOnBwJXF+/x1pqHvaKOLh
 Zy2oDgy3ABdX5drFxolnygzwF19fbm0JlQ5IOimd5pf/cZXM07av2sGRb22NhU9EPtUdrZB6k6D
 C8C4EUnXEb0kds/xVJIYhD/rQe4E2hSYa/RfeWWD6vq7zbbByHHaSqE9T2qH2BR2qsOoagQSdQG
 CQhwOqf5+KEW3B3AoR7noFf5MKqjbFQr6clz9fU35R7yCMe4N7lru+/wj9aYjfthaq+VfglOeiA
 XX68fsy4bwRUAPH3g3HOZV7OZyGzJ4qZdFWmv2sDceFKxtJ2XKbBc8CJqN3zMgEU8z/F/M/ujuo
 Oc5AtFmC3z7H/vsQPC0C6dkKayqhWQv/eIlHrjzh0lZ7hADaH4xTVHfL53kb7dv3P+d2oA05jT4
 m3m3IbjL4/ApDQrv50g==
X-Authority-Analysis: v=2.4 cv=MOJtWcZl c=1 sm=1 tr=0 ts=695ff46f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=imfE7q7joczNGZVoPxsA:9
X-Proofpoint-GUID: -Lb4BfXSEnrHVBX5O5hijPTs0BOFsghE

kthread_run() returns an ERR_PTR on failure, not NULL. Without this
check, rtl8723b_stop_thread() would later check "if
(xmitpriv->SdioXmitThread)" which evaluates to true for error pointers,
potentially causing issues when trying to complete or wait on an invalid
thread. Set the pointer to NULL on failure to prevent later code from
attempting to use an invalid thread pointer.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 56ceedd5a26a..27d490204fcc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2922,6 +2922,8 @@ void rtl8723b_start_thread(struct adapter *padapter)
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
 
 	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
+	if (IS_ERR(xmitpriv->SdioXmitThread))
+		xmitpriv->SdioXmitThread = NULL
 }
 
 void rtl8723b_stop_thread(struct adapter *padapter)
-- 
2.50.1

