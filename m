Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F145FFA8
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986710; cv=none; b=nrFKopOmKwzT/2Tx5U2ckffSrpckym8Uj4CNsCqtOy2fzqJ6R3UGszBQYmXscJj6joiqtax19WcHIbmEMI14SW4zSIs5ah9oqx0CX84I7FeVA4w2RZ3mK+ZoJL7X7Owr0Ewn2fp84n1CbXM+U9cnrHiel+OmdukbZpJinMRIUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986710; c=relaxed/simple;
	bh=aKieOi8aG9vbqn0y5LVghLpNDc6fjBP5y9AGxk7ui7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=tf92YR968C8T2gLbSbDBbiXUugcbaNATucQyNUy4w4whM9HLorq1YpWkEHiPJl904eMyS5NHgta+v9KFdPGQpK0Lv6zdPgNVxsTC3UVXVo6tU59J82iKDzh5+hN77Q2Z8uFV8e+m1zXrcVYfFEbt5tgsoqGmdf9d/Ws87Voaqog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=pxjZylnc; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="pxjZylnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786986705; bh=oCyrhQghBxXG+eow43TAgbttI0x0cK4i98QXSy0JhD0=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=pxjZylncGwNs4W3U1nvpn5iZvop9W/EsNJNG4gCGbMU1YxKi6mpHSysYjMLQm+i1WuXU6KStYEJVEPNXQAZErE0xE+Crief6bR69Q/CcKTFxtfBnD/8s4mcdejDyaAzgkCRx/iEEKvyeUFm5F7JikTCF2+/rJplj2QXZ/dBGAOKytbe+XdiYYDKcx76I1AIOz2G0ItOcXey4MWJiMUvxUP32P4JVUmMe+JJ477vtisXQydygxf7cXqlnayF9MnQOBlTxaoEtGWbAHpKXHKKjtavbCz6nPTyURpMAuze9/pH+kED7VnFG1yEXju4SriFz4pyfx60juy0ITcNCrK3lig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786986705; bh=tEajU14t87eyaj90s03ntTvDtSTePswjI4AQudY7t9i=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=hmA9qFMKXTTwhJ1QTckgRtIILO2IwofzXkANj/qKLw4ckRwS9IasBfS3L655w4DkSB6nE4s3EZBHKnq7+b6fiDZX6P1l5xfrmCtNwy+kbNgRXposaqlI6if0VsLuo8y1YyD6gZW7QA8BZr4zJyzdPUNWgGI9yltwJbeA/9DunnnryavAa86cSitNTZ8VqnckUCkF9jG+xsa3s6pPZgtCOuLqTCOsCQNeQdEubtUsr7CSjo4NlJZN9EnExjCzis/Emx/ESWV4/XF9KEEYARt5+0Jl+R4WanfbZ3RG9+3ExZKC+0R6pGRpOaZJ1zwksiac9jPKKFRFi9kEfypW/uVVFA==
