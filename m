Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C32FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so1402966wmf.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QIhM6s/LWPN2qislBbfeytQsgbBH4Yl1FLgMdln/Wyk=;
        b=VfJCj2XLKuVfXxtTq48RozVh2migmubmaT4M9Z7L87La9d9X+DIxWIKTc2GZk8Yvsx
         hgSRdxtyYXBOugZo/o5D3k9ll/cB7nhSZtsDEqbcflEbl1LjQjnKlOgb707mDfG0Twn9
         XnVvB0TpzBSvVJRIGTyc/Y498JfCX48zr83KJO8C9ock7jCGHSz2ATgihLNxCTj7/hKK
         u+h/ppPrt0wY7yHq6UJ1GSJkNwc3wtDIuNACsXUtImBf/IJ102A6v4ndsRe9sNJRFcU/
         XxOrzhTeuPVE1qYDMgofT2NptWTLVwvcxyKIYr8wVzF+sWPFeDMEAhcTJg6+Pa2r6ROa
         RXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QIhM6s/LWPN2qislBbfeytQsgbBH4Yl1FLgMdln/Wyk=;
        b=Tngoj+pzAnctWP4tYDfzh0ijV095lM1SLs1JKDeidyHvhgEq4nZrvl7bWCrB6rMo6H
         l1nfjUl5Fj3bHYQ4qOo8ZW7+kvbOJmhLYBY1LK8exRNOIJxvRSK5lbfjiRfM1sLs3oNh
         hu+B1OuoYkUKn0HNQigGe+ThXWYuiN6ekWDwdP2A/B297dYlOkBFXY8zGwsCFlJ8K+t0
         AXRZdby7VF23ESwmAIG4N11fHb9V8Raq9BW4i80EGO3KC2bCrm1qC+Yy63l3z52wyE/y
         Rw+j65Q7AlpQUAXW1Eo2JSdLqTRoJNemMpDjud8PI0dDG+1iB2S82Ivx49U6B/HNi9LA
         Z6Yg==
X-Gm-Message-State: AOAM530AyB62QA8SuyfwGANSt6V2UdIN8YaIHttsauKhIcj+Feblh8I1
	+uN+g2GVKXdGoLOOMAKl+rEMga3/AWQ=
X-Google-Smtp-Source: ABdhPJyYU2BCZASSxPu1vWnh5TDwhXqqYuk9Rnsj2LLd4E0bjifmT70iKNT8GYAVL7JFy9tD1FZHXQ==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id g12mr4645262wmq.117.1619189948314;
        Fri, 23 Apr 2021 07:59:08 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id a72sm8047458wme.29.2021.04.23.07.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/49] staging: rtl8723bs: remove debug macros related to os_dep/recv_linux.c tracing
Date: Fri, 23 Apr 2021 16:58:07 +0200
Message-Id: <a27648c924ed5bb6c6d05cf2e9e2ebaecb97b848.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to os_dep/recv_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/recv_linux.c | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 422d6bcfcc6f..d04f116bc9a4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
 #define _module_mlme_osdep_c_		BIT(5)
 #define _module_rtl871x_sta_mgt_c_		BIT(6)
@@ -40,9 +39,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RECV_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_recv_osdep_c_
-#elif defined _RTW_MLME_C_
+#if defined _RTW_MLME_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_mlme_c_
 #elif defined _MLME_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index cd51430d4618..88a69c7ca8f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RECV_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <linux/jiffies.h>
-- 
2.20.1

