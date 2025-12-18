Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA0242D67;
	Thu, 18 Dec 2025 01:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020459; cv=none; b=pw7BB5bMebmZOtMPaRubYfQzFSm+rNF6galmR5Go+oQhK9mL9uQAIp+EPMlMuejqScS9zS/5KoSNv5k7BlipCSLP8RBjkWM9k5FOg7oLIicHOM2g65YVw6gI0jGQnY6FMuJHB4fmdMdKDYljZuURbuWJzCPBjrnkBgVlKe2gYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020459; c=relaxed/simple;
	bh=Mtlnram453y6WA9ocfNmMifofZaA1DQlSyXwXqaf6lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7UIRZ26sqUmyfQDY+NiLjT8CMNEYuY8MiKI7yaJC1okMQEFAyOIaxtkckFgXc41g3QznS9RaeFSYL1bFLuv/xQM4EXZakrIgJRn7JV+ZbdIvGf1WV1eibxaUdw7Ms1kkwR/mFQxUo+mCdxo27otDgc9e5GIJB1KKhV4iXsSEFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QdUAz1BP; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QdUAz1BP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI167bK4029723;
	Thu, 18 Dec 2025 01:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=9q99h
	+NETPzLq7590X9pwbBXqoBjjg6nivenp0WZwTw=; b=QdUAz1BPQ6K/O0Z0nhWj3
	Tyd0BaveFUBcrKLeNfgQ/6FjRuzDd9Y71dDfMfZwP8WTd8r5hUqgYq9KFkOSbJpz
	G8r3+5o2MHcHCKOYTUCCjZu27I7A+FRPT+JvExS7rneQFKwvSle2CbQIFLXHoqDb
	B2muxDtv/ChDbIriFpPiy4J3mZlU+/azwGOHiaKjMItvoVMxNPomcYF5srYDxIZF
	gCLZnT8yPrPk/UcSffjszEtSuOL3rSixNoegrt3N8PD8V+B2zjyykn8ArpoqPYnx
	JMFhrN8ch4nDzhyONm2AhZMjLS+VmfBT2+OqUUwSDT6O+pL/0i/od1ObKNuQZ+FV
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b47n8804s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 01:14:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI195XQ025249;
	Thu, 18 Dec 2025 01:14:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcgjna-2;
	Thu, 18 Dec 2025 01:14:15 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: rtl8723bs: fix firmware memory leak on error path
Date: Wed, 17 Dec 2025 17:14:11 -0800
Message-ID: <20251218011414.1781294-2-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwNyBTYWx0ZWRfX7C0ZTAtmDWpL
 D3NX1T5uUEghLgcA04o0K28oOTDnEXYGBc0qF287tuDZWIHWvLNTTy4r91DOX0PO5Q/GNwuUcSR
 AUtTSnQYD/qwTQGtF1DHT8SSmZPO4t9jKON3sX86WNvDMnYB36KMykZjgD3f1abcgMpg3rU/V9s
 ETTlhWYezeh1CSCRKisFcsG6yCwTo3WxXEONXGWPUJm/UNVMbTnj4fnOQVB1fdfaTfSCDCFow9H
 qBY3F/Qk1tgZYvQ3JAxRmA4cVdnTZnZoQJ8GM5lB6/6TA6Xl0xfT22jANniqvj6KQLYcwFfbTKp
 sGspn/3ag+YDTgHOLf0o91GvIN5DgZsmiSyKAY5qnBnuncy99+A5+2Y00/N4GgKJL1WmcKGlLi3
 GwCEl+7yJhlvFOYPBajm5KoTI9N5+Q==
X-Proofpoint-ORIG-GUID: DnhdTG5w4TesJaVGKWkucoR8Jl9g_XLD
X-Authority-Analysis: v=2.4 cv=Vq0uwu2n c=1 sm=1 tr=0 ts=69435568 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=4FbwR8H0EwRVJbgSqfIA:9
X-Proofpoint-GUID: DnhdTG5w4TesJaVGKWkucoR8Jl9g_XLD

Fix memory leak where firmware is not released on error paths in
rtl8723b_FirmwareDownload().

After successfully calling request_firmware(), if the firmware size
check fails or if kmemdup() fails, the code jumps to the exit label
without calling release_firmware(), causing a memory leak.

Add a release_fw label to properly free the firmware in these er:qror
cases. Also add an error message when firmware size exceeds the limit to
help with debugging.

Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..0eae624a36f0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -345,14 +345,16 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 	}
 
 	if (fw->size > FW_8723B_SIZE) {
+		pr_err("Firmware size exceed, max: %d, actual: %zu\n",
+		       FW_8723B_SIZE, fw->size);
 		rtStatus = _FAIL;
-		goto exit;
+		goto release_fw;
 	}
 
 	pFirmware->fw_buffer_sz = kmemdup(fw->data, fw->size, GFP_KERNEL);
 	if (!pFirmware->fw_buffer_sz) {
 		rtStatus = _FAIL;
-		goto exit;
+		goto release_fw;
 	}
 
 	pFirmware->fw_length = fw->size;
@@ -415,6 +417,10 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 		goto fwdl_stat;
 
 fwdl_stat:
+	goto exit;
+
+release_fw:
+	release_firmware(fw);
 
 exit:
 	kfree(pFirmware->fw_buffer_sz);
-- 
2.50.1

