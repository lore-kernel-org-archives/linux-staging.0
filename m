Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003379DA
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986026; cv=none; b=Xc2kiGjhyNF+7CKL5tKPAT7t5k3ZzEtX6LjD7BUwOWcU1ebR2DKClu4Xd6zPJ7KKu6+oukMkh0FomrNm8Ssmv1TOeGYYOYzIN1Iuce1Ccrz6eyhQtXd9MZLZi3hBl+PachvStWTzT8xydAvjfOUDA+F+ZfQR+h/83t0+wPhqCHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986026; c=relaxed/simple;
	bh=HigGiF9FX2B2ADeoYMONpPaPQPvBWbJsnU14m8E6Cfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=KcrT1d5bt7WlltTyoGQSMl2VMMYZS+aIdGlX5HXlrCY/j6QfRpRJoMW1Co8U9RzZ3r8UJjcGUiLzX0u+HmnHG8DEVA0CDPeoHp5omVKa3zKer+1nLOnZiwz1FTK4+7EMkP9L8C5hD657fUy98bgeEz2fAajWLIIaptMCn6/oByE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=Fssj26aN; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="Fssj26aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786986016; bh=Z6Uop+8fmfCRKeqOVLKT82Goc5kLYRavluzw7xO28n4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=Fssj26aNWPpqkFusViS8yiA/bBVpxCGiu0w/Z7LJrCnC4we6Fuqw2dISMsP8ut868fJsiUJOp5QUT3CB0AXKPr7dSSV44OYRqR2N33xSdZuhlQOmhchi56hp05R6IGbHULG1ornhwNtkFVER+42HAxaMlEvmTXRyVY8V5lGNUHf9NxcnQR72secHAGJVsbxgz4PmDlx1H6xrDzjbHbYzg8A8h5/ZtoUr+fhj7IJY1Ik9gFBtx27BaXbf3dI5eLS7Hls7KJHMVnNMby9zCqDTLWkeBCmjYh+WaHMiF/EChyhT19OS5wnxs7Im/sbAzbV84ocSYq/nuqkotLJ9z8I4oA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786986016; bh=x3vX18MuBY0Fxy1U34kzkhysWnHYTEbORQuXnQGIF88=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=JZlbjavOrjSyoCdg5aO8AT9W46iABBGRlUqHTBjgtGSFOLO6qjbeBNXFvvBbWjAnc0jFnJ1gMlki9ViClV3UcRoWVx0R0PHXmQcnOH7ySbZQMOcB4V/aP7awXPdNz22n4KcEC2QzqAAwVTInWBXycB8ImvNoglizf8HZ5GXy+1a4uAewacGWhu0F1bz+mjwuJWnW/xI/TOdiKVnD0l1JCFVj8UiB7PTrG+Jw6IPV3uGVAkZPP2aSylXFI2xb1RPj/FMperSZT9DveE+eG4SqvsS+RG4PifVfGhNiGSXkteNRBGEQxUBNB8KU44H/Xbql089pkUy4Z5FVUXwYFHND8Q==
