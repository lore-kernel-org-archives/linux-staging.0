Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0042FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1391273wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FguT1SZP0JKjZXOwzC5Q0evIdGUpU5e+RgS1n8RdIQY=;
        b=XizceieGr+lZQkiEYSglATxkYs53eqB2jCWNtkqMlpjlIS8nPfXW37qtSyHhD+d07A
         rqRqZfG+/r8lrQE85ZnZn8ABneT4OgZvbfgB/GAz4xXqj4FnQhdc4wfJ0XgPddCfdyGH
         sS1HeA6SNlsUpPp2+09HodHkLxLMGkYwGcSGUfMX2vidtJTvyh3xsmwEFoQYma6iVBwd
         MIan33gkeKTYRd7hPZraUk5ANBfWC6araKuEuL7/IDBjGAMiZrWJOZvSl+YE+8IuRqlA
         6RF/b+R6+ADR1HRaoy4+n8NNwerUKXY3Xz3dSasps6oYFhrIWhJ+wDnEjWXnWeAVWnQl
         5gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FguT1SZP0JKjZXOwzC5Q0evIdGUpU5e+RgS1n8RdIQY=;
        b=nKRiuhOJQG/KJeFmh3m8GyWmJsQcWb0dDGsAGyuHkw0LwVX+hiZK2THYR9GcAuK2ZL
         JArh0rH7+HnlMNDpHPfwlzBZEngV3s7A0f+IFhrUKZKOID0LqFci6JdSP5AF9CWgqK4b
         AK9jnGg4o1gayi0U1PZhHLGcbJVsUEoHF38MLpqU55lPQm25zwgd2bk1RgWkDim3472x
         jAODaNySLgKHqG6tO1tXZpA0maKX9rh/p/9Q0DpiiA9kdrYX26K+jfSsSlJl8su3QBoK
         5j8P9kaaQMkgjlAsCk+vwfX1oWyse+blTgGsR9F+VKn4QXDhUg0ua1GzHJ4p0dTs2j4/
         VC5g==
X-Gm-Message-State: AOAM530CbtAXEil0EUJTTs9xBIDvx1jT+iDgqCKyZFT/sgaTHcN1mSeJ
	deCCVKKtx9TbzNWFH273pzpQ/O8e62o=
X-Google-Smtp-Source: ABdhPJy62ra9bW9RWJ2BE97mC9qDg1WxL6Q2xoYDrGEaylCIWFU64Ekk/ixcO8REJTW9IDhGWPgung==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr4751244wmj.149.1619189957740;
        Fri, 23 Apr 2021 07:59:17 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id g5sm9629856wrq.30.2021.04.23.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/49] staging: rtl8723bs: remove debug macros related to core/rtw_cmd.c tracing
Date: Fri, 23 Apr 2021 16:58:13 +0200
Message-Id: <66e96cb78538ec9a59cdeb5675f7df97a3ed9471.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macro definitions related to core/rtw_cmd.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index e1a8f8b47edd..75db4272e537 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_CMD_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_btcoex.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 76756f6aac99..bb56d38e6b7a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_cmd_c_			BIT(7)
 #define _module_cmd_osdep_c_		BIT(8)
 #define _module_rtl871x_io_c_				BIT(9)
 #define _module_io_osdep_c_		BIT(10)
@@ -36,9 +35,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_CMD_C_
-	#define _MODULE_DEFINE_	_module_rtl871x_cmd_c_
-#elif defined _CMD_OSDEP_C_
+#if defined _CMD_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_cmd_osdep_c_
 #elif defined _RTW_IO_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_io_c_
-- 
2.20.1