X-YMail-OSG: FkHlcGIVM1nlKZ6dYiwP0yjpWczknzcXNrKMQXHt3NQdXL2nM012OvP1zY8TQoj
 UsNTFsXh_BESyv2ZyOudaR7B.1PR.Iq_npexDHK.q2hWAcyhIfmcUrLc50K._C.voRWlw5CmTcsT
 7qSPV9rt5qgG1pGUcexuwIWMSnzQQF2PairTfq4gJS46Z36djneQorTHHU7D_eNdPwVFSTTBUYHN
 ZOsMThq3AByFuWUV24299LM5XyIpOzxLw63zdvIDwY65JVVKKm0nuWlWVXX0YAJwEr2iVP.2AF44
 TOkJcXCHtOjgp6ygrz1y4pie43AMew682YgXIf.gja_pJ_9rSjJrhNgGShYmdFVfvHAKhWX2ssUm
 8tWzAm9Wovg6XhFLq_sxoAAcetQeIOds2xwSuFmmkjWFIvmNMTR_6L5Bxfq0d74smE5V5k1oPUjH
 rZ4mqUXMlhjqYbO15WqQdVByz9PvbXTHQ98lYtl2AONQiWht4lOXdOrPAxPUxK1Xz__I0T_aqOW4
 QvwFDokHnDh_3_4PTEq2miNlV14beEQEZq5XTCM2W1Icifv1NklRn_eNUBQR_MvOS7HeKHrS526i
 cjKp7DKeYsRzGlbpx3vvLcJH.gMK1a9JwTSmxtyY_2KiViyCGHKKglKXMxMPNCtEkeMzSCSNNKsz
 cA8EN70Jmo2wzo8L0b28OOX.GsE3wGj2ijK_dLFRz8xYTZKHNl7mqGWBgWtSIT392JG9hkdB_oU8
 IPQ7iPw_0n8PNXcaP9m_9PZoXNK30hbxep3EPXaR8z8Pn8SW1bv2zJmkIXcsLNLYh96k.5.HaQTY
 g9I_puBVop6WMTtaVwLd4NQtZcbnNZkRd0eRV7RDOII7nVm4S1RGjOtDnvGtH28tgAtngN0LsRu4
 iHrrx3K.bI99s7hhZwgMDeXysqio6bW2KQ.9.GqozB5QgsDYIuaxyVc8dEA72HHxg8Q.ScWVhOPS
 jPOIHqJwRIb.JvWK2d8IGrP5xIb1d6GUB60YpcN.H6Cbi6KPN3ybBmYbrx.4IqGNtCbltGqNAq5v
 6D6VPu5MTKto.odgG7_UtZtUA5SosEQYU.I1Tsv1Vl6RaxNmrKPn8djmifg0Y6OK9zcs0.t9qpFv
 9qe7E_4doUwL6My7seGd13PSOjmk8JZKGFmSBba2J6ZbsAexL8rEALPgkpr92zwMkqnbEqOCURPr
 s3ols6_ZEIOqYjHsYHPTCRKQ77ksQhinpiaB24kOM8R4G8ijQB0or8trpy_zHEDVWPeKl0eyySjH
 KTkc.aY7nxWnliCPrAoqfNzqf9KmVgmPtsdBO2qKKbjRVDR06Wp21BwXRCYeTzh.ACYzDSuZxd56
 34iiDCBFp1mxSPA6ZkyZEtT8YFxFcCR8fDaKN63OO7pMliGD5th6RMje3sIG1WLYX9G3Kv.Pv8Eh
 ekJTeEFHOuXUlIPQWD8.Ew1CsK12c1fmE3y9hAZaTD83Lk7JH6OkW7hiZPg0ShLpf6ezOZbqYfeX
 UucFHvOuYomNYz7zK28jK6MeyTAFPMEEJrJVDbPTVuzj6POGdT6_JxUpbQe6o.6ItVvlzjCNyFq9
 3bQ0d8ePXVjSuikZOWKYZJw0Jy_hEKGthh_WBNsKClXxR4ikJN.dOMzN.S0_TG9pl0cj7kA7xGG5
 UM.0SaUaGTJTTs.T5mX.HvRz_MewTSFRHRWTmWs.h_Uo7hMPLCp0_6nQ0rN0faEThWJBLdur1MtA
 AKoOjVic0hpk77OEidfYUSLHC1pFxpo7tUt12JBXLmvrP_t2tSQFllWG0Fy.07AYgq41JJJLWurl
 9knXmFB15cOylpdrwePw0.RLn6hb22du3pbvp6.zg1BrNeXkkTjvi0kPsAZ.BcEF_9LPq8M8gEJs
 dMPSBoqSlrHxT9ahR1k6RgtAyDEJVWnuk8y_Q56UDGJw4slLh5DLY3xpdzrnHXYPmm0THkoC3ZsQ
 ll72vDWPxlBvefNlTNI92rr1YTrYFKPYwoTuGsJ2UaRipgMvm8zm36qtvMQIzCrcHo8dUuR193uH
 w7Pk.5eeX1sWW0A93T_XOHsAQv_NMK1E.0LKVmMvmKCRPkfrvlgnup1m7p5OlBXNf
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 03c0c568-4c7b-4686-baea-a0c919cb8b72
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Mon, 17 Aug 2026 17:11:45 +0000
Received: from dip47.lsn.ir2.yahoo.com ([87.248.99.56])
          by hello (SMTP) with SMTP ID 811838e7e267136c057efa8caa7511c6;
          Mon, 17 Aug 2026 17:11:42 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 17 Aug 2026 19:11:40 +0200
Subject: [PATCH] staging: rtl8723bs: remove unnecessary void * casts in
 odm_DIG.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-rtl8723bs-void-cast-dig-v1-1-d4d011502abb@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrB3QWJLQq4iL/Iw6UlQyqRTEu
 5u2y2/x3glCiUngWZ2Q6GDhbS1o6wrC7NaJkGMxqEbpxrYGU35ZozoveGwcMTjJGHlCr83DWTt
 GpzWUek808ud37oe/5e0XCvm7g+u6AQ9ZpK57AAAA
X-Change-ID: 20260817-rtl8723bs-void-cast-dig-b674a88fda66
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786986702; l=7255;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=aKieOi8aG9vbqn0y5LVghLpNDc6fjBP5y9AGxk7ui7k=;
 b=hIHW27lna/w3vTys6Cux3gTaiNaMT7dp2IdHReUTfUzKGsW+Nk/vs8QROmZhAaKV/gvGeu0vT
 QaIxUtj3KAPDKOcF60TqjzLqNCtIHfwQMPXT7b0pZ1+Bi+USoXH3NvY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260817-rtl8723bs-void-cast-dig-v1-1-d4d011502abb.ref@yahoo.pl>

