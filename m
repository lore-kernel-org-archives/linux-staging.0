Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704702AF1D
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 04:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300622; cv=none; b=hNuuubGMY2tp0nwUgmkgyhPJpnacwe2Y4/ITbLukPf9tO7b9uEu0SD6XojU/P38596zAE6yro10ZQx3agVdp1EbDb0hn0vEn4tQGiFY5bmMdfVuOBv/NdW5zfq953+bRYnoVrwkyIygeiCbIqM6aYge/xocj0f9vuBjBj4WKh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300622; c=relaxed/simple;
	bh=0T6qjHsNZxO9w15fToqOWcd9m2mIzAFQaIC/5vygG9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A4yVHgbQAyKnCmc9f9K1djnwR4qUIflaXFCrRWp3NoSeAjwWh7sGW+1rBYoTgbyjCLzSm+GvBDJ4SKftL25nVBoOJtcr0R2R7dVAGW/9UyUI/vOqx/HLx4+oCqgKisaGlet8gxppsTsrS3wAPdAXKYbCl8dau43WCW3YDN/ivmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LblgLBBz; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LblgLBBz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f7020a928eso3672084eec.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 21:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778300620; x=1778905420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OeFnHlOvTtUV47d0Rz6zh6gVSL9a/ePsR4VyuJRUtU=;
        b=LblgLBBzR506VGpocYxsI1t4M8BwmLoLXoP+NsLzPGw9EDWiYZDHgaJBDkXK318Vac
         vru7forHyNTp7TX8e6QtzqHshR3n0jw79m1LFanlxyV2kV6LgJ2IeqDvNDLtylapq5q1
         5MEb1UhytmDdvao0DZ9hMtZpqLn2PnNFxVrqBvZ8ioVy2s3L509Pgl5uP7tUQ5/qcr3r
         c27zPF3HKthbU188OMN+gAMnblSA/5rHspf/ASdbcOk1OR68ve6tItzz9LzoGJ02KVLP
         zBTBo0S8dMQQugDC7kFzP7EVUZRldNG2g6RZHeAyYzi7/Ly6/BrrCgikuCQ5q3aSkm5m
         I85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778300620; x=1778905420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OeFnHlOvTtUV47d0Rz6zh6gVSL9a/ePsR4VyuJRUtU=;
        b=UwLFWfanuoQy9X/eWKh4TJrnkPl4ijVYa809zlC0y60Z6kiiBykMn/joSmxOcZTsPB
         /ITA/lUuKLrjNL7f9zLQhmFQvUzRWaPidknfaiD1RG+UbyQk2O5S1Qq9w9hj9U6yjxN8
         E+ToBNgmgLpGJcXqu1qatKesQC9Qby+Exz34YhAsxMJBu23+IJSrbmcDn6M+FrSRZaS8
         d0PW8yZgcJ86RJPy0Wxd0/LS7gz/Ga2LDrucZRc/W8puMKRL+zWzohDpSt7ZaCxkIXhm
         emtfs1dsvaAokj2Rzb364VR8bRgKmQ1g/VRQAhi03pbbEaw9O1w3yDxMf5y5w79fvGB2
         ju7g==
X-Gm-Message-State: AOJu0YywwhmW7huyTuhq39A5IGCHnfAs0HVXXO2Dc0k64hC+O0MqWw72
	p0rSFnRq4p7R7ahjjeNicUQ658jKQ4BssZjo6bLYCpMIHNnIOQBnEDCRtCpRnw==
X-Gm-Gg: Acq92OFGB9hxk/sZVeXB/S7wuNV51gEYBQTVzXRG3pZPVGL737AMrY5w/WG4j1pJIFO
	749Ca7XT+DmQgaAwsgtzF338ZXPMIhiT790H7Dz9neDnFdGilStIie8tmf5FJlWprqHmhMpaKoz
	a08LFnmplBCW35xfEY4I7+wYZwbY2o+XVmSIMpTRXmmfDL0zNeWeZMjURmyUuk3O6SORFCc1V2N
	eAwZNn3PcGKTb9p6HBQUN5PkZcZyO2FUpLzxcML/Eshvk6Qw6nQNrKqPio/QTXLPYvn5gw3d7/Y
	/JftEHO9pq4Cmm2COevygxbg08YYx+gCUNgYneugnYZDpHx4M3QvXLdcKP8nMZRoK6vBl3VVI7x
	TJJrmPVbLCO81XWhLtsdzerU4Jpeu2dvOq68FhyKdv7sRVrzRmBhXn8+NKs+I6y/wIk4kPQ0H/0
	pTT55bLnrcbfFbpbOKxg90Fxi9V6wsKyymwQvzE5U/b0E=
