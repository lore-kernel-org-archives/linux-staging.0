Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EBF230BF6
	for <linux-staging@lists.linux.dev>; Sat, 27 Sep 2025 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758997647; cv=none; b=nQ3E/iJRjMfqVwW98x2JN5z8apjn5boV1khiTmFZmnWPT/QOLtjiLNyeEUx3rjzXuaEKesqLs+TiBes7CAeRf2x+bjIXCVug6rs9Rx8JxfvO1l0+PehJisAy5F6e68qgXrpMG4tJsJzXRmUp0Otq/X7eEzg3Gk4Jf5p3Njk/97Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758997647; c=relaxed/simple;
	bh=I22T7JxiFABAm/e5gFk5aHy470m2ilmu3HjJetim2g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqpBTb3RWiQhbRPLfjv/JtUqxTlJLld/Iq8wzspO/GrKq5kYz9qIcN/FW0I9dfw/xqLEtPpgz8UP717ZbS8t07s9MWLeMmbzfO/+7Yw5QgwgYdOErG20+RIp/54IDFJCrXaokX4GTkR7VLd8juT7T5nVwO2bMauZWVccxACKyD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7I4Pqpb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7I4Pqpb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so3241266a12.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Sep 2025 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758997644; x=1759602444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQWdFOHyXRj2qTgoQajJtgXcEgv1h3O33kn6+NXzhhk=;
        b=G7I4PqpbrTJ27E9inYI4gTE79h6j8deHN0zSsFa9kDuKFEvJ+2wwS3DT+zdCG/OUqw
         bDWlvVyFhLLcVWYatHsXcKF+RjUrCihqI2ZosRDG+9CZ1PyT0C/9LwYAUG+JIF0uaNXb
         zMUtEnM/SeM/4AAsEJWyxFwFBvV28RfktUT0HTvAQLbgYDZRnbrEhYEckOU4HGySseGc
         RQCcfkJnm8At9EBxjFS3EAzYPTnvQenHczGxo3trSJPCvT84BR5W1rXy53HlnunlJmpm
         jWC276ah7n2gjNYyzn04+K0YkKzFivSgMPtJfhzDB330rZumj9L1zX6KYZ3TQkFG7eyz
         TaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758997644; x=1759602444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQWdFOHyXRj2qTgoQajJtgXcEgv1h3O33kn6+NXzhhk=;
        b=OT/ETpPVdW/kJsF7J0Wu+bTcpG8h30D6R21YU2wP9SrYu//EgNbE6oPg4PRd0dUZrJ
         +6VKVUyqYVoYMN8Mktl57cXCZS7uQ1uR5eeXljy1P7pfxuNiIbdpjsCCVRzkYa/hGSbQ
         48wRFfsojS0BfziGzix6CgaVO4wPLloKE3EG9VzWEi052v3AFKTcbJnxbNoO81I/fTxu
         PKOdDPtHfCBFDuU5DR/Q6pbsyHcVcJabXbzj6rlHTg6EEGV6Hnpr5JMC0IZyuIArzI6b
         ep5JYXoljVgowKJl7csA94f1Mp+WrfnRP0XEb2BCOjCOe6pIz3Zu9Q76aeuKqpooScKC
         6qcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSpWDgh93wx/m9PVqpeMZMrLk/MsLuOoVlr5nCOdf7WTI9n61bOBQ16VPc8N3lV5u4A/pYvtuIT2ZMXiGx@lists.linux.dev
X-Gm-Message-State: AOJu0YyT+hSF4xruJ9YEARJ98YfuINEaH2x+vLg5DalGDCCTffOUFFOQ
	E3WrEu74jCTfFjMgxSp4RZmo/SA/JD61jZTlJSZuygLYXNP/XNaufLCQ
X-Gm-Gg: ASbGnctfSpwTZuIw1lyipFOyp+ENALgG4llJNqHPz9B10nXzg78063bVgr1gK76iyjM
	Q4UVgKzffinNJcFv0PKc/XBKvX1oy33tMoADmOEwGCjR4yIfUeYEv7gAlbuoryiAPESutOVTs+d
	PjXrUqfPdgdflohhfH7Be4QB3hZNZ8vklrX0ydQ28XaXBf7qqiOaAn7PqWVZvsL+95/7E1XA/ee
	Ton7aJYG3pmK5jACsh7eTSrYrfOSEtnMbbNL4bf6tTXg7IDvF2UMVItLL6e7tbxkvg9pdVf9YSG
	1fQoTFjs6we2HG4n1qMbPk64Odcla6h2QGDCoBGH8S2zvedFc1R3Bpp/nzE7wW7POKJMeADUu6d
	tq6qb/8Rs91fch+X7UGOBAVpl9m8LawmtIe/hQDh+jWJhw+xBBz4+nA5nsG2ewP2S6195O9fJZy
	2j
X-Google-Smtp-Source: AGHT+IHzU+aiH3IO9AF5z3S6/qnurfmF3lWjYZ8bVEdWvmfo2izIybdRVaH4K3G/J1amzl+E705jog==
X-Received: by 2002:a05:6402:13d2:b0:634:ab36:3c74 with SMTP id 4fb4d7f45d1cf-634ab363ee7mr8188743a12.9.1758997643660;
        Sat, 27 Sep 2025 11:27:23 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-35.web.vodafone.de. [77.25.33.35])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634bf4a5351sm2691010a12.43.2025.09.27.11.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 11:27:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rtw_hal_set_def_var is not used
