Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC237880B
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583349; cv=none; b=dI1g3giBNdNgn8icqTjpVL7Ur2GIOg6nu4s5PvrzMR/2gRQxkch6zM0L4uZj6hA3Gb8yLI7QAQsFEbUmaSFKobJIMcJknLDPXKvVwwCigNmP6PnK42AFzyId4JMK4hZTo7rWyDRsx+sw+o7K4tOH+7pCm7rizjMoL1GScvHRqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583349; c=relaxed/simple;
	bh=HIZff1+HgyERgCjm0MvDLJ3LH3Les2rDR4O8zroEoHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOcImpI1QkOgmD0gzWn2aE4gcCWdKCpIOnYttfuZv1QT/NHP4X/CsM3PZWVnFuxN3nJnu950SwprG7A6mg9WI7uVgEZ9ashSLNjPavrlVl5l9D7eFFJQm6MdRURuMBKUwPL4vyGydcIiQS6p6RJZlYIsA3qvdVBt/KZYC/Gk/Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVK5cJM1; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVK5cJM1"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-651b0eb2564so2069885d50.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583346; x=1777188146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QslzmPlwLJvlbe2fi5RGCG8J1u1L16juSVUVLMYhHuE=;
        b=dVK5cJM13gtyUv/kpvAGLBEpM7T/ryW3i/1t2zuzLdHZE2QIDY/gec9TTMkdbVQLjT
         x7lrbsI1IKR5kKegm1O86DZ2x3uXRy94MnFKnQnie1tujSkAuCsidkNlaTu0GOjcZyEk
         YcPNClUm7xcqfHHA5ryz+eYPYsdzXoprXdV8qnqnvccWWTOZJ1k+BcE9ZzDV9M2tDXEP
         AYzTaAuQIwLcv+g7o9HO17/1EV/Au1OQJDqVAFW2GoAxCsWRTf4VkjZx62pKehCtxPfj
         A3EEl02WLlURD1gRTA43m7oxwC6tYSP3O13SKU1FNxTOP5ioLoosfXHnEs0D5Tsm9AkE
         nlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583346; x=1777188146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QslzmPlwLJvlbe2fi5RGCG8J1u1L16juSVUVLMYhHuE=;
        b=CQPQ6migKqj3GOtB9n5NfMnhQsdsaHZcRJ+5Dk5ZJEGMu+YU4NGX4g9VuBftAj4GHd
         GwlBwRCam0jsl0bwkQzb6pqvqkArmTmhyzqBjIfjUaC7DDLVM0XA5IObcX/3zeBuuVx7
         L8xJRGNibdlTqmxg/SLQhFp7QCLAR3qXCHFImTKMl39wyTJICxaYIeP8Gnwxy9KPb/9K
         7MSyGUsb8a0cM+B3ZwIooBBg/n4d92EcdQNw+W/opO4eqKhbWIQ1YERZtajGcCW1NGLI
         rduLPjF0JELWPAJHYOFEJ+lCCROCY6auC6zGcjPmLn9FrO7H+0zDX93aC2iiSmMHVEnS
         CQVg==
X-Gm-Message-State: AOJu0YxJbPgVc6NHwYhCdr8Hm2Top/l0Nr6mHyJpkcLeEfOzqTHNajBt
	UvfZPUMp9APoUAnMQL6VuzAmW8/8YrkIP9jEixW5w2LyTV0JR4Rjfcq3JWnB9A==
X-Gm-Gg: AeBDieuEHK76Y18/qCUk7U4Xkg9sAnKScSNNZiI8X6OpvL9zWhV1DTbIXuVRGQk0PGf
	bNH3h5VV8SKzMqf4kkQHs1/QEifI7XB3jhBzGWVy/qDGYDEZ/8ElX5CEk5AIXCEyZigCn+Qimax
	5+2+6Ku5bHY0lV72C2d/Hg6ZjYZ3NLrU7rQafw6blxossUTgRYhBpkT60FGkgtBESLz4gn1qTeS
	fJNPECOPaKYhaFcnISbzVCbMEmSFxfxAlbL6jkoNyUSe4I+n3ZXKTsGhFNUrztDGPOvI4h3Uke9
	g0N+hLQRQmKnPaF7xMsjIgwCc9Sb+s5FCJZvw6j3XcdZgt8nM6JZVhh1fssoPi9xGOhFRZiL60w
	r+e3g5jxHN7cfwhlBf3hP0XtYAosmaJ3/kRzlR05C17aEWAFt3g2MV3g1RHJ4uc121hBot6aZcx
	/9B++hJN1bxnQfp2uNWpSnXBFuMXnkWrZmUqY=
X-Received: by 2002:a05:690e:1c6:b0:651:cd6b:8e59 with SMTP id 956f58d0204a3-65310b2583dmr6528046d50.62.1776583346398;
        Sun, 19 Apr 2026 00:22:26 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:25 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 09/11] staging: rtl8723bs: rename ReadAdapterInfo8723BS() to snake_case
Date: Sun, 19 Apr 2026 10:19:35 +0300
Message-ID: <20260419072034.19824-10-nikolayof23@gmail.com>
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

Rename function ReadAdapterInfo8723BS() to rtw_read_adapter_info() to
comply with Linux kernel coding style and fix checkpatch.pl warning.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_recv.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 20632a28d818..93ea9bf78626 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1115,7 +1115,7 @@ static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-void ReadAdapterInfo8723BS(struct adapter *padapter)
+void rtw_read_adapter_info(struct adapter *padapter)
 {
 	/*  Read EEPROM size before call any EEPROM function */
 	padapter->EepromAddressSize = GetEEPROMSize8723B(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index 783f64de0aec..e9ebecb224a6 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -90,6 +90,6 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
 void rtl8723b_read_chip_version(struct adapter *padapter);
 void rtl8723bs_init_default_value(struct adapter *padapter);
 void rtl8723bs_interface_configure(struct adapter *padapter);
-void ReadAdapterInfo8723BS(struct adapter *padapter);
+void rtw_read_adapter_info(struct adapter *padapter);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 0574258a0cec..a462a2864a59 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -269,7 +269,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	hal_btcoex_Initialize((void *)padapter);
 
 	/* 3 6. read efuse/eeprom data */
-	ReadAdapterInfo8723BS(padapter);
+	rtw_read_adapter_info(padapter);
 
 	/* 3 7. init driver common data */
 	if (rtw_init_drv_sw(padapter) == _FAIL)
-- 
2.53.0

