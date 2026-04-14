Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04753CBE69
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160744; cv=none; b=svdUxHTygeoBSMx4nN2DSX2jake2s6U5qdetaQWZZoMZ9kbq2NkQMDclGyvaDr0/qiPt/jsy2ieAC6QaEd0hiSVCzX+BfPlFGsXuvh3DNIIR5s3Dk2j2B6j+8rgOYp2reZL3+gu6x9LkW/bvBNwX0MFNUKHazfK511muFLmUM9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160744; c=relaxed/simple;
	bh=rHwXM+sex2p2dGPe48QH17nnOkpddITFHnXPlwJpycA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRlRwKZXqKBOgv1OERi8qiXQv4poOmB250szmbOQgtGrNYihEKmoOl560mZjJ/TLVtrM+qRGdTh4AvA8kaOlRq60cniZE1xNP1Mqxa+TUmHOWQkS8cDuFtqhOcZ1i9kdc1FDfuOT3blHNmktWys47q+Jh12HgvXEkep1mF+IriA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQSVT35L; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQSVT35L"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-386b553c70eso48146631fa.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160741; x=1776765541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z870y+WgVq6dBDNjDxbOvCEshdD3HN+G5/wMOHsX9mQ=;
        b=gQSVT35La7uy76ETMmTlme462zOpTph6gwDZopZw+pzbweelwBq0o+BQpkEvrQbm7I
         T0G4F/b/acFJ6RebjE4k9Bnohezi41zNITKxrpW6hCM+JVxi9R8iG4z0cVFbQHuXNT0d
         AhXbOvk30z1f2AbEAKzwFHDhk7GcIm0IZlJ1v3ANjsrq0PUiVvLiQLrlFEEaR0Rqi5hM
         ZBPEPeZtSSx0w31fQAR3m3Oz9eoGKpl939TQLGprehz4Ccqa2bOiGilPTGoyAdVWK8/2
         DBcNu0T+J2tA2Jgnw25Edtwb7nX3NYk0s9WK+6sd1LYYAem6b0snhSkBm7StZLwWlF9r
         tvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160741; x=1776765541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z870y+WgVq6dBDNjDxbOvCEshdD3HN+G5/wMOHsX9mQ=;
        b=mCwnvvfV8AIxU4J74HxqZJfA6a5O/aL/j0o2HRqS9S7n8+pgaweNxI0SbAH++C6AUO
         NlUF/4X+O1FJ1BM8Z3S4+Lz9IwHaNvSX4VEabHMehasUCu0T3zG+3qlXb0rDVrTZ39jU
         3y7PmuTH63zowXBmMKgI/sNDo9HS1ntid8Ii44y0Y9U1vupR2UgKmA1KktXYISDfTI+v
         0b6xoNNzaChwrQLJ9i6G8BBGVDuIDBlscBp/O7WxBkHf5J8/AM/ID94TtC9ziyqbx2En
         ibhFFbJeBMXTfDBa20/k+U/IS+fgNQLT/4dRyZmFZGUOCZt2k2ChCKTK4AbeHmfOxjU0
         KWww==
X-Forwarded-Encrypted: i=1; AFNElJ8xGcX30a/ZcKeVOkCC+MbbJtO75m8SO9uaqzjbBr2u7jxTkc/B+aRQPeavG9HRPiCiwwcr340aKWSosae2@lists.linux.dev
X-Gm-Message-State: AOJu0YzKWt/km94dltJXMr0L4zz8GuS/LGelQGrhfxXOOIKc+qX8pQNN
	UplLL9diFRL6Y6m7Jk9+1mPewXLoGSTIO5X3vGI4eCu6VCnYa647Quhq
X-Gm-Gg: AeBDiesD1F+0cOyNWYdDUUbhKiDr15AvGn7rzNqoSAwIzjkVUsfIHkJ/KRmiAfYDB2i
	Y/kJsFerLX/YxtEs3t4CubT9MhcnBC3VV6dii1xX8mbl7HPvBbbplaGAndSx1ImGAQ1buq6JwG+
	2Y0OcCQsbWR0plI70urhoDLrV1pzm9hTd20Yw0EOD7SPy4oUORXd0dngtsnLICbcXOQtCYkhTim
	Mx9VMHbaY8f0+on2XKSA9nmxwN02D9crrdAHoaEW8mpQAEoLeY6s9RjIJNeBVsPm15Z5PLLKXfg
	N65YxYqy1PpumOCWK/bO1NIrOdwfHLshW54kxLmw8g9oGPwj86p70Ipbpb9EMFSz5BEn5DsCI7F
	imtA48u0oQD9Hb5eHPdRu64OKeaefgFKxDFchsYvO/a6iZuDyCRecflVgeiVqM0dzeGYmeReA92
	HXLw1HFqCLBzxNrw==