X-YMail-OSG: .DaAhXcVM1kJqYcTyiYnZ848.g0gQSVJrU7mGjZryyFkXcaG1V7JZ7Qp667e6yw
 57WGs7MvLP3G0WLcXyRZTvA6bcWT.FpciHGp3ApdogkxqSw7EKpLgVBl4Y_8cZ5audqIOXSXw30A
 Zo4DGGTHKxQvI1G0t7RNkQw8sINpv8q4hCnMtD8etwo9hBGjlVmpiDWWsOEWgQC8NbfKHtD5WRud
 GMqE5HsQJB7ePyqCzaVjTWOwAqE9cK1SEytwjokW2qhb3U73l6ntHyAu_6pv0ra61tH.53wbfWPM
 tc9zJ5Wp46l8ldajiekvdEXmkpiqaW.AiQ574L88gfVgzN6a3HxSVwi73BvhDa72UwqZe5S9R11K
 ZClO.SP8OA8OhkziXdpvyhHE7NOctcojPeNRFnkDZ8AjxH29OFhaPm9ps8isDcmQELNv6lJZGkqP
 MY0uPRJITOjChIOLF7COnNQqP6zoKR1LDc0x2g7ThnLtYQRGvnswXHiwUJXyLRYWzwa9X1Pp6RBn
 8ov5vYDBkIFODIaCUaAddkJneJPsR5VBqk6QeW8Lg1Z9h_P1OSDRl_rpqzUpR6iBDjNUR35o3PPk
 nmh3HCtWxerRlUdcuZYxwROYhpSG.g9HwAGq1mP6FNju09gCVovYLuH3vf544ks0qDX3aPWn0BPe
 7Q204L2F6w0kt98Nn2w.R8w9Et1syUtcKbLCONwVBGJFBAnJHyKzsAiMJ724ntuwXXqv1Xx1OZrR
 upyvM_JmiW_SLZ2Wa0RlbL7mO0mUxw79SDEeTGHJkNGxbs30aPN66NCDa1XQeogkz1ZdeckHMsUV
 JwCgSgN03wifOxOybCNc0nFDLKJ0PEOsPJuwuXOXhxALsc4OpGkXKQK7qmLmWan78kR1lFpNkrwZ
 nTdKpbPnEtqN.jtVwbWHeUDLPNMs_ie6YrhlPHi38jWgyL22e6XInZf2wISvmTTlsL0iOiec0f0a
 2iX8SU2hXvreNHXuoLrEHML8Xok9r2mA67HDiixzKHb4cx7OQC.bxR.hwETn6QFYgyG.tC_AxiH8
 TXKWzQktvTfya0NcygxbZ9n1PEu2l9n.q15i793MxZyr_DnzhZVTQA0yZVrmAA5nne2StpqB4jNb
 fU0F.S_YcHYzEvSUuoJ7y6rddB47TOvvSj1mBkx_j9UVDA.5Evp1hzCy3qfaYFX3fKKXG82rIgWM
 uaH0h1bNOMfG9XLD4It0.ZOXsHVPliTdrXiNKXv6kU1KE2NY8uTlvGAIGxKbdgGhjcctHZc_3pMg
 4nY5W8zp1GwQPurbBl6Er6AkxLrUYgcvqnjuFRUCZFk4KplYOMtCpkF6sEBQw9zoqmmqvoBrjudD
 ata9UO88mEYXr2FZW5cHsXhoC5s7x.3vWbpB2s2RtzUouyxKVEnQQEyeRNd5HW2jchpGBumTFNO4
 gqM5n4coXnOanlpHz5MB.Z2qcT3hOe.GjStJof8NF6awweq.K52W0VKKEAqd2Hekq9weUjY4a1i6
 ZHYSQCfz4IY.nml.Kw71lV6QClE90BvPnTb7jb7.QZI_L3_IZ_AB_3l7Fjdosaoi62IAGle9pOoa
 RkalMzPax682c2.MWEACZMKtRTSJgeSvjH8jRuEbp37gFoynJwpxyZsQVqZI8hzJ1juwbU4bnKrF
 wqdWe9kmmoQ_rG_EKJsG3jVpkUHWNtG5s8Qk4PnNbgjLCnWmzs82qf2RyafmXDgsW.nd0f1R4rPg
 U1PzKTQ1H4qow.pCpsB3sGE6hhX8FesuDwi8vj.XIIEJjWQiRl5T8HSc6f5DTe4irmFdPJEhWhSq
 SnWKS4IUVZ.n0YWD1b3WpymnUz2iKqgpjNGetsy_qiVTUFOdgOCbMGhw_27G9NhS4l_eUvkvgF6I
 hZMzZ2qYjSFP36JKegzMB9TDdT9mE9DlbtSARioOTiGDHklI1UjsecXOOlKNrjt6rfUAp9LYXV4D
 QeetKlUU.WDt_qFxxw6yiW2CKHoUAbgjwhRNBkK4MoTlYXjDxX8pSbi9MIGI3D2fnBhk1wJEvxTN
 rdS2uhz6iW12TeXFAa3g8DGy6vabOdWxQCbQHGwlnXilnH5fu2SjJHZaK4FU6VFM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 935f2dd3-77e8-498b-af22-62e965cc64c6
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Mon, 17 Aug 2026 17:00:16 +0000
Received: from dip154.lsn.ir2.yahoo.com ([87.248.99.163])
          by hello (SMTP) with SMTP ID cdf1d7be6782685fc5ced18ff94570d8;
          Mon, 17 Aug 2026 17:00:12 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 17 Aug 2026 19:00:09 +0200
