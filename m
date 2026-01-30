Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4626B764;
	Fri, 30 Jan 2026 00:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732211; cv=none; b=Rzody+bda7pEurUTlkIBeqYz1a1eNELI8RKrfRFdlI4EQAqBXteq2P3AUOz/J6uXN5po/o4PaNd6hmfJQYxuj332rCgXpB8hi7DIaifQvnJ8cQiPYxIMAGOUpWEefnfyDmz9kKQIhYoBky2zFK5BKbdibgGEnRzHjIX3QToa+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732211; c=relaxed/simple;
	bh=dDdF8/a1FUED7Dzq6c4djwn+PFOJL64E9hnncpOm12c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyvHM5QDKlgSfvwt+KrvZTZ+2txTYDG2mthJEDqTbFnTENnYRY1cjWnh6WkjNjP085ZIyqd9+/GSVF3bs9VzmPfzIUKqaMcGizRXqamxG00lXxMaoPWYrIXpVYmhmLcEstEX397tz2KPeV7pnpKXbXe+juT2tX5JfvSoRkzUbAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WCwU2Y8u; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WCwU2Y8u"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMMMQH1278711;
	Fri, 30 Jan 2026 00:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=oVLWJ
	H4JkrTr6fvY20JVUCLXKWM2kxWYhBmsgJUuiLk=; b=WCwU2Y8uKDDMktnuLx0Ye
	sBwpaLzfWGsKPCULJJvlkUr99Xtm1P0HJo6ZoEafRY7PsHrkOn0edhubX9MNWA6X
	RS5FZE8JC8FxyAzNOiQLU9JSeXR+3Aiz7vQ9Mx4Xj/++AQexhQVZE/DipBAVt2Pz
	PwZyR9F6tGMmi/yTibpz/w1haXPi9HnwUGa9c+NLD6NQaGDqaq8Y3MX5nOfwEWQM
	4do0+RMD1CVynM2jhWdLuoQQWV2KiYLfSmlrxaWijhqvC8ynHzi7fnynA+UV7KOY
	3dR1DXaNfpUitgg8B6rfmSdjAq9Mdo0uFMjxOTLoRgBhIDZxI2FXLe2n7rk/jG+f
	w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4by2xqvd6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60TNj97h010549;
	Fri, 30 Jan 2026 00:16:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhd19km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 00:16:44 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60U0GgZH007973;
	Fri, 30 Jan 2026 00:16:44 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bvmhd19jr-4;
	Fri, 30 Jan 2026 00:16:44 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: dan.carpenter@linaro.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        samasth.norway.ananda@oracle.com
Subject: [PATCH v3 3/3] staging: rtl8723bs: remove thread wraper functions and add IS_ERR() check
Date: Thu, 29 Jan 2026 16:16:41 -0800
Message-ID: <20260130001641.17941-4-samasth.norway.ananda@oracle.com>
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
X-Proofpoint-GUID: jg7GMaVuDoMxjR731IL2gIgcNO064nWT
X-Proofpoint-ORIG-GUID: jg7GMaVuDoMxjR731IL2gIgcNO064nWT
X-Authority-Analysis: v=2.4 cv=UepciaSN c=1 sm=1 tr=0 ts=697bf86e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=ag1SF4gXAAAA:8 a=yPCof4ZbAAAA:8
 a=4GFln_ug5z8xBbYvM2cA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX+8Uhx7wka/NU
 X5hn/CojQlQQtWHA6OP5zKdEsl5w77EmjmbWuHn2lZRC4yeoKRH7kWov9U3wvHRVH4DgybWKRHo
 POrd6zsL78yOLynfxBjoAhQNn25wmjfuR7NRsNQgklYuGmVFWSp3NXsarOvT+SZFWhv27R6eIBb
 bsh6FM8MVCxvdin9242H4VPEVQopwnwcZ/PuQzO4IC7+Q8o81lls44bwQjrbYJzWRVC5HcnLujj
 ljoaiqS3gvo7/z7qsJq0aDtf5an+36ZXYE7hwZrzMjeV07hyYV561CDAKMPwlqfBPmC5FPP6XbT
 CHxSXzdXssDHBX590FET/IG+youKCcdqmxUOybbhKbJ1LCZt7/vvC7ziHVykFsCty9JLSq4OGDT
 SQoPjdUapvheVSWaRVXVviJSWwnlWbh52FY568yWPkL8W7NW4pJWxJqKKoaaHgPFY+cvCXhdUTE
 s9Aw6Dij9dKZpi+mWww==

