Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02E71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:03 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so2411348wmf.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5c1+Q0KzVEpEp4ZoM+JKnpzyHdyY1+xbVigGE4V/QiE=;
        b=EnIVTGkuzCzlhCRwBD9Oz78o7BO/cEo1yICL4IMJ1RzNjshl3yupAV8uLU3XMotmty
         CPL/tFAiV1776mj3YcIudRtqL8l2VLZAPWJMSn1fqp93GsbQ+H3lU60bPwbABznOImjb
         0drdgHDX/xCIyToZL8kNHfvxuLXYINMZuTNAteTG5EZmgLzizlhNZgbYOT3MpuSONepI
         2I1MdHJsMaJ614pQ+1LASBvHmXyWZ8TED06+/HjXzO3lreJ+oHRAgpwby9PiGJ7hrtvW
         w9k1MoBsvMXzfNpYJ2EYmldxZWqQuLfeECX2QvvDx8LqyrbPgRsx0WmQ+D8mMW5APugs
         CWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5c1+Q0KzVEpEp4ZoM+JKnpzyHdyY1+xbVigGE4V/QiE=;
        b=UjPVmFJSOsNvv0QQrDmdg8d7w+aj1gaQQM5REFJ8l0qIZQ0/MqdjVBIsMyCgOlQRe7
         /LqH5WQANGfAcRkF5bMOFte1wjw0VG80lkHIBrcdHHj8WOxN9VyaFo480D1ojuq4Igk9
         0UcBWeWpa7UkAfiFmE3CE4qn/7Qv4ppwX9x1ZlqeenXsP1+mLFherN0sMYFMleshaXcU
         tLLq5gSkDETxtUFQ4NmQ6y4M5+AJ7S/jVFIH75U3DgAOcVWB4riPM1lRBjgkJ6hyglkr
         zivo6qQFwAB4zWLUaVAwG6CFR5m3AuK9B3JjISJXGaj1V99KpEdfxxrf8JznSvwaU6vF
         oV2g==
X-Gm-Message-State: AOAM531JjhYgYRIa+C/SchxZbrnHe2f8n9TtktD4WS+cn0bMYGLykPRt
	GFotnov/+ZLH+iW3tjpUBag=
X-Google-Smtp-Source: ABdhPJxjehdPwrwm46TU8LHIi2jNeBKqBag6Uo02OxUSe7X/vNJZ+x1+AjSjZOY0puixzQFWR5aU0w==
X-Received: by 2002:a05:600c:1546:: with SMTP id f6mr8346403wmg.156.1619254982147;
        Sat, 24 Apr 2021 02:03:02 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id q17sm12222607wro.33.2021.04.24.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:01 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/50] staging: rtl8723bs: remove debug macros related to core/rtw_recv.c tracing
Date: Sat, 24 Apr 2021 11:01:59 +0200
Message-Id: <5af86d4dea96caf9c84f9ac302ec060edbc2fb65.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to core/rtw_recv.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 668a703dee7f..7432def1eb6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_RECV_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <linux/jiffies.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6403a11d712d..422d6bcfcc6f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_recv_c_		BIT(2)
 #define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
 #define _module_mlme_osdep_c_		BIT(5)
@@ -41,9 +40,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_RECV_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_recv_c_
-#elif defined _RECV_OSDEP_C_
+#if defined _RECV_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_recv_osdep_c_
 #elif defined _RTW_MLME_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_mlme_c_
-- 
2.20.1