Subject: [PATCH] staging: rtl8723bs: remove unnecessary void * casts in
 odm_CfoTracking.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-rtl8723bs-void-cast-cfotracking-v1-1-36737b896865@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJaQ1Ur2JYlGHAUdOaTiUmh
 Ltbdfk2/2+gnIUVzs0GmVdRSbGiPTRA1xAXRpmqwRrbGd/2mMvD99aNimuSCSloQZpTyYHuEhc
 0gTvvyBzdiaBWnplnef8Ol+FvfY03pvLNwr5/AP9nmrSDAAAA
X-Change-ID: 20260817-rtl8723bs-void-cast-cfotracking-0ae683c0439c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786986011; l=3412;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=HigGiF9FX2B2ADeoYMONpPaPQPvBWbJsnU14m8E6Cfc=;
 b=05+XATLqaOrQNs2onoRLXs7xeAn/ZodNiwhtH0sgC5wubziYuEq/HdtatKKsBSgN2S7zP8uYG
 NCoO8FGav1SCJpZKJHVQHAXhW4J9LTCN80Uae542DYB34BFdElvaOLY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260817-rtl8723bs-void-cast-cfotracking-v1-1-36737b896865.ref@yahoo.pl>

The conversion from void pointer to any other pointer type is
guaranteed by the C programming language, so the explicit casts
from pDM_VOID to struct dm_odm_t * are unnecessary.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the rtl8723bs module successfully with CONFIG_RTL8723BS=m.
Module loads without errors in a QEMU environment (verified via
insmod and lsmod). This confirms the module loads cleanly but does
not exercise the changed code path, which would require the actual
RTL8723BS hardware.
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 7e6b49399abb..32590a2f642d 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -9,7 +9,7 @@
 
 static void odm_SetCrystalCap(void *pDM_VOID, u8 CrystalCap)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
 
 	if (pCfoTrack->CrystalCap == CrystalCap)
@@ -29,7 +29,7 @@ static void odm_SetCrystalCap(void *pDM_VOID, u8 CrystalCap)
 
 static u8 odm_GetDefaultCrytaltalCap(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	struct adapter *Adapter = pDM_Odm->Adapter;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
@@ -39,7 +39,7 @@ static u8 odm_GetDefaultCrytaltalCap(void *pDM_VOID)
 
 static void odm_SetATCStatus(void *pDM_VOID, bool ATCStatus)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
 
 	if (pCfoTrack->bATCStatus == ATCStatus)
@@ -57,7 +57,7 @@ static void odm_SetATCStatus(void *pDM_VOID, bool ATCStatus)
 static bool odm_GetATCStatus(void *pDM_VOID)
 {
 	bool ATCStatus;
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 
 	ATCStatus = (bool)PHY_QueryBBReg(
 		pDM_Odm->Adapter,
@@ -69,7 +69,7 @@ static bool odm_GetATCStatus(void *pDM_VOID)
 
 void ODM_CfoTrackingReset(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
 
 	pCfoTrack->DefXCap = odm_GetDefaultCrytaltalCap(pDM_Odm);
@@ -81,7 +81,7 @@ void ODM_CfoTrackingReset(void *pDM_VOID)
 
 void ODM_CfoTrackingInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
 
 	pCfoTrack->DefXCap =
@@ -92,7 +92,7 @@ void ODM_CfoTrackingInit(void *pDM_VOID)
 
 void ODM_CfoTracking(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct cfo_tracking *pCfoTrack = &pDM_Odm->DM_CfoTrack;
 	int CFO_kHz_A, CFO_ave = 0;
 	int CFO_ave_diff;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-rtl8723bs-void-cast-cfotracking-0ae683c0439c

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