X-Received: by 2002:a05:7301:1e4a:b0:2c1:7793:7bbb with SMTP id 5a478bee46e88-2f54af69705mr7547070eec.27.1778300619928;
        Fri, 08 May 2026 21:23:39 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f8884750ffsm4950956eec.19.2026.05.08.21.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 21:23:39 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix block comment alignment in hal/ source files
Date: Fri,  8 May 2026 21:23:09 -0700
Message-Id: <20260509042310.4745-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509042310.4745-1-guojy.bj@gmail.com>
References: <20260509042310.4745-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add leading whitespace to block comments in order to adhere to
the kernel coding style.

This fixes the following checkpatch.pl warning:
  WARNING: Block comments should align the * on each line.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 28 ++++++++--------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  6 ++--
 drivers/staging/rtl8723bs/hal/odm.c           | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 14 ++++----
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |  2 +-
 5 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 25686aeb073b..51dbb21345f8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -435,10 +435,10 @@ void rtw_init_hal_com_default_value(struct adapter *Adapter)
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
@@ -446,10 +446,10 @@ void c2h_evt_clear(struct adapter *adapter)
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
@@ -483,9 +483,9 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf)
 
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
@@ -582,9 +582,9 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
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
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 1e5669b17d0f..ea79e300f83b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -407,9 +407,9 @@ struct adapter *padapter
 }
 
 /*
-  * This function must be called if the value in the PHY_REG_PG.txt(or header)
-  * is exact dBm values
-  */
+ * This function must be called if the value in the PHY_REG_PG.txt(or header)
+ * is exact dBm values
+ */
 void PHY_TxPowerByRateConfiguration(struct adapter *padapter)
 {
 	phy_StoreTxPowerByRateBase(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b4f872f4d6c9..4f9e5edecaa1 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -279,22 +279,22 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 }
 
 /*-----------------------------------------------------------------------------
-* Function:	odm_RefreshRateAdaptiveMask()
-*
-* Overview:	Update rate table mask according to rssi
-*
-* Input:		NONE
-*
-* Output:		NONE
-*
-* Return:		NONE
-*
-* Revised History:
-*When		Who		Remark
-*05/27/2009	hpfan	Create Version 0.
-*
-* --------------------------------------------------------------------------
-*/
+ * Function:	odm_RefreshRateAdaptiveMask()
+ *
+ * Overview:	Update rate table mask according to rssi
+ *
+ * Input:		NONE
+ *
+ * Output:		NONE
+ *
+ * Return:		NONE
+ *
+ * Revised History:
+ *When		Who		Remark
+ *05/27/2009	hpfan	Create Version 0.
+ *
+ * --------------------------------------------------------------------------
+ */
 static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
 {
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 6c9337179645..2485c415f14b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -32,13 +32,13 @@ static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 
 
 /*****************************************
-* H2C Msg format :
-*| 31 - 8		|7-5	| 4 - 0	|
-*| h2c_msg	|Class	|CMD_ID	|
-*| 31-0						|
-*| Ext msg					|
-*
-******************************************/
+ * H2C Msg format :
+ *| 31 - 8		|7-5	| 4 - 0	|
+ *| h2c_msg	|Class	|CMD_ID	|
+ *| 31-0						|
+ *| Ext msg					|
+ *
+ ******************************************/
 s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer)
 {
 	u8 h2c_box_num;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index ffb35e1ace62..e56536dbbd96 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -24,7 +24,7 @@
  * 11/05/2008	MHC		Add API for tw power setting.
  *
  *
-******************************************************************************/
+ ******************************************************************************/
 
 #include <rtl8723b_hal.h>
 
-- 
2.34.1

