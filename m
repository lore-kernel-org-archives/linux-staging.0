Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159CA4A3412
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119873; cv=none; b=qSPPBlwceg1oSKgyHX+oLiciudAQXTjHRsI8gGUVcHFb1whcEyw3JHpiynCcce6ByTgvqlCq1irWUTxag1/npPdsA24DFEQ8lS3Eyv6ZDd1BlhXgL+ZwANOVoA7bx7Hp50B9oHkp9LBZGFWEkEIDOMflXsgyL0Np0HQS53C2LNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119873; c=relaxed/simple;
	bh=meFM+m3+QXLv46H2Nga/34GDbnkXJvTqjgu2sz1WhSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH0Va1SYRonh9QLCawQlztlA2AvCInGQrjlEwvc/PYpDN2+xeIDDqQ6f7YUJ5RP2q7+AkZD97Fms3GQ5+68R92NA1mPebRT+XW+UDD6Mu+mNiS3vNuo0zGvq46LLsSAwlZQki+6o+thJdwzRgQDShIVukRHKyL+VAoLA0BVecXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6FphhHh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6FphhHh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so1775931e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119859; x=1784724659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9jk3XKktcIbFuEFIN65sHF6Ly+ytHzoWCdAncm6Hg7g=;
        b=c6FphhHhqvPgBaFtbOg/dz4vEjUEsxbChIC0eJoYwxZ7QbFcD/5/dLvx/5zs4jv4nv
         0hXMkrPcWN2sItmilqb1lxTis8zpvXhTSYDdl6d5Nig9wo6Ns6OVaZsenK8jJ0V8/hO/
         tgm0azVEp8Y43mKiSIkPsh4lQ1Wi1oCy5kRUIzwl2UX8F/7CXkBEctTjWM4UMq8FsVhl
         dW6c4AXGdmAqi09t89UnfOevHCjy0yj8xJZcYW4mUQsEIl0W55OAdYKi8/DkIdIr9/ay
         NUUwznqaxf1hezpZhIG49svc/PtI3in+6zFdxXxhNZObe+PWBHGBuyAWju8zq41so+BP
         ouRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119859; x=1784724659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9jk3XKktcIbFuEFIN65sHF6Ly+ytHzoWCdAncm6Hg7g=;
        b=bJBgcAyWyRLWSKQKWSpjF4x15a1XdZ2CkPCD5c+y4y3zubSktQiL0baFa8hIhajJf7
         3CE6nS1ucnBBVJgD/wyNahbqpFcknoeNJtZXNhofKxdLqOXc8svnH1m6kpJt+A0oMdyn
         G1BnN0SQSZRhXv9LDLviTiPe9hCN2HODkwtiNmBEfSmrMnZ1o5NWWiXA5YQO+R4F1S8E
         fjG+tvz8Gdro19nz3m3ZH7I29grH8km6qo8r9MwEzGqMKiq6adUiLp3H++A0TvtLDHY6
         D+XUUy5vqCFEZQzBcnzn65oaSbKfiYfwAe+YzSwIAOG4iyQ1Fvs7cVJ5y32Vz68e21H5
         M0ZQ==
X-Gm-Message-State: AOJu0Yw9rN69e5N+lNlPK+ZAewYKDJAZvKHNF+FTg/g9pYdgW9Xr4DF2
	1TfLcKzs0v7IlgOQj7YJUWYj0W51knuj4kyRyyJdO+4ZaOkSsCUvVAPr
X-Gm-Gg: AfdE7ckioUbhLsMvObQfZZb7dpLSQ8/ybjZBJHwMX2OHniGXW+UxZ+Qf9CAmP3Ehvv6
	jAEIxviT7avxUfzOWei+RbvegFhe17Kyy1CEg42yJjNB7nB6vxf4Dtcg/Ypfze1NCmscEKoKzii
	HFYq43zCm9DbtINhv/pYKGOjtJPuVfaOdnS09kLU38e0YPl2Ayz8CZfYqze4Ez9X9dcJyPpBW/0
	lEcEsN+IMlumHqSaOYkwwMzN7soX7t+YlZKupTB1ih4yxBZL0G4ImJSij1cXoSicz6TK6w14ceJ
	OalTowWZG4YUIDOsj2y1Njw4+JfZ0u0uSEsVghHM1aQ+l7cbcAlS7WzB9Cj8iKi4FSeWUECaKeP
	/BzaF9WLMZLxnXlDrNXnfL7Bqk7fc0CUCVWnuTgGMDf3iZjWBTtkvC3AsdRcalQ1GdQt/qDnbnc
	QHOR/MWzSogNTFXMwyum+234DF5rE3yNCGnR5aK7FW3f+yWSqPiQGewGlrCcFJ+FkFlOPvJ4IQw
	P3X0Si059sHTw==
X-Received: by 2002:a05:6512:61ac:b0:5a8:88f8:9ed4 with SMTP id 2adb3069b0e04-5b02369dae3mr4198488e87.30.1784119859340;
        Wed, 15 Jul 2026 05:50:59 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:58 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 52/61] staging: rtl8723bs: inline SetHwRegWithBuf8723B into helper
Date: Wed, 15 Jul 2026 19:48:20 +0700
Message-ID: <20260715124829.90290-53-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline the hardware register configuration logic from
SetHwRegWithBuf8723B directly into rtw_hal_set_hwreg_with_buf.
This removes a redundant CamelCase layer for C2H packet handling.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     |  8 +++++++-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 11 -----------
 drivers/staging/rtl8723bs/include/hal_intf.h |  1 -
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 92e4605fa..e58fc1405 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -128,7 +128,13 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val)
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
 {
-	SetHwRegWithBuf8723B(padapter, variable, pbuf, len);
+	switch (variable) {
+	case HW_VAR_C2H_HANDLE:
+		C2HPacketHandler_8723B(padapter, pbuf, len);
+		break;
+	default:
+		break;
+		}
 }
 
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 22d6180f1..0155c523e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1079,17 +1079,6 @@ void rtw_read_adapter_info(struct adapter *padapter)
 }
 
 
-void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len)
-{
-	switch (variable) {
-	case HW_VAR_C2H_HANDLE:
-		C2HPacketHandler_8723B(padapter, pbuf, len);
-		break;
-	default:
-		break;
-	}
-}
-
 /*  */
 /*	Description: */
 /*		Query setting of specified variable. */
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b6ceea02a..1d5c0b7bb 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -241,7 +241,6 @@ s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
 s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
-void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 u8 GetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue);
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level);
 void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter);
-- 
2.55.0

