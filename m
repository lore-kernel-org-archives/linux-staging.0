Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094D202963;
	Fri, 30 Jan 2026 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732210; cv=none; b=rwqp5xGM/XXWJiuYyz/YSV1+0KLI3izMF72lYXs1/Udy4fn3xwuEX8fy7wBtS9T9qAVflzz0xXGcLfY59cIjZoo29nOlpPvzFDBkvWAg7D+z5FSlzdjv2DB9PM4tbHnV1lYnZJhOA/7uBfwRYkPE8W5d/y0IfKNblYnooi49G6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732210; c=relaxed/simple;
	bh=0eRCRo/nrrZQomWl4QwQ9QwcPuC7yrQw3ji6puhcws0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6pjXoCZafPBYL84F4gnV2SxAWv97BH/7a7Qi0vYyzXlRxDifYI7XdFfy85oNEnY6cpORw09MixDqp6Qw5T+5rbShwvRwSqxwR3O8iHWxKPAjzNE+w+g1OjQtWCS3uQbSx6cUJQGOZNI6u/LtmnIHpXa5ZR5AZlRhUCob9nB2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J/beS0/a; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J/beS0/a"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TLqp2O542677;
	Fri, 30 Jan 2026 00:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=cJRBhjCfJnLl6vXtKsdSzAdN7PHSZ
	hFLpVnM6vkSMNM=; b=J/beS0/apxEGXS115xRpUMStm+1L7Q8gCYzX6Fz5znhgz
	TJ4EWswoRwOUyIZgPAxOAp2nozw+4dNxIeshcAsTI3bTuYR8E9Fmm27AQQg3dJ/H
	H8n38urzjG5PUOeB25G1qQPXOrRd8eHZbWB/y725g59iV+BioBYIig/53P/vNlNu
	3cX8QNqYLBusvgeg6RKBo3gWEWWKCV1Dpx3imI335xWzmXy4Vp99NC8+0ncOryOz
	Pb5l4PUoG7uzGHk8/b33A6w2acRAFpP4tqmjuEEw3zKU5p6dQPnMCCQMerDSGi5i
	7oSwiuq0tnufO2IDtEikAsAnSrJQaiiezm8wwexaQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by5dj40pp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60TNj97g010549;
	Fri, 30 Jan 2026 00:16:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhd19k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:43 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60U0GgZB007973;
	Fri, 30 Jan 2026 00:16:42 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhd19jr-1;
	Fri, 30 Jan 2026 00:16:42 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        samasth.norway.ananda@oracle.com
Subject: [PATCH v3 0/3] staging: rtl8723bs: fix error handling and memory leaks
Date: Thu, 29 Jan 2026 16:16:38 -0800
Message-ID: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601290179
X-Proofpoint-ORIG-GUID: xy9cuZBCOFaRQS_uc5UT9HtYZsjnXNFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX4tsApVLP+8xV
 yce2ZMKFFxCdSn1KbAmxESUq29OO6BEaXd96XfefJGoBnPsV3Cxmw816cflYPki2e0Pj8EVfqn6
 udTa62ihTEiriyGW//DbkA2MGkTBezvvew2XRCtDCIljJ8wPTTDuopWDCDiIbbhGNe2GZ4hUeK8
 pB/JVzn66X4kk2Q2OsvkbS6zOe7p8NLJlJCPYCjsW0dIWnNQ1DteX32WhvlFC9wAtNBdzT9zAZ+
 Mp4ExOhI6kCtqrLfRTSixBNtE4FFMYw4FSSgXaC+7vc3Hy9yTA1UikDIE0Lk8wHR0xJ3GgNXYgf
 u0xMPQN2hkME9wOxMwSwOkguiukxSHmC3pErdGVZknbb99shLfVvuv2WrSTNqanRaTj5xrZWkZs
 cc2wO/JfMMeBWLAakIA89Yu4bzm7ELuVuvpeN7eOdryvb7zGuQJcE5610jfpubQCvioWtLJQCLY
 uLecl94lpSK9942aK3w==
X-Authority-Analysis: v=2.4 cv=IrsTsb/g c=1 sm=1 tr=0 ts=697bf86d cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=j6ARGQ659V0Vfa7ryy4A:9
X-Proofpoint-GUID: xy9cuZBCOFaRQS_uc5UT9HtYZsjnXNFG

This series fixes memory leaks and missing error checks in rtl8723bs:

1. Firmware not released on error paths in rtl8723b_FirmwareDownload().
2. Buffer not freed when cfg80211_inform_bss_frame() fails.
3. Missing IS_ERR() check for kthread_run() in rtl8723b_start_thread().

Changes in v3:
-> Patch 3: remove rtl8723b_start_thread(), rtl8723b_stop_thread(), 
rtw_hal_start_thread() and rtw_hal_stop_thread() entirely, inlining 
the kthread handling directly to rtw_start_drv_threads() and 
rtw_stop_drv_threads() with proper IS_ERR() checking.


Changes in v2:
-> Patch 1: Call release_firmware() directly in error paths instead of
using intermediate goto label.
-> Dropped patch 4 (rtw_wdev_alloc) to study cleanup chain further.

Samasth Norway Ananda (3):
  staging: rtl8723bs: fix firmware memory leak on error
  staging: rtl8723bs: fix memory leak in rtw_cfg80211_inform_bss()
  staging: rtl8723bs: remove thread wraper functions and add IS_ERR()
    check

 drivers/staging/rtl8723bs/hal/hal_intf.c      | 11 ----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 21 ++-----------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  3 ---
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  3 ---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +++-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 16 ++++++++++++--
 6 files changed, 19 insertions(+), 39 deletions(-)

-- 
2.50.1

