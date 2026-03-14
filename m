Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D708230270
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773465087; cv=none; b=WtHu4OuwJuMiXNw2/TitEBn6xEq0xMzsB+M9jCS+uA1WXzLdlR3T7HlLEgaqpliOBfpc61IafZOmNxODZiodiyhbpLRgbSApQJFd9q16JTXQqWBR8usf+HKspPS7qCCi6/+1h5I8X5N10FX9Vpf8zs/08L/xl9MQsoBDWB7v62w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773465087; c=relaxed/simple;
	bh=AaE6o6QyK9/KUqh0e1KYCIinXhQvrATeF9qPo+i9Gs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lc6qhdbZzArzob8MoGLgd0G5rZfycTRd/tTMDDpKJQPxjKXLE05fDVMtZgqLyPZdZ6w9k3NVYnEVQ1Ir4g/Tg2GvkbS5GIytXRNWTcjHUZahVvF2IAreW6ihRw12URL1fYZ2NZInNTLDAxFMdRaswdx8/QQhWVR7OHTITykpU7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuDc6a7t; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuDc6a7t"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56af73db66bso1113127e0c.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 22:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773465085; x=1774069885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7J5HS3eGea9O2cop2/aQx0yG4BxSg4p619pTiHkb1I=;
        b=fuDc6a7tg+Z6xJhP1YyHr51WTMJcFYH9bAVg0Vl15ZFJjonNu5KZKruYkHX5spG6ty
         e9wd84ttbbSpMGepWYSgf8jcfpMffqlfBnC6zSxVZVboPbJPkyAD3wFxDxdpmtgb93C4
         4I+/t9eyZtcRr8YC1WqiX0xzMmakBU/+yxzdmTE8kaLuMh6RPJDlFYkb/Ef9B2D+bdif
         H1lCI7D/zNpmxod005Y2S6ghGwyZt5m3v7wXFAJxxQwt/vyRzSeGbHu9mnXoUxlb3P35
         3fBLrc+SHuwSq8NED+rTsk4VIxrDQ04TfvMuMvADzTjl1lJcF4GPSMWJ4NbAryK0ZPwk
         9Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773465085; x=1774069885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7J5HS3eGea9O2cop2/aQx0yG4BxSg4p619pTiHkb1I=;
        b=UTWG3i1S2FDE7nfebEKsTY3iog8g8/tMO2LiTFYQHvZoM7vBP19fPYWA4PmRTahUmP
         PXMh/RDv3gbDhCGJoAy6lknW0OvAIoPlrQuRNdwqNX54VTWsxkhENGHStiLn1RJbHJA5
         kN7RsPAi1F7hOJ6cfPsj23wWGbK8rukbs6zP6kwrwgljdk41PIuhk08PoAub2K/MDem9
         HIgKU3LiH/VR89DUBw1mpjI5LB5r0B3Yrwvua8je0xGJRB4OjxR7wkmyFl3/ZSXn45Cs
         oSRwF2gf6nQVX+WmUuIKbQbAnPNqzSWo4p9AFhnrTFq65YoKL4Y/20Wqi4llPWsbATTJ
         0OmA==
X-Gm-Message-State: AOJu0Yzcgzcv3Ww/g+HWzjmpDTplLKNSkQ+aR7F1gGjxKFTbKgurOLUh
	DvD0od7gBWeOtB4umrsDhnK7CZd5efA5aKpIBk/XUZeAwSPX2NWLBIbG
X-Gm-Gg: ATEYQzzFQzs3cToYBoaWIaz/qP5+QjkyoPDse9vNJL/NHoaRNJHwU0Uwy7PtjhMS6FU
	0pl87NqZVEO3MoVrKBFS+hc3j2VTsROn4E/YMm8aT9+ApNQsNb0V4UtpMKtRmOmQE+iGyLSWtyF
	lRXlTZGguGfG7ktVLHSmR6BnVcjZ0r8Tik5L+0V5/0SXxWBzBoFkr50Zz3Ktrpq4woh3GDoSHsB
	fVEtwKOP5m6+gxDjel6Buk8/HMO2Ksr0U2uZnbO9qt1bflkTHFj0g1VbNwfZjjDp7pgIj/+iYIs
	88238dHGFzj2cCko/5iRZa71GuGd2Y1e4upt4HSfOJ3uEgHotN+cf39OLKB8E+GYPss1NXFtEDZ
	XuCSF4AcZftmccbRNgISAAURI6Cw/km3XXbkuQvk81fQ1r2ih4t+4ZM/R9omhjurTPueRfv5EzQ
	/Ak6aTNQZZlFmT2UMf3UXvL49bOxFqWSxvW4/sR7iaFgqJB9E=
X-Received: by 2002:a05:6122:3d41:b0:56b:5893:d060 with SMTP id 71dfb90a1353d-56b629782e3mr2194964e0c.17.1773465085418;
        Fri, 13 Mar 2026 22:11:25 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b6bb4191fsm1336591e0c.1.2026.03.13.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 22:11:24 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	marcosandrade95963@gmail.com
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Sat, 14 Mar 2026 02:11:12 -0300
Message-ID: <20260314051112.90071-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msleep() function is not recommended for delays under 20ms
as it may sleep for longer than desired. Replace msleep(10) with
usleep_range(10000, 11000) to ensure a more precise delay and
better kernel scheduling behavior.
This resolves a checkpatch.pl warning.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..261d2e306 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -4,6 +4,7 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
+#include "linux/delay.h"
 #include <drv_types.h>
 #include <hal_btcoex.h>
 #include <linux/jiffies.h>
@@ -214,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

