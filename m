Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864E2BDC0F
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435498; cv=none; b=QOl0wPzkTUkH45aufiaB1CdYdObMLJi1e4EVqYlTnwMoQiXYbCl3neIe0nRpCU/BsnpXOthlFlh6C8DBks5A5uY2imI23BfQWZVtLNRZMwoiL/ZUfx8g1ASTDxGIqq3SOA7BWHp0eZk6b53igK/c+1RrmzH2Zpl16OAVZ0prEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435498; c=relaxed/simple;
	bh=+J/iadcVOUaTUw72mB/Nb6z7404xxx816NX/xA7A484=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMsD269PuFxKZT/LLzlL4qymNw2z86x4jFj1KT8kN3VyclT6r+on4T8BkcZgERgoVwfyizM1TeZcw8k3XaBMP9iqu5vLE2OCu87r0LJxdYgcC/GSsZ1GhoJkaIzlw1HJGqu4TsuG/1pn+j3lznFefXO+QsHN9R+9PdXSSVsBvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REm/VNRA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REm/VNRA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso2779287b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435497; x=1779040297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xic5ztyW5i+ynvD8IHASepz2WZOZxOk3H7Nc8OwjdBY=;
        b=REm/VNRASI0Wrij580JdoxQkmvdy8BQgyFbEJZKDon7Z4lZL12pQodA5V4XZZfpquM
         8RMNZvO1yeVz9riHY0PgzsZ8XVGid2mLlA1ohFX3ucrGpi3+6luNtubi90zKcRn9WD2x
         uSfi3vD8mEoF5J1AWSi6gvS6dk6v+OQMgekf+MNxZ0sTDgzPfTuhNsBtUInwwOZevEqi
         /6upzTTMxrMfk/w7RNHoV/Pvt1uyAE2bf/ZeeBLqnz9CakSviDKDJx6CMRRz+F+nlPKA
         5ZLxn6p3jPrUR5WWLZAxKIUJTxG6K90pautrlVO7D1UCtkS4MqTDJ0m3QCTJ97BpJy3V
         X++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435497; x=1779040297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xic5ztyW5i+ynvD8IHASepz2WZOZxOk3H7Nc8OwjdBY=;
        b=DortGVxhOw3HfIvoQUI3J8cJX800E+38L5Q/GDpV/K8ZDfza/WkMwOaJ3iqoqQri7H
         t1uqBimYUQPaLpMbIH5Ufhy/6fhDfBEgjQDaEOhdI63OciHKnEglPOV50nxBmGPaf4qJ
         TcsF5j6Re0XP237YstadUb1So5FJUgSqFB8QXQqCqss4uZ/4m5KiFqWomHRd4C5Cg54I
         EpfmURpUSYp9da0HqZKI3UAYsLqGdPyamG/Fk8dcKUprE2+6wLObtylJd7XPTi0gsg4A
         7i9CCRRbWZ11ofTu0D5xcdXPqggiRVyZFfcnfZJ1SW4FYdHiUIPlooo0mbDd+hjGeBGm
         pddg==
X-Gm-Message-State: AOJu0YzHghlMP+5Y1Xzygoi5rbz7oaCZfRv80VhVwxT/LrpayYbfEp46
	pXd15Uqe0N8xDLcy5b6PFHwLi+1/atnzy4hLoveBv3+DtX5DNAMS+1kn
X-Gm-Gg: Acq92OG8FNcSyL3ejEUZUNhjaWLqUk+pcE+4M+O05XlaJlsP2Ogsmt6ZQBLhxHQjdTc
	AkIPZEZ7NrEf+2d8E1bDoc/URapiL7W7yFnAczsSKMXehQPDSmqMdzZ5Pgjk9AtV1ONZ6QoYoia
	jfHrrFjvyUsHOplJI50kc1fxLoc2fxe4BwYh8WRzyqa6fE2x1qnZ13YE2mvv7WBYDNaR8NCag1W
	ypywsOXrqshJH9eeVyJDRWM5C0o5xyEZVOB2hX8ZxI9A6rB9Hj8aCGzSiJpxAp9zOlDmFu1yJJH
	iVlzOWgpTkSy3pw8PKUrDWLIEEgfVyuygfhypsba4fG5nGS43zMjGPjuvXF4+8S5j5Lb83tKdT5
	E3jqcM90+aW+aJZ1QXQnM6TJrkPNWqdFaCdrJY9LpGVoXX0Uffgr8DCrkIUjz7DGXWh6WkVIgY+
	pk8ifjwmK9H7YyKIID6pR515yDP19OYdoubGeoXlFFgQw/zq3PWD0=
X-Received: by 2002:a05:6a00:1989:b0:837:db4e:a35d with SMTP id d2e1a72fcca58-83e3afd78dbmr6119227b3a.23.1778435496679;
        Sun, 10 May 2026 10:51:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm17964762b3a.59.2026.05.10.10.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:51:36 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: Remove multiple blank lines in include headers
Date: Sun, 10 May 2026 13:51:02 -0400
Message-ID: <20260510175103.562518-2-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175103.562518-1-pramod.nexgen@gmail.com>
References: <20260510175103.562518-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove superfluous consecutive blank lines from rtl8723bs include
header files as flagged by checkpatch.pl.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/cmd_osdep.h      | 1 -
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h  | 1 -
 drivers/staging/rtl8723bs/include/rtl8723b_dm.h    | 1 -
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h  | 1 -
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h  | 1 -
 drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 1 -
 6 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 5506f513dc01..41daa3c339a8 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -7,7 +7,6 @@
 #ifndef __CMD_OSDEP_H_
 #define __CMD_OSDEP_H_
 
-
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
 extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index e2e9aa03ffdf..1f86654f0403 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,6 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
 void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
 void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
 
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
index 1d2da5286e7c..50ab7aed079e 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_dm.h
@@ -29,5 +29,4 @@ void rtl8723b_HalDmWatchDog(struct adapter *padapter);
 void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *padapter);
 void rtl8723b_hal_dm_in_lps(struct adapter *padapter);
 
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index ab349de733c8..c3a1d1a84f78 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-
 typedef u8 NDIS_802_11_PMKID_VALUE[16];
 
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
index e611651cb40b..e4d8fe9bf68d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
@@ -13,5 +13,4 @@ void rtw_regd_init(struct wiphy *wiphy,
 					struct regulatory_request *request));
 void rtw_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request);
 
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
index 18830dd18372..cd67a7201065 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
@@ -25,6 +25,5 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err);
 s32 _sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
 s32 sd_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, void *pdata);
 
-
 void rtw_sdio_set_irq_thd(struct dvobj_priv *dvobj, void *thd_hdl);
 #endif
-- 
2.52.0

