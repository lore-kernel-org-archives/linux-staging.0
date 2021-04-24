Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a26-20020a05600c225ab029013f5867af96so281960wmm.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTcOY2KPuML+7k+l89QwiCfZDtCp1C6AXB96qqJFx+U=;
        b=UJnbDnAw4izlVHmnOAZJH973ja6WNS7XTGLeiXJhWj4QaPcwLycQfGjCkdsgH6k7IZ
         +c8htFjADQqkg0txF8LRCV8Q7A9kwuPYR9fLeOmI3iBRUsi2a9cSLnRgdnHF6fTPcoxQ
         hP/hZGnvdY5mEzAUhd6GWtbldIvDBpN/ZCx2Olnprlts928qmokhlIxuJz0DxdsxKv/i
         VxDxtKTGKxS7Y75KT01K2xPUQYzCAO80lda0mDy49Ykl55PyCp3SyegSZ+l0ooWckDxS
         WFP8uGtjvXsNFxlf91U+Q8Tc85y1RDGttWFwUmSmpcdWTkhVTaiq+xfqzdO5icD4X168
         pbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTcOY2KPuML+7k+l89QwiCfZDtCp1C6AXB96qqJFx+U=;
        b=i3pKpFZMm+kXo8W1prNeZG8w5KmES6XZGmAna7mXGZG8G/09M1vEGhcldkoDkYbo/4
         8aIMoY1Tgnv4CpFr8uXwqNzElJ1BW6vdlProZX3+qPoiw9UBQqLiHRYvT9wdlFYGCyiH
         FnKK3OFaOsretqloVETbtXUBXaQsEz7+5Wuaj/IkNPMZNQUIDlqW7R1G43Z9OF/QhNzH
         rMBCXQ84j9EWzxxyLY2WrEcXTA0co9+l1xCsYkYzZe+diOcIZVaikzoADRvnhmR56H5M
         HwNB5fSF1FADtN5W/oI08+olrBsOOzu0j+TGxWvTNBU6fNKdhM2F6xUjl4393VO+4Xw1
         VPYA==
X-Gm-Message-State: AOAM530oEmFAbrQSwp/D0aRxNjikxHsmobqrS4e2tCYjv69N4YxfXczM
	1UhC/Jwcn8n3U6iX+BKbLTA=
X-Google-Smtp-Source: ABdhPJw7KlfopJUS2X2JJFGtOGwgwZBvoWSqE+jDY3mnLYDyCBQ0u6d955GImRyQeF7d8EQyxE/3Aw==
X-Received: by 2002:a1c:7f82:: with SMTP id a124mr581296wmd.170.1619255034417;
        Sat, 24 Apr 2021 02:03:54 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id v8sm12377152wrt.71.2021.04.24.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 47/50] staging: rtl8723bs: remove unused macros tied to core/rtw_efuse.c debug
Date: Sat, 24 Apr 2021 11:02:30 +0200
Message-Id: <13673f9241ca482e6f02cfb16a765dd0c4feaa84.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macros tied to core/rtw_efuse.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index a28a06d5a576..1f22eb4a29fa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_EFUSE_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_data.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index ad96fe1de971..6b657190b124 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_efuse_			BIT(29)
 #define _module_rtl8712_recv_c_		BIT(30)
 
 #undef _MODULE_DEFINE_
@@ -22,8 +21,6 @@
 	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
 #elif defined _RTL871X_MLME_EXT_C_
 	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
-#elif defined _RTW_EFUSE_C_
-	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
 #define DRIVER_PREFIX "RTL8723BS: "
-- 
2.20.1

