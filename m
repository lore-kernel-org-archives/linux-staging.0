Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D01E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583285; cv=none; b=tR9wUft0OxwP2MENuDNfT7TsMfy7sfJSwG6iXitd9/g3RLDK8P+pXUN5ySlNjP71XoCTx9vwqJMByr1uoBLUyrJ5/fCGSK6/pesCgQue+hU7+DIXBgRGqpPIjEWrgWBodlk2NOvBh2Ycw4mq6Z710AnVnSw//16g+FuSQs5QksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583285; c=relaxed/simple;
	bh=2JpDt0zt94X9FPdGAfls9CebVfJENZbn/VLoqpzRJHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mT7GCFoJz4LVq29WbNhIB88qrI/QeEvQSEJ5scAgk5/pszU9tOGy5hapJweZyR2EFwX02qdBjmXrl3onyJvRD4V+VFs2dnnQSMqyt74aXkD6S56AsY/wFA2QOfq9A/i9HnVaDoCRCEdilNURZL4RexBin+OdOkgHey8gQzrOP/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r27MSAkq; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r27MSAkq"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651c366f7efso2107757d50.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583283; x=1777188083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQW8BeSsLp06wqBJ3NY5M91KyX85XVnfv2Ph6o6h5bs=;
        b=r27MSAkqXxutw/QAhdLA0UZWsrDcLrhRq9MbMhFfFl0TpulG4yFzrKT5DA0CkHB/34
         +Z9JYvoxFfWdqA0WtVsq0NeyiucUA4koiyAjAXe7v1p0u9ix4393UmiJEfM4hTsTC3jh
         FGfKHSb5ti6DG6R4betz9Qd2n4KvpUZVj3vIoUWPqyCm4hW1aB9gBVYpIFVyiPjyKI8H
         KkN/h8jnGc2iIryi5tIQ3+xoez2+drE4U+/e+p3d/JDlEhnek1wxu8b8mOtaa4EtSZLA
         yN5XIXMbZK1hiW2oSsNDSzzw6yr60n80Lq3e3CS5jpQyJI6rPaTpwh0+PCeoDVifKuwU
         UWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583283; x=1777188083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQW8BeSsLp06wqBJ3NY5M91KyX85XVnfv2Ph6o6h5bs=;
        b=nPv7z4eS4jjgZZCaNGhAmm0zmhkp8+FJnrqTH3GqykGCu3RabJm+WZWbPgHWTU12w7
         zgCjijm+jv6yHz1j5UDzzngSlvvZQaG58uD9jUtY0qtm7ByrXchZRHTa0fUiDNtVuwQK
         YeLy15M/S7sp6o67mIxA/5RCM9tmScuaYx9brVGiQnMiKpzzXvuo2cYAHu7v9iVYlpjB
         rxCgESNfysZMtALq88zEQ22XpN4x98MNXW+1LI4AcFRKPZBnDSaNqL3dZ7DE1gEQe6Xe
         foI1jprpZ22N2WfwTqE6rcqNyjcLrTlB1fgfFsXWp1Y7f4T7sZB+UD85jUpeMAZntt8m
         HxNg==
X-Gm-Message-State: AOJu0Yw/OmowGkyQKrWMW2YyoCMcrtAlhZ8OLljCWaiDFMchQWALFxf0
	xRLLbtARYQ8iyqDDAHTwLKGPo6dm1xLmkd18y58zXcrvmo/bF/BNxjzQqBE1Vg==
X-Gm-Gg: AeBDievXswvERwZ81W9ujF8eB6OFpCbyfYfG5DUFVi1KB6glDfrdrWsr6vgsJq8v4fS
	71d/MireJNaMElRCbRIiEfmQigNA7s0QRTt5qVZ0/1Mt2ohSFqUe3WTTGW/J5LIndm6sicIqNkx
	Kw2b1O29cJjm6JiZSGq4covmLKPkKn3EEHd65IRiKWPrwFekjYMEEclI0ERhRW0X6qwegVAXEFP
	QbdyqjnyOqYz/y2jHzZomBtbEeaCbaEg0xfCDVdjGa0v+7O9GhZkxCAaKyQqnJZ/1r8mIvF/Bbp
	Q+SDeM/fzGTKMvgLMLZpUrqsjHZ5kbV/vTTFBuIaewNKvbWhw1ITwbhmwxSxmvaUF+xRtwublNr
	A6diz1MF0YEIwdme9mj7VLxpLeOnY698tFvvyW0wLwB1mGEb+NIz+XudtRBG7oz+wpco6TTLCUV
	CVvAU1faJu4pQotM6r5pH0ZGlfYlQI2U0iVgzMHOgtsl+iSw==
X-Received: by 2002:a05:690e:138a:b0:653:1c2a:94a5 with SMTP id 956f58d0204a3-6531c2a97c5mr6809759d50.8.1776583283429;
        Sun, 19 Apr 2026 00:21:23 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:21:22 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 01/11] staging: rtl8723bs: remove wrapper rtw_hal_chip_configure()
Date: Sun, 19 Apr 2026 10:19:27 +0300
Message-ID: <20260419072034.19824-2-nikolayof23@gmail.com>
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

Remove the rtw_hal_chip_configure() function, as it's just a wrapper
that calls rtl8723bs_interface_configure() directly. Instead, call
rtl8723bs_interface_configure() from the appropriate places. This will
reduce code complexity and improve readability by removing unnecessary
abstraction.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 3 ++-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..491208431396 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,11 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_chip_configure(struct adapter *padapter)
-{
-	rtl8723bs_interface_configure(padapter);
-}
-
 void rtw_hal_read_chip_info(struct adapter *padapter)
 {
 	ReadAdapterInfo8723BS(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b193854bfe6e..7629cef95b06 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -195,7 +195,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 
-void rtw_hal_chip_configure(struct adapter *padapter);
 void rtw_hal_read_chip_info(struct adapter *padapter);
 void rtw_hal_read_chip_version(struct adapter *padapter);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..f733692784bb 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -6,6 +6,7 @@
  ******************************************************************************/
 #include <drv_types.h>
 #include <hal_btcoex.h>
+#include <hal_data.h>
 #include <linux/jiffies.h>
 
 #ifndef dev_to_sdio_func
@@ -265,7 +266,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 
 	rtw_hal_read_chip_version(padapter);
 
-	rtw_hal_chip_configure(padapter);
+	rtl8723bs_interface_configure(padapter);
 
 	hal_btcoex_Initialize((void *)padapter);
 
-- 
2.53.0

