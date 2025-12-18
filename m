Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0933D18A6A8;
	Thu, 18 Dec 2025 01:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020458; cv=none; b=dv+TOo5VLv3wTpN1sx7ft4gmoRJ0z9IVUUPjWznikQVt7mnadmN4a/GYxgSSR0niTKoDP05oZ/ZBonWHDjypAR4oiulO13m6jWEXwf7gJaTpe4zulwg0iLl46wEsPZL1XHvb3St4AI5+ixjz3Pu65MHoFu87nqrpqir04ME/3Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020458; c=relaxed/simple;
	bh=0WY9q9t5dBLjmPbEuEuZd3KtITDwhQ8K1x6Z9kw/HeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBfwd45HhBUmxKdsRcGYtW46q8MaJQ0e/P5GapspPZxWCzqNXDfyEa/yWhjer5mT4hbNkA2RGp6Huy1YQ47A0qER6l4ibMjiBFhLYIfGSdHli9r5YxslcNl8dC07IfDLFOBHCr5EK0FGPMcILrYqG+XKmMfn+pMgr6IFHF9fNHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FFV9DnVT; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FFV9DnVT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHMNdN33801767;
	Thu, 18 Dec 2025 01:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=uUKhk56i5PyqhefjAR7/4jdPw1j1J
	BGbuSe0uJA/b6I=; b=FFV9DnVTaJdVSlmaMgNHA8ZR79tq/PFSS4sMEErzOpedE
	7oUmDIcc9JNjxW3YfXDI+o5caxUWus9qMZi+ie9UmSJQ9tezIFCedpwR5NcdcECe
	GztbAmJXjzK8h5AjFsWU8X2hulLOiGXwGjD/rrZCmmSRUTl8RzP9KiPWD8FNjXWo
	U0WkghfjCIsKCmzZDOed91JOVWQpSI/F5sbp324nAYqY0ln5gxCNH04G2e/7KXyz
	nRXAoEI5wUU1Asj3mr9DP78iMSvZKf6TqcA/baTY318/wSqz61pNig1QG9ClvavO
	3ye+uOL4iwurHtd4J7AUH5hgTzBSINllTTTbBgPhQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b1015y1j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 01:14:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI195XP025249;
	Thu, 18 Dec 2025 01:14:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcgjna-1;
	Thu, 18 Dec 2025 01:14:14 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8723bs: Fix error handling and memory
Date: Wed, 17 Dec 2025 17:14:10 -0800
Message-ID: <20251218011414.1781294-1-samasth.norway.ananda@oracle.com>
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
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512180007
X-Proofpoint-GUID: FYLR_GM23j6NEIii4cPy_d60tM8SxAIt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX9sPzPcZhAE2l
 d18bMTtxy3M0xhX9AmcK+KmVFlnPzgh0dNy3EPBqFT4gOud89rxQirh4tv86/+GROvTAXQ69pcT
 KlP4xqKwpSgjjU8kBveM0OGJpnBGJmeYIs4J82hvLKmAKN+h0MQDjkr3dGP7NLXEjRik0TzRHCS
 KYPUoPVwIg2FhZQQEeXHBUzo9Gh4OTY+x+cR3WHrrNFhQueGVuMhQMMF6wC748fg+9BQM4llXLs
 7IW2VLGfRcQVwjZeEqDF+XEzOoa0cDn+SI3EwERs0oI5gmehCuf6BfWyFRKHpw1T6bNq4sAz8Z6
 JmitPyj1X/YutiZ1YlG+cDBzyvgFTk1IdeBgqIwOm9atxHNsaFtx1rrNroFb1pTKqr0+sQlaZXl
 XuEbwh9TK/XvHrM+gGcGlK63DcfKkg==
X-Authority-Analysis: v=2.4 cv=GbUaXAXL c=1 sm=1 tr=0 ts=69435567 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0iAus4mJ6vGRqwlwy6oA:9
X-Proofpoint-ORIG-GUID: FYLR_GM23j6NEIii4cPy_d60tM8SxAIt

This series fixes several error handling issues and memory leaks in the
rtl8723bs staging driver, found through code review and static analysis.

The patches address the following issues:

1. Firmware memory leak: In rtl8723b_FirmwareDownload(), after
   successfully calling request_firmware(), if subsequent checks fail, 
   the firmware is not released before jumping to the error path.

2. Buffer memory leak: In rtw_cfg80211_inform_bss(), when
   cfg80211_inform_bss_frame() fails, the allocated buffer is not freed.

3. Missing IS_ERR check: kthread_run() returns an ERR_PTR on failure,
   not NULL. The code in rtl8723b_start_thread() was not checking for
   this, which could cause issues when rtl8723b_stop_thread() later
   checks if the thread pointer is non-NULL.

4. Ignored return value: rtw_wdev_alloc() can fail, but its return
   value was being ignored in rtw_sdio_if1_init(), potentially leaving 
   the adapter in an inconsistent state.


Samasth Norway Ananda (4):
  staging: rtl8723bs: fix firmware memory leak on error path
  staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
  staging: rtl8723bs: add IS_ERR() check for kthread_run()
  staging: rtl8723bs: check return value of rtw_wdev_alloc()

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++++++++++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +++-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  3 ++-
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.50.1

