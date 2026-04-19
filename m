Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9584E1E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583306; cv=none; b=SEYVq0zM/Wjhz2PjzeeQjODvWeTQDTGgYOURS32HATP3cd0z1OYmVg9IuGQDMWHBgPu2gh+87HrrG64ne3dnw4jydAdqXz3cahI5G5FJ34ekJB70uDoecdoWTxUP9UgmuBubG0CCiQYsJ9HhJc2h2uDoIjXXcSJIK/bwcs32FYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583306; c=relaxed/simple;
	bh=fdDeioBcJ05fwg6svQc/y9mLd3/yP7jy0CTszJVkeDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6j5bgzm2ApP6CqEfnD0D0EUDAsLRr3pSlNhAyZHHJvVWr84tfZt4NsuPOfXY+dMtG5+MeLmmQehi8YJXdvr92wzGIKnRZ9UIyhPe4OgTnd4DQWVC5hhbbWgg8GurbPzl1Z9Kzk324Dgf2JKtZ1cy7/qXdArx0wtF55pOC6sOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpQcLEzQ; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpQcLEzQ"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-651cfaa21e6so1903740d50.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583305; x=1777188105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TnTyLvv+o0ISH2QqCLXilPVmIEONKhF+QSvscNtQhQ=;
        b=lpQcLEzQmkCcnwESZ0If6UPZCrRPCnDDX+GXcWO6H+TtNHLgrWkwmFO0mecMK/6enf
         UU8GbhnALdXObMOKmpUeSn3tpWfmZ6A2E1XZN9HDdHniFNslQYjXaDTmd3W7Rjbz3orU
         kyjsATvV3kuHXhSFpiH9/aW+IKeu490iEyhJdYse3XiP73TGuma+pzYxgPwLzK1UrdWs
         B5J7CRrn2UuQ0hucy/KseJlQ8BsTjGXEOhfqXtBmnMT9hFk0etlKUK4PsbYGOgB0gP5J
         a3dc4xLCeZhPHxSNJ2aHbjkC/SYQASauWQlV1LoXioJNKwWxRWHoOGM3vQx4+59jSJMU
         Muiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583305; x=1777188105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0TnTyLvv+o0ISH2QqCLXilPVmIEONKhF+QSvscNtQhQ=;
        b=DUn4KOjzZDXXBJlRHwAEJ+2eg7533eC7j0ArRYL13ysBiFk5tjRhfdqwnV9tSUWtlt
         7S/VthPoNPdkg49rNeNghe8NUl7cX5pSZYkRCjgIDZtnDfuT6EuasfOEVpIwFWj0f87R
         ES2s2aVm4qkyJ6+y1s9vBX1e4o6Fsc4a4pnkZmiLaRUfF+dE6m28Sem33/n26R0ljAu8
         kXUiBOmFmQRtcJ6AQPngjf87pLonKw2pSR5X30yU49TMjciiKClf4QirQhWOnu6PCTm8
         Ua/noVm9DVEtrY14n21Axeq8U3XoBzox3S16v5w8XRdaIfcxVlzRIPqsQH2bF6o/ummM
         j1fg==
X-Gm-Message-State: AOJu0Yw+a1khODtY9WowT0VjbfDtnxQfdU/FUMhvtXVWwV9C986uQSCu
	Zk5NSAMFBScNR2OPqF8q7OqkKvX42rsedhtaNafSWwRM7iE+rr0T8S3j
X-Gm-Gg: AeBDievuCsHqZnjTge2s7yDvi3JAfK7WjuADv2yVJ6QJbn8udfNULKbwVl2tCdA2FTE
	pzxtorm0gjKfkvhCXFOxwoOgIrrayZswrs1SZRTE0WjOkmfPX8GF3sUjsZ6unIVVd9JS5si8ijX
	wkGOy9Lr7RxhIlbPaXuFcXyotYyBCaWf1Nuie6jXuRBSOGRNadl0dycHKg2f+j/GFjl24VRqaq2
	stWCNN87UW206xc9xbU/OWzJ8hvv3qGdMBCN1pur8PsQzv5cL22sr1Eg7LI1usPInPV4XC6dOjJ
	upGH3oFxvCFqNElPwedN21GIj36bKHQIwnNVvplYdveMQ09HrI9GedidZoetn2KgnnUmDTwlr7D
	WCYMoitpxTQZ/o7bqtX70fDYQKaMfKcSEdA84RJYfViQ6HMIyXx6iREF7wZYmZEaF3nG0Z2R7PT
	Ybv3haMI58mV0o0mfXfylHHHgLqPx0jzqFsfVArL7WG4UcPA==
X-Received: by 2002:a05:690e:144c:b0:651:cdd9:b395 with SMTP id 956f58d0204a3-65311884b24mr6784575d50.2.1776583304609;
        Sun, 19 Apr 2026 00:21:44 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:21:44 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 03/11] staging: rtl8723bs: remove wrapper rtw_hal_read_chip_version()
Date: Sun, 19 Apr 2026 10:19:29 +0300
Message-ID: <20260419072034.19824-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_hal_read_chip_version() function, as it's just a wrapper
that calls rtl8723b_read_chip_version() directly. Replace all its calls
to the rtl8723b_read_chip_version(). This will remove an extra level of
abstraction and simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index da250179fc92..c3a238cb0b1e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,11 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_read_chip_version(struct adapter *padapter)
-{
-	rtl8723b_read_chip_version(padapter);
-}
-
 void rtw_hal_def_value_init(struct adapter *padapter)
 {
 	rtl8723bs_init_default_value(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 8f5f2c63fc10..0d2f60ce29af 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -195,8 +195,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 
-void rtw_hal_read_chip_version(struct adapter *padapter);
-
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
 void rtw_hal_set_odm_var(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 98eff17be9b6..e487e238d737 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -264,7 +264,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	if (rtw_init_io_priv(padapter, sdio_set_intf_ops) == _FAIL)
 		goto free_hal_data;
 
-	rtw_hal_read_chip_version(padapter);
+	rtl8723b_read_chip_version(padapter);
 
 	rtl8723bs_interface_configure(padapter);
 
-- 
2.53.0

