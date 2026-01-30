Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF8B27603C;
	Fri, 30 Jan 2026 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732213; cv=none; b=O0hS31L7NLNptnEq47klZ3UBfeKuB4yhIUfgSN7W4G8YBpv6MVxwTOV6droSQ1Ha/BCOjfuIjhaXYlvNxdA1uCIikJ6cmboaQVegg5DbFgMvJQzY7k28vc2GiVo+VKh80hzYX4XS2gXROvEx3kkVf2lOypmL6VaUrG4Itws/rMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732213; c=relaxed/simple;
	bh=9LjqytfvU+ZFcPy2TL3ckCjKviHsxjJ7yqYUWMbFBGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZESTDwZtljhDXoPIL9E+RIUkXJVOYc5r/8PTjGvNd3oJHkyr9XsoZgHKFjaepKSPr76DKZkgOJOx9EQ2MwKOVEc7Rl9yi0cr066hwQrnIdEHAFktYqbRXqkO16R4CpVLV8BytiWv8lmXLJSaJJvZRZo97qG0Ve46SWI000GPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oToymM5T; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oToymM5T"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMUINF676658;
	Fri, 30 Jan 2026 00:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=I+RIs
	Ibr1gy5lRlJFoPvBZz0Dyzz8Q3VcnTN1ATL99k=; b=oToymM5TntgyjNEomckeX
	x/MGgT6/N+qVCdEsV7DvWy95Vjpa305dUR9cbAntzTU0AdX0vSe3U1m+KUR9UhnH
	OjsrtVACjV9SuYx15p+XY57rpweo6SZXKSuvXKNfo4t+O9D6XzKpiYx756Gixq7t
	07oUcDMzpm0z1a/vUIpR0q5owhbryMnPluhlL9zfOy3n4o3AXhW2+T09HO2gRinU
	6d2u95f6dPgdkM+yA7wWV4O8FO1LKLro2Esai7aWBgdiImRbyhe1N4uSEKmeskRM
	pUVYA/evCt+rBTLE2VqZaNOGBz9i0T18NrgeGeFAD2zKHY67fO/kq3eKOCTI9tfs
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2vgmbxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60U00GE6010023;
	Fri, 30 Jan 2026 00:16:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhd19k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:43 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60U0GgZD007973;
	Fri, 30 Jan 2026 00:16:43 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhd19jr-2;
	Fri, 30 Jan 2026 00:16:43 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        samasth.norway.ananda@oracle.com
Subject: [PATCH v3 1/3] staging: rtl8723bs: fix firmware memory leak on error
Date: Thu, 29 Jan 2026 16:16:39 -0800
Message-ID: <20260130001641.17941-2-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
References: <20260130001641.17941-1-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-GUID: T0FjYGl50ktcMKJDrD5r3csTBf1lyW2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX33bq9dDl1C6A
 2BfW6cheD2y7uieNTHyWNw6JrJgdlYwxbAILEPLlC1CrhEHpogDMBFx2HeU6TAQJnEDmMMaOsRY
 mMxRCo/geAvUoTYPkvaWhY2UXJyeltOqH2VyBPTaoJB/Zk0Zynt3GXLn6qDF9QEBHnutQRPm3MH
 cLhT6SPpvH5kDNgApc0+kw50nqdr26UflKwy2vVbulC5EYo56PvWz77RMZ157myTsDW4AMH3WxY
 ZihQbpews4dNdoj0FHNgitfbAJMhAn/9DbuqXDf3DmR4HrPXtJNMziFVy5rpy3rZ3dLT9pEpke/
 T1aqJP/3gQrVnBltjDbMZBLiu7/+f6oXf4gHqmbJC9L/FOuTiM5EOd2USePyLw2ktCl3G92yc+c
 LyUV/eB/mwtWhuDtcfZgvDpu32tBV9sB0D/KIAhQ8QEtIuKM1BmxcNfGuPBseVz7pk0U2hPuTbI
 oH30fwK3T+Cy57VeZZQ==
X-Proofpoint-ORIG-GUID: T0FjYGl50ktcMKJDrD5r3csTBf1lyW2S
X-Authority-Analysis: v=2.4 cv=a7s9NESF c=1 sm=1 tr=0 ts=697bf872 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=KKAkSRfTAAAA:8
 a=uo-a5Ro3onDdK20lcsEA:9 a=cvBusfyB2V15izCimMoJ:22

After successfully calling request_firmware(), if the firmware size
check fails or if kmemdup() fails, the code jumps to the exit label
without calling release_firmware(), causing a memory leak. Call
release_firmware() directly in each error path before jumping to cleanup
label.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..528bc05169de 100644
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