Date: Sat, 27 Sep 2025 20:27:00 +0200
Message-ID: <20250927182700.184174-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_hal_set_def_var is not used. Remove the function and
resulting dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 65 -------------------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  5 --
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 16 -----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  9 ---
 drivers/staging/rtl8723bs/include/hal_com.h   |  2 -
 drivers/staging/rtl8723bs/include/hal_intf.h  |  2 -
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  2 -
 7 files changed, 101 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 07e9d3423651..70b5b289f9cb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -663,71 +663,6 @@ void GetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 	}
 }
 
-
-
-
-u8 SetHalDefVar(
-	struct adapter *adapter, enum hal_def_variable variable, void *value
-)
-{
-	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
-	struct dm_odm_t *odm = &(hal_data->odmpriv);
-	u8 bResult = _SUCCESS;
-
-	switch (variable) {
-	case HW_DEF_ODM_DBG_FLAG:
-		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_COMP, *((u64 *)value));
-		break;
-	case HW_DEF_ODM_DBG_LEVEL:
-		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_LEVEL, *((u32 *)value));
-		break;
-	case HAL_DEF_DBG_DM_FUNC:
-	{
-		u8 dm_func = *((u8 *)value);
-		struct dm_priv *dm = &hal_data->dmpriv;
-
-		if (dm_func == 0) { /* disable all dynamic func */
-			odm->SupportAbility = DYNAMIC_FUNC_DISABLE;
-		} else if (dm_func == 1) {/* disable DIG */
-			odm->SupportAbility  &= (~DYNAMIC_BB_DIG);
-		} else if (dm_func == 2) {/* disable High power */
-			odm->SupportAbility  &= (~DYNAMIC_BB_DYNAMIC_TXPWR);
-		} else if (dm_func == 3) {/* disable tx power tracking */
-			odm->SupportAbility  &= (~DYNAMIC_RF_CALIBRATION);
-		} else if (dm_func == 4) {/* disable BT coexistence */
-			dm->DMFlag &= (~DYNAMIC_FUNC_BT);
-		} else if (dm_func == 5) {/* disable antenna diversity */
-			odm->SupportAbility  &= (~DYNAMIC_BB_ANT_DIV);
-		} else if (dm_func == 6) {/* turn on all dynamic func */
-			if (!(odm->SupportAbility  & DYNAMIC_BB_DIG)) {
-				struct dig_t	*pDigTable = &odm->DM_DigTable;
-				pDigTable->CurIGValue = rtw_read8(adapter, 0xc50);
-			}
-			dm->DMFlag |= DYNAMIC_FUNC_BT;
-			odm->SupportAbility = DYNAMIC_ALL_FUNC_ENABLE;
-		}
-	}
-		break;
-	case HAL_DEF_DBG_DUMP_RXPKT:
-		hal_data->bDumpRxPkt = *((u8 *)value);
-		break;
-	case HAL_DEF_DBG_DUMP_TXPKT:
-		hal_data->bDumpTxPkt = *((u8 *)value);
-		break;
-	case HAL_DEF_ANT_DETECT:
-		hal_data->AntDetection = *((u8 *)value);
-		break;
-	default:
-		netdev_dbg(adapter->pnetdev,
-			   "%s: [WARNING] HAL_DEF_VARIABLE(%d) not defined!\n",
-			   __func__, variable);
-		bResult = _FAIL;
-		break;
-	}
-
-	return bResult;
-}
-
 u8 GetHalDefVar(
 	struct adapter *adapter, enum hal_def_variable variable, void *value
 )
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 961b0563951d..462553d296ff 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -115,11 +115,6 @@ void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf,
 	SetHwRegWithBuf8723B(padapter, variable, pbuf, len);
 }
 
-u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
-{
-	return SetHalDefVar8723BSDIO(padapter, eVariable, pValue);
-}
-
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
 {
 	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 18244adad9e0..57c83f332e74 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2839,22 +2839,6 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 	}
 }
 
-/* Description:
- *	Change default setting of specified variable.
- */
-u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
-{
-	u8 bResult = _SUCCESS;
-
-	switch (variable) {
-	default:
-		bResult = SetHalDefVar(padapter, variable, pval);
-		break;
-	}
-
-	return bResult;
-}
-
 /* Description:
  *	Query setting of specified variable.
  */
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 7fcb874d0eb3..6f1f726d1630 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1236,12 +1236,3 @@ u8 GetHalDefVar8723BSDIO(
 
 	return bResult;
 }
-
-/*  */
-/* 	Description: */
-/* 		Change default setting of specified variable. */
-/*  */
-u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
-{
-	return SetHalDefVar8723B(Adapter, eVariable, pValue);
-}
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7ea9ee2b3975..74d6c892c401 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -138,8 +138,6 @@ void SetHwReg(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_check_rxfifo_full(struct adapter *adapter);
 
-u8 SetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
-		void *value);
 u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 		void *value);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 2fa2382ad5f3..82b60899129d 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -199,7 +199,6 @@ void rtw_hal_chip_configure(struct adapter *padapter);
 void rtw_hal_read_chip_info(struct adapter *padapter);
 void rtw_hal_read_chip_version(struct adapter *padapter);
 
-u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
@@ -262,7 +261,6 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
-u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
 void Hal_EfusePowerSwitch(struct adapter *padapter, u8 PwrState);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 2ed1fc8549ec..06e0a549fa9d 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -223,8 +223,6 @@ void C2HPacketHandler_8723B(struct adapter *padapter, u8 *pbuffer, u16 length);
 
 void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val);
-u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable,
-		     void *pval);
 u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable,
 		     void *pval);
 
-- 
2.51.0