The rtl8723b_start_thread() and rtl8723b_stop_thread() functions are
wrappers that are only called from one place each. Remove these wrapper
functions and inline the thread handling directly in
rtw_start_drv_threads() and rtw_stop_drv_threads().

This also fixes a bug where kthread_run() was not checked for errors
using IS_ERR(). kthread_run() returns ERR_PTR(-ENOMEM) on failure, not
NULL. Without this check, the SdioXmitThread pointer could contain an
error value, causing issues when rtw_stop_drv_threads() later attempts
to use it.

The inlined code now follows the same pattern as xmitThread and
cmdThread in rtw_start_drv_threads(), with proper IS_ERR() checking.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 11 -----------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 19 -------------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |  3 ---
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  3 ---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 16 ++++++++++++++--
 5 files changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 462553d296ff..f55b99f92691 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -218,17 +218,6 @@ void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_l
 	rtl8723b_Add_RateATid(padapter, bitmap, arg, rssi_level);
 }
 
-/*Start specifical interface thread		*/
-void rtw_hal_start_thread(struct adapter *padapter)
-{
-	rtl8723b_start_thread(padapter);
-}
-/*Start specifical interface thread		*/
-void rtw_hal_stop_thread(struct adapter *padapter)
-{
-	rtl8723b_stop_thread(padapter);
-}
-
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
 {
 	return PHY_QueryBBReg_8723B(padapter, RegAddr, BitMask);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 528bc05169de..3a8062d31175 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2916,22 +2916,3 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 
 	return bResult;
 }
-
-void rtl8723b_start_thread(struct adapter *padapter)
-{
-	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-
-	xmitpriv->SdioXmitThread = kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
-}
-
-void rtl8723b_stop_thread(struct adapter *padapter)
-{
-	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-
-	/*  stop xmit_buf_thread */
-	if (xmitpriv->SdioXmitThread) {
-		complete(&xmitpriv->SdioXmitStart);
-		wait_for_completion(&xmitpriv->SdioXmitTerminate);
-		xmitpriv->SdioXmitThread = NULL;
-	}
-}
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 82b60899129d..b193854bfe6e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -221,9 +221,6 @@ void rtw_hal_free_recv_priv(struct adapter *padapter);
 void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level);
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
 
-void rtw_hal_start_thread(struct adapter *padapter);
-void rtw_hal_stop_thread(struct adapter *padapter);
-
 void beacon_timing_control(struct adapter *padapter);
 
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 06e0a549fa9d..7ec84304a19e 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -231,9 +231,6 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter);
 void _InitBurstPktLen_8723BS(struct adapter *adapter);
 void _8051Reset8723(struct adapter *padapter);
 
-void rtl8723b_start_thread(struct adapter *padapter);
-void rtl8723b_stop_thread(struct adapter *padapter);
-
 int FirmwareDownloadBT(struct adapter *adapter, struct rt_firmware *firmware);
 
 void CCX_FwC2HTxRpt_8723b(struct adapter *padapter, u8 *pdata, u8 len);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bc02db13781c..6080cdc2a096 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -6,6 +6,7 @@
  ******************************************************************************/
 #include <drv_types.h>
 #include <hal_data.h>
+#include <rtl8723b_xmit.h>
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
@@ -480,7 +481,13 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 	else
 		wait_for_completion(&padapter->cmdpriv.terminate_cmdthread_comp); /* wait for cmd_thread to run */
 
-	rtw_hal_start_thread(padapter);
+	padapter->xmitpriv.SdioXmitThread = kthread_run(rtl8723bs_xmit_thread,
+							padapter, "RTWHALXT");
+	if (IS_ERR(padapter->xmitpriv.SdioXmitThread)) {
+		padapter->xmitpriv.SdioXmitThread = NULL;
+		_status = _FAIL;
+	}
+
 	return _status;
 }
 
@@ -492,7 +499,12 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 	complete(&padapter->xmitpriv.xmit_comp);
 	wait_for_completion(&padapter->xmitpriv.terminate_xmitthread_comp);
 
-	rtw_hal_stop_thread(padapter);
+	/* stop SdioXmitThread */
+	if (padapter->xmitpriv.SdioXmitThread) {
+		complete(&padapter->xmitpriv.SdioXmitStart);
+		wait_for_completion(&padapter->xmitpriv.SdioXmitTerminate);
+		padapter->xmitpriv.SdioXmitThread = NULL;
+	}
 }
 
 static void rtw_init_default_value(struct adapter *padapter)
-- 
2.50.1

