Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4316EB5D
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621700; cv=none; b=lw92M9P5BY9Yhscw09cNeON2/i1vid2v8HnY5Kv8SG+iD2qpHGzH2TfUtywD7TPH2bg/tO6DncoYiqNQbuV1IrNLa3qNbB+M8tvyyh29ztENS4951P9Lrtjl7Vx/thbOCblBfKM7wTn+F1O+zIubgrl6YhCodMVYNXVfmoA6eB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621700; c=relaxed/simple;
	bh=JwNgZndBBybwNcb1/UDOUG8ljerV5WFPQzgfwNxTMOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYrjaYDfHNt4sOpnyYO+Q6EwUba75IO34271hSMVJznT3Wlum6kFsjIbV+v9opi65QvBZwJTpMQPhBT7bxefc5WkEHkxUXvBswTVRucXmRG9xYh18RRhoJ2BewFNFZeHh5e1+YOhskdB+pNAb46h+hb5nKpR1bcUys3ZFpvuI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak5fu08s; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak5fu08s"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso4101911a12.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621696; x=1731226496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kki66qAN31IwWCYVmn/Vdq65sFoOxq/7bNbZORHqbvk=;
        b=Ak5fu08sQf9tXKmCwwszZlas2bqEErTaNNd2JtEceG8HXpR69cAGTHg1Z47PrMTL3e
         Dmx089dYfhVts7LqaP/Qicu3wLUepgpd71rQKHyeZLjPH4kDIFn75Dp860ZdfeFvrjKP
         0u1zNSceka/DLi1essvQb91hjv4ucN0lue5Tcb+y5RZT43gzmlch5fyQMgG31SPCtKwW
         809bF3G2L0dtA4IOT8DOwIm2zlFLb8mHTlr9ZRpr0R3v8Gq5bOilaKYJAty/C3Xi707f
         srIaoaw4UWII21KNMqzpA1LDTnWVqUF0RIuCeXTmb3IA8Q5aA54iiTRSgEBNpeB8fOMl
         Pc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621696; x=1731226496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kki66qAN31IwWCYVmn/Vdq65sFoOxq/7bNbZORHqbvk=;
        b=hkcBmejaNqSFY8T5+xBz0RT5fyMA22AmLvf15RJfUcgCo046xJvbDPimMREBnyTIyl
         0JM/M8pvEBSPWyhfg2zpGTt71/lrM9OAmdbmb6JU6l28xMpVlm1WCQE3qB5hZI8Jo9a5
         62hhjrsonu69SOHoshCb4hDndKq9gQYmUAVqMsh/I3e389KLzh0bKqCXz3qiDkEU48Ix
         G02N33fjpw567ZKuJYxOiuk536khij6QpHPW8wCYt8WNuLo/kaI8NoLVOIqV/BiX/473
         QHRs9LmNT5DKgkjPjFSMZIz4mUSgfIlYLVGGEudrIa9iDWYQNDb5R0zUsWmo25PRLZgI
         Pb8g==
X-Forwarded-Encrypted: i=1; AJvYcCVJmkLHGz4l/vQvUK5HcOuZp05u0KAM1yxpCJDz78UEI3GY4gn8ZrfRIopRrvSfstfRduVs5C7mXQtt0XNi@lists.linux.dev
X-Gm-Message-State: AOJu0YwEZkntE4Qkfdj/KhU2NzUE3uS14akzUjPuP0QCmUT+yDgFa3UE
	7pDIMGQAkjRQIEWVOndDAZc4otYiwVYdsHdLigdpFyeEcrxZZLJ3
X-Google-Smtp-Source: AGHT+IEutGTvnHY4bCjiFrE4H1xZ8yIGb4jNQJJNNuTsKy4xB1VWWw5eqMeYKupDc6meov/4Mz4/TQ==
X-Received: by 2002:a05:6402:3202:b0:5c4:14fe:971e with SMTP id 4fb4d7f45d1cf-5cbbf920567mr20974555a12.23.1730621695976;
        Sun, 03 Nov 2024 01:14:55 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:55 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 07/13] staging: rtl8723bs: Remove function pointer GetHwRegHandler
Date: Sun,  3 Nov 2024 09:14:28 +0100
Message-ID: <ace0c1f47d27d536083787a1334bf6cfafb18c03.1730619982.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer GetHwRegHandler and use GetHwReg8723BS directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 756d6ed9232d..d7b29d08ff15 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -113,8 +113,7 @@ void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 {
-	if (padapter->HalFunc.GetHwRegHandler)
-		padapter->HalFunc.GetHwRegHandler(padapter, variable, val);
+	GetHwReg8723BS(padapter, variable, val);
 }
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 6333a0d23d43..d3f86d811879 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1185,7 +1185,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
  * If variable not handled here,
  * some variables will be processed in GetHwReg8723B()
  */
-static void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
+void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val)
 {
 	switch (variable) {
 	case HW_VAR_CPWM:
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->GetHwRegHandler = &GetHwReg8723BS;
 	pHalFunc->SetHwRegHandlerWithBuf = &SetHwRegWithBuf8723B;
 	pHalFunc->GetHalDefVarHandler = &GetHalDefVar8723BSDIO;
 	pHalFunc->SetHalDefVarHandler = &SetHalDefVar8723BSDIO;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 439639f6616c..b53804fb186d 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -170,8 +170,6 @@ struct hal_ops {
 	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
-	void (*GetHwRegHandler)(struct adapter *padapter, u8 variable, u8 *val);
-
 	void (*SetHwRegHandlerWithBuf)(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 
 	u8 (*GetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
@@ -318,5 +316,6 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
+void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 
 #endif /* __HAL_INTF_H__ */
-- 
2.43.0

