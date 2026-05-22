Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423CA421886
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459111; cv=none; b=mJdVqyDKifT0cMp9SGNSCpFzl6ScmmrJF1MpLx9InUn5sCpcleBeaAPwf6Heq1PbgSQIvhcxxfl8sMoaMIgQWAudf1keHDWMB2lV5hup1o9IXuwrVFMra0iskk4LWi8EC6tmQuMXTwFmL5v1MCRDZOZ0Gt0o0rhImzZdpbuGyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459111; c=relaxed/simple;
	bh=shWUdfpGT/Bx33MbALvut6IRtd8EFgX3Dy8wUEqJ+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ELXrjMpH8pyqCqi1K3Ro5FrrHs1+wHOLBsh4tHgJpweqle/ms0j894rknx2iFnEg8VNL8KlkuxCa9o0tJXZW/kECnr7MQu41Up6osVYkYX/6KaADJq4vuw7N+tnr6cvvxhJiNuwwMo9rNwcYzU6J7WuC7E23E7kjQoRAt7ZZqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pGvR1PXf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e/AeYM1S; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pGvR1PXf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e/AeYM1S"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4gMRzD4qnnzB1DZ;
	Fri, 22 May 2026 16:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779459096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQRqfqAVfhdGkNLmjn4D9vgUTjigCtNi4+OW9MKpfEY=;
	b=pGvR1PXffOK9ukLa/RdDQ0nKh4q5w6ec4qhxgmbzVooKs0RhQVNszaJb6VJH+VFnt02nv6
	DMHnvmuZUUGA2bMm2/uZ64tZLPGBBBBZhwMU6Lpoo9/mzvDzM+AFsw6lDeFtUCPBylNxq8
	HPPCAo3T1GhqLhzveC0YHBXP1GdSECdlnkpGSKNYBBM2ji54fH5M+4Wt8Mv3b59V4T3s4L
	4F0V2ShESbHoW7jXb6JEotaXWRhkm+hA6lbmbHQs17zZwierBGZ2OMgZ9xOQz5OGooR3Y+
	lQyOfz+Xink9HZaHRm2bbEnVE3XIXBcg+lO+O83HHdK6EVYwPVNZ/VC3cIBNkQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="e/AeYM1S";
	spf=pass (outgoing_mbo_mout: domain of oliwieriwan@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=oliwieriwan@mailbox.org
From: Oliwier Iwan <oliwieriwan@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779459095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQRqfqAVfhdGkNLmjn4D9vgUTjigCtNi4+OW9MKpfEY=;
	b=e/AeYM1SAmxXnrxUuR1/2iPyukivSYfRu/XYFsMfdlUYawZ1d04lzbNIXd4L/iVNLIbJoW
	rkhxj+GnHR/zLhmkCZpsIFEkU/pRTJqy02adYYrJBXGdETACOxnV+wcPWIVgb/apFNSH1c
	7MjJe/7drFwytAjINpMj6R+46iVbsHpBBOyb9ub6YCbsWX1f5omjiw18Kv5G1ydDHotXPZ
	dZ2htsxqjTQUvNPIll8scdQRu9zlLo0QXI8CpUKOyI/ysyAvU1W4jaV7nm7cUB7V8suKoM
	BA3xjBraevwp5dMuZjL29ruJUnchzsmxT1BMPfA0DTTmo6nNcdcAOIndwPBZqg==
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Oliwier Iwan <oliwieriwan@mailbox.org>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in hal_com.c
Date: Fri, 22 May 2026 15:11:30 +0100
Message-ID: <20260522141130.169249-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: e738w9xpw6kp3ozm4pscdtq1p6i5eetp
X-MBO-RS-ID: 871405ed453b4ee7ef6
X-Rspamd-Queue-Id: 4gMRzD4qnnzB1DZ

Fix multiple checkpatch warnings:
- Place constant on right side of comparison
- Remove space before tab in block comments
- Align '*' on each line of block comments
- Fix misaligned closing brace

Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 38 ++++++++++++-------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..4b4bfa80e37c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		auto_load_fail = true;
 
 	if (!auto_load_fail) {
@@ -362,7 +362,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -403,7 +403,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -420,7 +420,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -478,10 +478,10 @@ void rtw_init_hal_com_default_value(struct adapter *Adapter)
 }
 
 /*
-* C2H event format:
-* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
-* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
-*/
+ * C2H event format:
+ * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
+ * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
+ */
 
 void c2h_evt_clear(struct adapter *adapter)
 {
@@ -489,10 +489,10 @@ void c2h_evt_clear(struct adapter *adapter)
 }
 
 /*
-* C2H event format:
-* Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
-* BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
-*/
+ * C2H event format:
+ * Field    TRIGGER    CMD_LEN    CONTENT    CMD_SEQ    CMD_ID
+ * BITS    [127:120]   [119:112]    [111:16]	     [15:8]         [7:0]
+ */
 s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 {
 	s32 ret = _FAIL;
@@ -526,9 +526,9 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 
 clear_evt:
 	/*
-	* Clear event to notify FW we have read the command.
-	* If this field isn't clear, the FW won't update the next command message.
-	*/
+	 * Clear event to notify FW we have read the command.
+	 * If this field isn't clear, the FW won't update the next command message.
+	 */
 	c2h_evt_clear(adapter);
 exit:
 	return ret;
@@ -625,9 +625,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		break;
 	case HW_VAR_DM_FUNC_CLR:
 		/*
-		* input is already a mask to clear function
-		* don't invert it again! George, Lucas@20130513
-		*/
+		 * input is already a mask to clear function
+		 * don't invert it again! George, Lucas@20130513
+		 */
 		odm->SupportAbility &= *((u32 *)val);
 		break;
 	case HW_VAR_AMPDU_MIN_SPACE:
@@ -736,7 +736,7 @@ void SetHalODMVar(
 				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
 
 				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
-		    }
+			}
 		}
 		break;
 	case HAL_ODM_P2P_STATE:
-- 
2.54.0

