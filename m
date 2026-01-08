Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3430C371;
	Thu,  8 Jan 2026 18:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896183; cv=none; b=hCaIihlXVX0Rs2deTZgr5Gm/yeiNEn/Q8Ex9KptVImLR+sLohX3un4RTbDr1etgyjErCDdZYbMTbhSyVIMpuyAEbgIr+A9oL9TiaxovRns4WPZAffPsVw9RYaqF//HHsqLpwrpVuMTpBAXQLL+e80DNpaO/cq1/l6L+hRoDhZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896183; c=relaxed/simple;
	bh=V9OCKVz7rCMpPtkmNbku6EfWqpAr31tlmTRMYXbda38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkWcowDE7sYvDHLCqJdzIbF2dlsM2RB7UZWmuSMFvDp4AOM3EKrjbhCaTd+ropmgm14rMOIfku7d+bQUCc/EbE0RwBK47mkViVAUg4gPMHitUqTlFiDvPNbQgtfGieoGyCJAcxyuRA9Lkdmt7aRcnrBcxQr8VH3jzA5iLYRgmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OTt2FzJ0; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OTt2FzJ0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ho1RN1207540;
	Thu, 8 Jan 2026 18:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=MQK/v
	Osv3/GV9PcnK5rJ5mGGpzPaZ9CjB59HA/3M/QQ=; b=OTt2FzJ02J/mzBNzxlOto
	MynOk/3golpcLKbKcXom5/pAg/CpFKStNS4HSUaSRtJ8mXBIhHb9yvbpB6pZup2l
	64JoWxMF9VhKUCsH/QbU3NIhFZVmZwMVSF+o9fvL0g2lrmSuJQfPVvnvORiM4BYG
	9ooeUd9KmVTc+d5uYoEKKsIKyiYTfIDlX8O4mj9B1l0haRlNK2Fk1j9YAMlLDweD
	YPD9cPq6+VQTx8bECR35AIYmjH1Bvaxyyts14BEAXxFtcGeCXhSuv7F+EV+MhRYu
	t2KAIIP9HDM50E85hIjCClW+UkVr/jt+Nn77twyykjDTYLP4UGuSkoOpMfzwZwS3
	A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjhb181bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 18:16:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608GYJ0d019956;
	Thu, 8 Jan 2026 18:16:13 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4besjb58a9-2;
	Thu, 08 Jan 2026 18:16:13 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: rtl8723bs: fix firmware memory leak on error
Date: Thu,  8 Jan 2026 10:16:09 -0800
Message-ID: <20260108181612.2340796-2-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzNSBTYWx0ZWRfX7xqQnS4aWHtK
 I5Gi3kgrwRt0CLzZVx0UlP9tJkD4oNfUcfE/z8v7m7yGFtkba1NBxfma51az5O/4Rao31F5Hg7w
 Cc0GaUlMoUuf5HIy+vrNAVPFSuFCSPX/W9tuxGgpTCSvwdw8cf8AkUvKhr0TT1jiFnlrkTAQxsa
 DKJTTZXp3RwRNt6dsdUSGXm3Nj5qPQbXG3a+RGzhqS/OVaGGAF4EpAnLRZdboEGTJhmJVhqXh2X
 du3X5ltNbO10QXpoTJ3K83Ti2Lxu1x/GQRfPAC5R3LCJqUU1gk1TozsehGODJARBXzTvQA1tvyF
 qayWVB6S935aOW3+6Zu1idiHJE46136sqAsp6nifnFOsGubxcVUMJDx1X27M6mmySEDSJEaeAXk
 LHd2h3oeEepr70ejqQNQpxK1u52EDeG2JsGBm11w4aUjeRTNrNTFryy9nasHjBrHySyH94Pv3wY
 w5en2lHXzyzBe8CM/2w==
X-Proofpoint-ORIG-GUID: On_ILZZYdaHPezV6YL8CzuZ2rGn31BBT
X-Proofpoint-GUID: On_ILZZYdaHPezV6YL8CzuZ2rGn31BBT
X-Authority-Analysis: v=2.4 cv=S4PUAYsP c=1 sm=1 tr=0 ts=695ff46e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=uo-a5Ro3onDdK20lcsEA:9

After successfully calling request_firmware(), if the firmware size
check fails or if kmemdup() fails, the code jumps to the exit label
without calling release_firmware(), causing a memory leak. Call
release_firmware() directly in each error path before jumping to cleanup
label.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..56ceedd5a26a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -346,12 +346,14 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 
 	if (fw->size > FW_8723B_SIZE) {
 		rtStatus = _FAIL;
+		release_firmware(fw);
 		goto exit;
 	}
 
 	pFirmware->fw_buffer_sz = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (!pFirmware->fw_buffer_sz) {
 		rtStatus = _FAIL;
+		release_firmware(fw);
 		goto exit;
 	}
 
-- 
2.50.1

