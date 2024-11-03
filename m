Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA2E17107F
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621701; cv=none; b=GPXN6/UrSpq6YIvsea5CsWmTABxB1E1ZeVg/RMqASQzCz6TEEbJzr8lLW2EXSSXGGJPdZBxlQO5ptCpbMdwXuwwT0MDY4VnyhwsWTT6kEBIF8kzEndT/KQEm4tpfOXOdh96Pe1tY6ZLWuXVpSzn8/0S3whmrvowGZNEHMereCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621701; c=relaxed/simple;
	bh=iQqcpC8l3446T4k+RFti+09L/H09762bBP37GsGZh6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0YT5SuzujpWDSrd55xeZRl8MYTvVKEZZl7iVhtfMx4v2S8hUNpNiy/A4er9ZOBlIIYBP83wBtWenQh72Hcm4GM6ta/RLNbagbwfsTo6CT2LzAJDJM7BHzQO84pnFdRClIxCtgtmuzfPsTM4yF2MZQCZ6lchcfum1zh0skgb5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXtt9yGG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXtt9yGG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so4719113a12.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621698; x=1731226498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMZjBc+r0kNLu2PVzUZXnU+/3Ibb4mXMOKZIEO1uavY=;
        b=QXtt9yGGhS7RdqUQ0m9dyA9tRV3mIoDqC42xyVwddbahU/NCHKMSbpKbOohqu/l2fj
         jePrquyKAF7KKAXHpbIPG7bN9RMF3KmT1bRgGUFr9Lgpo+p5g8Ioap5U6HjyFffUbDk2
         C65g/pkw1tVLEjgSYrqRsk5DRhKc+wLJq0EHF9MTCphy6vAWSUBt9i4OoXb86IsGaetv
         zzaR2eALizXIBV/DZpOMgLn9RCt6rGFNydb7L+FFKuHIsloCmBeC+UaYcaHI0odKIFxQ
         jBzpEbruOCuhGdOseU2W4wZVR3JMRIyxfoX7dFXOsqbklEZj884zl6HXVuqw/6fDnZe/
         r75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621698; x=1731226498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMZjBc+r0kNLu2PVzUZXnU+/3Ibb4mXMOKZIEO1uavY=;
        b=VsQ+BM80s68gD5sxCZOrWRUpaZnk+PK5EAHQrIUSLgrLiRzHEuKa0bZhEe7UDIbukg
         qoCymaFtMA8SlHvlIOwRVIKDUcxtM96cheGp/ezFtVacWDG+DyWGRvier17gKwEcryhY
         tVVKHlNaj91v2eugLGpeDfMCYEw7yObZQgzrESE5maSBhjq2wC9xPHG4sgt76Geb0X4E
         g10A7Ly/CANU4bujHs0dAiWjqdv4RLo71mTNNoSTZT+LvLgF2bx4+TOg6yab3eGSFEBD
         Ir+iMnWeIT66IZ0eQGqsslVzBxDnipk7Dsi56QiqokERHetJGxWOPWGCzIKENh2XPbjI
         AArQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN2d2o+lqXi2gQtIHTRhT1kwV4HN58IrrGXOrDxW1Jal5kgCkLiLMvohJodtPimCMuzcAD0b1IqaWI6166@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+FF5AQCCfcMSjhbUovbjCr4ZEumjV8JeJBmhPoUcaVwgfrfa
	UrWrzsSAtORPnnmUsJ/EtZIsl39qe1wk1N3oCiZCgGHV2hKu5AOf
X-Google-Smtp-Source: AGHT+IGBy5duJ5lWb9Veb++sGyBb25th7PMvpJRjzpYSIRWDR/8RFcPdBnPT+/FIEiMz7zIosTuNDw==
X-Received: by 2002:a05:6402:518a:b0:5c9:76ca:705b with SMTP id 4fb4d7f45d1cf-5cd54afde73mr12042972a12.34.1730621697209;
        Sun, 03 Nov 2024 01:14:57 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:56 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 09/13] staging: rtl8723bs: Remove function pointer GetHalDefVarHandler
Date: Sun,  3 Nov 2024 09:14:30 +0100
Message-ID: <fc3d7390305b474e7149c087ad6e065d883e8447.1730619982.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer GetHalDefVarHandler and use GetHalDefVar8723BSDIO
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 4 +---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index ec567ae99f10..e8b31b80917e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -130,9 +130,7 @@ u8 rtw_hal_set_def_var(struct adapter *padapter, enum hal_def_variable eVariable
 
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
 {
-	if (padapter->HalFunc.GetHalDefVarHandler)
-		return padapter->HalFunc.GetHalDefVarHandler(padapter, eVariable, pValue);
-	return _FAIL;
+	return GetHalDefVar8723BSDIO(padapter, eVariable, pValue);
 }
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index beb74a40e91e..b1b40f6077fe 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1219,7 +1219,7 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 /* 	Description: */
 /* 		Query setting of specified variable. */
 /*  */
-static u8 GetHalDefVar8723BSDIO(
+u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
 {
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->GetHalDefVarHandler = &GetHalDefVar8723BSDIO;
 	pHalFunc->SetHalDefVarHandler = &SetHalDefVar8723BSDIO;
 
 	pHalFunc->hal_xmit = &rtl8723bs_hal_xmit;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index d6e8eb95d391..19aae9b0d400 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -170,7 +170,6 @@ struct hal_ops {
 	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
-	u8 (*GetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 	u8 (*SetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
@@ -316,4 +315,5 @@ s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuf
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
+u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

