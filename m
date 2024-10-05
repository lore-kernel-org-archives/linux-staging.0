Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AA1175D45
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160499; cv=none; b=aer7pcwijJcVh/vHEpAoT3O4v5VYTzkLFi8AGi8WaN+hxQSq3zAIsAFRbxC220BhFrtxpkJIpqvDDb+deLDONfev7sfboD61bt2sroIWQoJ4K+2GgrTTrY3R6KOvsG5wQQqq8dLPCSEWkB3EJ2R7+zdNYCaTUmkRyk2UZlefiwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160499; c=relaxed/simple;
	bh=DzFsjrR8uTSsexoZFECYdKO5oEoK7H7WulDYsnWyGUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0V0zS0R6HqSEgMfZeuPRiYcKSO2yLY9dQhWVzQ7BdsOGrkQjAcd6aOffOaO9RcJTpYEE4WCovABF731zfhegMqJ55UYHLhxqOZtRnPPSmCvMWuqswHF6AZ1oDvsskRabx3WQgwS5SsI9sBCU9IZCDepnrYJUyRm1R0CkwwiLdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1q6dnRe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1q6dnRe"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so19146105e9.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160494; x=1728765294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0q9mc5Vxi135rYPqQgMHuHAkwJUcyR7fvEbuN9Uzyy8=;
        b=d1q6dnReVpEI5KN5eC0iDvjpaxzm+uZ2kwPM4/WwWDTIi5ZTGjBNfi8NE9tCvwDmph
         gqjxJS348UaaBIMdSvetIZc447yRivW8XOULST7cU8eTITlxsECa+ezjMHQMVfSecOfm
         3UQkie8vB7DLvaP/pCcQkSMWk5T95OcFcOgj98PoluWmbVhMyyP2f2msaMP4lQiOh9Qz
         naK0CG1Nk8qCnSJeoEmzQIkWDLxXSTK0tWjkKoqu8v/rNt5mDaElKbXrEV46QBbhm7Ty
         5e3b0XeunrBiryX8p9cgKWlCsZ7JNrf7r5/aOuAzQrvSrUhlLQQU8NkuDAhbmXDue2YP
         1RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160494; x=1728765294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0q9mc5Vxi135rYPqQgMHuHAkwJUcyR7fvEbuN9Uzyy8=;
        b=s3FXJIlwfFoUO8OeFSHG1cZscDbQhEr/r5Zrf+eaJMg7BtiqY/Fob0q1F/cndIEplx
         N5KnOC8zhznfJVLZPvdb5CDAAzOJT4sdT1ICh/s2y4MWqKVMYH7dK0VAiRKbQcnvs6q8
         Ogq9tuIXAmMs1ppdQzuTf4o39rPjRstJ1oKm0rDRZ1iKOzUmkgO8Ywqhfz8c6+JTBQbE
         1MNHQ+vIodfuY0TyCedufKJVTVUR12KzrLTuw0HJGT3CnGTAvSymFz+gBpUaODTnp0hv
         0s1tkPoKkKBOBlrJMHYQ8Pk+W0oXLnxwsVzUmzk/oNN5aRbgYuwAcbFuJ/F/8wmKtbzc
         Xkmg==
X-Forwarded-Encrypted: i=1; AJvYcCXOynIdrQojt2bKq88lsbNWHJWBDihjzkSKf2hpxlSFf7ajb8+pCN93bKjilO/dFyprPLgRnfxaIL/VPmCO@lists.linux.dev
X-Gm-Message-State: AOJu0YwmfIS7pOgPkqlTsCLS57AmRbaajuIyBukGyosDCTYTEfmAcbK/
	QIbI3izd+7Vs/ROkRoIKLMXLgUnWnNxyE8tKYdZt6wghIGX3GzjQ
X-Google-Smtp-Source: AGHT+IFb4ZE3CnE17gYQ6TuhVGEqEVW9uNilRK7jmt409cBGqXE8EHg7yYucFhBpiBjNuLlIk9TuDQ==
X-Received: by 2002:a05:600c:1d1c:b0:42c:b697:a62c with SMTP id 5b1f17b1804b1-42f7df1cffbmr71784345e9.5.1728160494059;
        Sat, 05 Oct 2024 13:34:54 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:53 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 11/15] staging: rtl8723bs: Remove function pointer init_default_value
Date: Sat,  5 Oct 2024 22:33:54 +0200
Message-ID: <d0bb58235d54d1c7e4806c5ea3a50dbf77c293e7.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer init_default_value and use
rtl8723bs_init_default_value directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 3 +--
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h | 1 +
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 8c80e0735840..bcbc9ea78951 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -26,8 +26,7 @@ void rtw_hal_read_chip_version(struct adapter *padapter)
 
 void rtw_hal_def_value_init(struct adapter *padapter)
 {
-	if (padapter->HalFunc.init_default_value)
-		padapter->HalFunc.init_default_value(padapter);
+	rtl8723bs_init_default_value(padapter);
 }
 
 void rtw_hal_free_data(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 52cd980c2003..236effa5c96e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -937,7 +937,7 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static void rtl8723bs_init_default_value(struct adapter *padapter)
+void rtl8723bs_init_default_value(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData;
 
@@ -1259,7 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->init_default_value = &rtl8723bs_init_default_value;
 	pHalFunc->intf_chip_configure = &rtl8723bs_interface_configure;
 	pHalFunc->read_adapter_info = &ReadAdapterInfo8723BS;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 9b0e9c0bf020..357b41894cf1 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*init_default_value)(struct adapter *padapter);
-
 	void (*intf_chip_configure)(struct adapter *padapter);
 
 	void (*read_adapter_info)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index 040c9af06eee..69b5a7df32ad 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -88,5 +88,6 @@ void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pp
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 
 void rtl8723b_read_chip_version(struct adapter *padapter);
+void rtl8723bs_init_default_value(struct adapter *padapter);
 
 #endif
-- 
2.43.0