The conversion from void pointer to any other pointer type is
guaranteed by the C programming language, so the explicit casts
from pDM_VOID to struct dm_odm_t * are unnecessary.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - the same 82 pre-existing style
issues are reported before and after this change, confirming no
new issues were introduced.
Compiled the rtl8723bs module successfully with CONFIG_RTL8723BS=m.
Module loads without errors in a QEMU environment (verified via
insmod and lsmod). This confirms the module loads cleanly but does
not exercise the changed code path, which would require the actual
RTL8723BS hardware.
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 4e28b7742bfe..3f6ffc62fe00 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -9,7 +9,7 @@
 
 void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 {
-	struct dm_odm_t	*pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t	*pDM_Odm = pDM_VOID;
 
 	/* PHY parameters initialize for n series */
 	rtw_write16(pDM_Odm->Adapter, ODM_REG_NHM_TIMER_11N+2, 0x2710);	/* 0x894[31:16]= 0x2710	Time duration for NHM unit: 4us, 0x2710 =40ms */
@@ -25,7 +25,7 @@ void odm_NHMCounterStatisticsInit(void *pDM_VOID)
 
 void odm_NHMCounterStatistics(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	/*  Get NHM report */
 	odm_GetNHMCounterStatistics(pDM_Odm);
@@ -36,7 +36,7 @@ void odm_NHMCounterStatistics(void *pDM_VOID)
 
 void odm_GetNHMCounterStatistics(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	u32 value32 = 0;
 
 	value32 = PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG_NHM_CNT_11N, bMaskDWord);
@@ -46,7 +46,7 @@ void odm_GetNHMCounterStatistics(void *pDM_VOID)
 
 void odm_NHMCounterStatisticsReset(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT(1), 0);
 	PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_NHM_TH9_TH10_11N, BIT(1), 1);
@@ -54,7 +54,7 @@ void odm_NHMCounterStatisticsReset(void *pDM_VOID)
 
 void odm_NHMBBInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	pDM_Odm->adaptivity_flag = false;
 	pDM_Odm->tolerance_cnt = 3;
@@ -67,7 +67,7 @@ void odm_NHMBBInit(void *pDM_VOID)
 /*  */
 void odm_NHMBB(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	/* u8 test_status; */
 	/* struct false_ALARM_STATISTICS *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt; */
 
@@ -117,7 +117,7 @@ void odm_NHMBB(void *pDM_VOID)
 
 void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	u32 value32 = 0;
 	u8 cnt, IGI;
 	bool bAdjust = true;
@@ -185,7 +185,7 @@ void odm_SearchPwdBLowerBound(void *pDM_VOID, u8 IGI_target)
 
 void odm_AdaptivityInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	if (!pDM_Odm->Carrier_Sense_enable)
 		pDM_Odm->TH_L2H_ini = 0xf7; /*  -7 */
@@ -212,7 +212,7 @@ void odm_AdaptivityInit(void *pDM_VOID)
 
 void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	s8 TH_L2H_dmc, TH_H2L_dmc;
 	s8 Diff, IGI_target;
 	bool EDCCA_State = false;
@@ -277,7 +277,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 
 void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->bStopDIG)
@@ -303,7 +303,7 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 
 bool odm_DigAbort(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	/* SupportAbility */
 	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
@@ -326,7 +326,7 @@ bool odm_DigAbort(void *pDM_VOID)
 
 void odm_DIGInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	pDM_DigTable->bStopDIG = false;
@@ -362,7 +362,7 @@ void odm_DIGInit(void *pDM_VOID)
 
 void odm_DIG(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	/*  Common parameters */
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
@@ -557,7 +557,7 @@ void odm_DIG(void *pDM_VOID)
 
 void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct false_ALARM_STATISTICS *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 
 	u8 RSSI_Lower = DM_DIG_MIN_NIC;   /* 0x1E or 0x1C */
@@ -595,7 +595,7 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 
 void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct false_ALARM_STATISTICS *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	u32 ret_value;
 
@@ -684,7 +684,7 @@ void odm_FAThresholdCheck(
 	u32 *dm_FA_thres
 )
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	if (pDM_Odm->bLinked && (bPerformance || bDFSBand)) {
 		/*  For NIC */
@@ -700,7 +700,7 @@ void odm_FAThresholdCheck(
 
 u8 odm_ForbiddenIGICheck(void *pDM_VOID, u8 DIG_Dynamic_MIN, u8 CurrentIGI)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
 	struct false_ALARM_STATISTICS *pFalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	u8 rx_gain_range_min = pDM_DigTable->rx_gain_range_min;
@@ -750,7 +750,7 @@ u8 odm_ForbiddenIGICheck(void *pDM_VOID, u8 DIG_Dynamic_MIN, u8 CurrentIGI)
 
 void odm_CCKPacketDetectionThresh(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct false_ALARM_STATISTICS *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	u8 CurCCK_CCAThres;
 
@@ -787,7 +787,7 @@ void odm_CCKPacketDetectionThresh(void *pDM_VOID)
 
 void ODM_Write_CCK_CCA_Thres(void *pDM_VOID, u8 CurCCK_CCAThres)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	/* modify by Guo.Mingzhi 2012-01-03 */

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-rtl8723bs-void-cast-dig-b674a88fda66

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

