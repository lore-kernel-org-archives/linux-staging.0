Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C612FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:06 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id u187so6708283wmb.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/WnmT7CRdJ9xoYI2NiEVYpV5jw3qtqeREXJaneN7WYA=;
        b=CozGHQQ0pDA4kYsLZpxCzQlUG1i9RqE3x1kZqtSviPqZIKeD2adGBJK228zBcQQli4
         DYVXaEXpaT6yN8yjvJVMR6rQ+mA0x1MYACLEW0nEsMUR1+lHsLKW7id7S1kSfk6nx7D8
         swYuWfFWAsRhzp7u812UzNQamS+4lmET2/HEU4eHP1+L9MWX86vHVZUZeqqiWU03EXQL
         76m7qZy0+sCv70DnbH4or82t420X26rcB7nYgl2T37IHpP8a68gDN9QOop2jy+9PEpJr
         I2kEaLs3evSjcIwmPwjlZzzC+Dk5HJfr0Wkr+kwiWonvosOwiYwz5ztFDJWdFWOo4QvF
         UWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/WnmT7CRdJ9xoYI2NiEVYpV5jw3qtqeREXJaneN7WYA=;
        b=PMy1Uwth0bkcO6gLmmjc3BFmIg3lqtu4j7/3wkW/AaqW8ysWKMI8AesO8CYjXPgvTa
         C0b3a9SU+LHLpPnmrZtGZLbpu+evbfMSKZHWPlYdZxIKMKkHPYOyt830VeVNkiD2zKPJ
         xx+0gheLCorDm8D3Vf6oLWzizr5eMlWDttCI3hlsW7X02g3AVPZ58DuoeVAR/qKZbM3Q
         6m89t5UvRZL0L6lswR+ehXk9GqntSTC1fprYkVXa7dSoZx8sB/8GvQw3XPPPg25S3u6V
         9sSvBbxeuVclCUwymm/PD4X5fFvC1sqnBkEy82o+IIUyCsb7tKwEZvjFBZl+JrwOgPS1
         y0ow==
X-Gm-Message-State: AOAM532tZoKI/at5sUsLG1lLgFN6Cc3gjH9mkU+z5rfl8+PQhdmoj8G5
	xAZf9LNKRppskOYd++QRB6w=
X-Google-Smtp-Source: ABdhPJz1rE/xcMsV5gDMqx4CjdNJOo/kmmQ9YovszNJWIHZrdvlBRsFlFNFIBDz/TfBE86p17+fDzg==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr4719982wmj.53.1619189945024;
        Fri, 23 Apr 2021 07:59:05 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id y125sm8257692wmc.40.2021.04.23.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/49] staging: rtl8723bs: remove debug macros related to os_dep/xmit_linux.c tracing
Date: Fri, 23 Apr 2021 16:58:05 +0200
Message-Id: <343f21e1c00590b8f1e17756bd18f1ffe8aaee6e.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove debug macros definitions related to os_dep/xmit_linux.c
obsolete tracing.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index ea4d34678b9c..6403a11d712d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_xmit_osdep_c_		BIT(1)
 #define _module_rtl871x_recv_c_		BIT(2)
 #define _module_recv_osdep_c_		BIT(3)
 #define _module_rtl871x_mlme_c_		BIT(4)
@@ -42,9 +41,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _XMIT_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_xmit_osdep_c_
-#elif defined _RTW_RECV_C_
+#if defined _RTW_RECV_C_
 	#define _MODULE_DEFINE_	_module_rtl871x_recv_c_
 #elif defined _RECV_OSDEP_C_
 	#define _MODULE_DEFINE_	_module_recv_osdep_c_
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 639408eaf4df..6b039c1d8d57 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _XMIT_OSDEP_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 
-- 
2.20.1