X-Received: by 2002:a05:6512:1385:b0:5a3:ffd1:fbcf with SMTP id 2adb3069b0e04-5a3ffd1fbe5mr2699525e87.17.1776160740969;
        Tue, 14 Apr 2026 02:59:00 -0700 (PDT)
Received: from arbuzik ([213.79.119.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eef071cbsm3208359e87.80.2026.04.14.02.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:59:00 -0700 (PDT)
From: Marc Finkelbaum <regpacy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marc Finkelbaum <regpacy@gmail.com>
Subject: [PATCH 8/9] staging: rtl8723bs: reformat switch-case blocks with braced bodies
Date: Tue, 14 Apr 2026 12:58:32 +0300
Message-ID: <20260414095833.76480-9-regpacy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414095833.76480-1-regpacy@gmail.com>
References: <20260414095833.76480-1-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the opening brace from a separate line to the end of the case
label (case X: {) and combine the closing brace with break (} break;)
for HW_VAR_SEC_CFG, HW_VAR_SEC_DK_CFG, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
and HAL_ODM_STA_INFO. Also add braces to the unguarded else clause in
HW_VAR_SEC_DK_CFG, reindent the moved declarations by one level, and
fix over-indented bodies in HAL_ODM_P2P_STATE and HAL_ODM_WIFI_DISPLAY_STATE.

No functional change.

Signed-off-by: Marc Finkelbaum <regpacy@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 62 +++++++++++--------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 44bef1400947..2688355f9265 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -561,16 +561,13 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 	case HW_VAR_INIT_RTS_RATE:
 		rtw_warn_on(1);
 		break;
-	case HW_VAR_SEC_CFG:
-	{
+	case HW_VAR_SEC_CFG: {
 		u16 reg_scr;
 
 		reg_scr = rtw_read16(adapter, REG_SECCFG);
 		rtw_write16(adapter, REG_SECCFG, reg_scr | SCR_CHK_KEYID | SCR_RxDecEnable | SCR_TxEncEnable);
-	}
-		break;
-	case HW_VAR_SEC_DK_CFG:
-	{
+	} break;
+	case HW_VAR_SEC_DK_CFG: {
 		struct security_priv *sec = &adapter->securitypriv;
 		u8 reg_scr = rtw_read8(adapter, REG_SECCFG);
 
@@ -578,12 +575,12 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 			reg_scr |= SCR_TXBCUSEDK;
 			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
 				reg_scr |= (SCR_RxUseDK | SCR_TxUseDK);
-		} else /* Disable default key related setting */
+		} else { /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK | SCR_TXBCUSEDK | SCR_RxUseDK | SCR_TxUseDK);
+		}
 
 		rtw_write8(adapter, REG_SECCFG, reg_scr);
-	}
-		break;
+	} break;
 	case HW_VAR_DM_FLAG:
 		odm->SupportAbility = *((u32 *)val);
 		break;
@@ -653,19 +650,17 @@ u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 	u8 bResult = _SUCCESS;
 
 	switch (variable) {
-	case HAL_DEF_UNDERCORATEDSMOOTHEDPWDB:
-		{
-			struct mlme_priv *pmlmepriv;
-			struct sta_priv *pstapriv;
-			struct sta_info *psta;
+	case HAL_DEF_UNDERCORATEDSMOOTHEDPWDB: {
+		struct mlme_priv *pmlmepriv;
+		struct sta_priv *pstapriv;
+		struct sta_info *psta;
 
-			pmlmepriv = &adapter->mlmepriv;
-			pstapriv = &adapter->stapriv;
-			psta = rtw_get_stainfo(pstapriv, pmlmepriv->cur_network.network.mac_address);
-			if (psta)
-				*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
-		}
-		break;
+		pmlmepriv = &adapter->mlmepriv;
+		pstapriv = &adapter->stapriv;
+		psta = rtw_get_stainfo(pstapriv, pmlmepriv->cur_network.network.mac_address);
+		if (psta)
+			*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
+	} break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)value) = hal_data->odmpriv.SupportAbility;
 		break;
@@ -702,24 +697,23 @@ void SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVariable,
 	struct dm_odm_t *podmpriv = &pHalData->odmpriv;
 	/* _irqL irqL; */
 	switch (eVariable) {
-	case HAL_ODM_STA_INFO:
-		{
-			struct sta_info *psta = pValue1;
-			if (bSet) {
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
-			} else {
-				/* spin_lock_bh(&pHalData->odm_stainfo_lock); */
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
+	case HAL_ODM_STA_INFO: {
+		struct sta_info *psta = pValue1;
 
-				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
-		    }
+		if (bSet) {
+			ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
+		} else {
+			/* spin_lock_bh(&pHalData->odm_stainfo_lock); */
+			ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
+
+			/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
 		}
-		break;
+	} break;
 	case HAL_ODM_P2P_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DIRECT, bSet);
+		ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DIRECT, bSet);
 		break;
 	case HAL_ODM_WIFI_DISPLAY_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
+		ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
 		break;
 
 	default:
-- 
2.53.0

