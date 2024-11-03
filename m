Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DAA172BCE
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621701; cv=none; b=GVVBqmHJswiOCtDVM1R+sXBB3PnuV9YzKK0dK6Rzf2LwbhYDp2bkWnJHheqwNjQIAJURoQ8+Gaecz2f7B8NpEQfWnuy7WGa/9yCLhUnvgBNKYXnVbc0eM/ZPEajVQIvvwzbNNTTwFgrK+3pinwhAGAnOhA9FLMvUGUkq30Ty9HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621701; c=relaxed/simple;
	bh=WvdiGCaxVVUYEgBqSVJnMlolDTeNPErLovjLDKdb43E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj4QmHlGOlEn/4QmKS+5MrB9H5PuN1GIm9aovW5pnvTfo+augaEK+j78jITXbQC62ttOy0mHAnHDM0rQjvb+8XGh1UylAbdYwYnuiS2b8S17e9yyvJSDJKYfPhAIZ7+Ll+0y9td6Op/rYC1yJgt3n2NPQkzcvckintjNjAp31cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGSkpYnK; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGSkpYnK"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso511128566b.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621698; x=1731226498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWg7e149C7FsdITnlVLLumGagoPJ2vVxsltogaRDfow=;
        b=OGSkpYnKrhY9a+zCU5slrpkSGNgJD6AAcfDbyi/yvuPrGofAtTpmh+k9mdbBCuULHA
         uiNbS8zPA8jEP4tQsGopcBgbgBwlkJzb+ABy8PDMdx403yUw/YXa8fkuZfFNc6tn8deg
         imDgdpin35zuSknM2bnwEU9ABlRE2EsAukmAqcium2UbhvpwEO948/zAq3EOBbe1Dgrt
         vuK2fi0OhqGpFCbLXXiPblXoTuHseD934rslYwU02DIZgHbg+dVpvx8yB1ykArN9hBUL
         8ol7s59n9tO1NancujVtL7bgsCLaMeLs4cv70ILgirSTrOSPpLbdaEH40wNw4MA5Grjo
         yKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621698; x=1731226498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWg7e149C7FsdITnlVLLumGagoPJ2vVxsltogaRDfow=;
        b=l1pC11JhkcG6ac95jH1lYxrFEiW4aEbQxoXAIZusiKinOjpcB7opCUw6k3f3SWEhpx
         bY7XoiPJdDTxjK4+4qCQD0YHSDvl4sO/0YyRM2ABavATydXSJTTJM7zjOUAOiPOmmL6G
         JdXCZiaB1KlPdMD178q6ivQT4FdYAvEwIoTJQ5RLdCc+JA4185ypjA9r2EcMcEfrW82Y
         zOR+CYDDAR3SiYGNh+V18hmECj9RCA4lIZ9P+jbN3rF4SCSNFIHhCP53OMEEFuGEG++a
         fhj+KnOF7FO3bKvvVpY84H/5czoHV8NrGYWWKvp54fW43ED9BwFPT0KJFTmQBDcErpfd
         goWg==
X-Forwarded-Encrypted: i=1; AJvYcCU9kg3eqJYm598rlQQhpZt2sMrUIkz+J0rlc5dbCmjfFT3HD+S0g2KKUy1/PK9WujAtMcruiH8ss+Ee1VOz@lists.linux.dev
X-Gm-Message-State: AOJu0YxYYP3a574MCdLvj+CgpG84XQyqZJZLQDvgl5CHU5uKo2q8KwdZ
	igjSlIVywCCrva0wyYwVD4En7ES88ajTkwqTiFve7hiiyJYHn6sg
X-Google-Smtp-Source: AGHT+IEuxr1oj7dC/XJZuFzAE/uA20NlwaalxktRYv2bsG3PFA+4Xepe5F/VipkNkkxteyrz4TnHAw==
X-Received: by 2002:a17:906:6a09:b0:a99:ffdb:6fef with SMTP id a640c23a62f3a-a9de61cef8amr3051400266b.46.1730621697851;
        Sun, 03 Nov 2024 01:14:57 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:57 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 10/13] staging: rtl8723bs: Remove function pointer SetHalDefVarHandler
Date: Sun,  3 Nov 2024 09:14:31 +0100
Message-ID: <7a6c87ca6b746392517275eb4f6837c0ccaabff1.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer SetHalDefVarHandler and use SetHalDefVar8723BSDIO
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 4 +---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 5 +----
 drivers/staging/rtl8723bs/include/hal_intf.h | 3 +--
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index e8b31b80917e..d45dfa8e638e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -123,9 +123,7 @@ void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf,
 
 u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
 {
-	if (padapter->HalFunc.SetHalDefVarHandler)
-		return padapter->HalFunc.SetHalDefVarHandler(padapter, eVariable, pValue);
-	return _FAIL;
+	return SetHalDefVar8723BSDIO(padapter, eVariable, pValue);
 }
 
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b1b40f6077fe..ccf1e9727846 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1247,8 +1247,7 @@ u8 GetHalDefVar8723BSDIO(
 /* 	Description: */
 /* 		Change default setting of specified variable. */
 /*  */
-static u8 SetHalDefVar8723BSDIO(struct adapter *Adapter,
-				enum hal_def_variable eVariable, void *pValue)
+u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
 	return SetHalDefVar8723B(Adapter, eVariable, pValue);
 }
@@ -1259,8 +1258,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->SetHalDefVarHandler = &SetHalDefVar8723BSDIO;
-
 	pHalFunc->hal_xmit = &rtl8723bs_hal_xmit;
 	pHalFunc->mgnt_xmit = &rtl8723bs_mgnt_xmit;
 	pHalFunc->hal_xmitframe_enqueue = &rtl8723bs_hal_xmitframe_enqueue;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 19aae9b0d400..b69d201b6826 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -170,8 +170,6 @@ struct hal_ops {
 	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
-	u8 (*SetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
-
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
 	void (*UpdateRAMaskHandler)(struct adapter *padapter, u32 mac_id, u8 rssi_level);
@@ -316,4 +314,5 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
+u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

