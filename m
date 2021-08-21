Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB63FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 15:52:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so7855221wml.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDjoRrO86i0x0pgh7O1gS7MImh2qtoWDpf+3Wu7hPlY=;
        b=JJeYDUTgItIzLNg9PuiizMppcQhRh/gbLbe+EaJS9DLLsSVvOVlbOmEXdOBoxA8y/K
         aJ+f7P+7aRiJqV/kRbN5wyU6KFsv2ZbNTMcG6ZJhhiDPK68HhS8iIP5vQNfSev3dnsEq
         hWNajYlmu4WGqF+Ae6d/36Z0Z0n44yp9IQQw24/5fqbtiyiDMr5+e46rRlm5DHNIhu24
         GQmIYolmtabssvwdZXNoSpVa/zy9qwhU8/o6160TRqlt4GZNimrgU5UGaI7RszH4KzPX
         ylAKG77A9Us8aaifrV4g32N0m46J9+qrdKOmlR0wGvlV/pElF4AePjA+n5+NVlKJssGr
         Dt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDjoRrO86i0x0pgh7O1gS7MImh2qtoWDpf+3Wu7hPlY=;
        b=EAQ91juvEbhQKVUQtWLzoeLEeWx8m3Og73KTQYHLcltWbi4lf7OF9p3JfwqX1GlYxj
         4MsTImqF6KcYvtTE7fAOalSnpD6qCQASZDwH5E3rsaR45DbnMbw5fpuZlGWptTzXM87j
         CKIkhYLtWdL81uWLF6WncOx4Jlnet0qUyVcQXFAlbhFPOYK0GWsZelJGEz16EiZ1PLlp
         zqaSNO/mIQS36UbTdmPBJvQOLws0nrY3Ap/WPrp+ZMY8o9IPi5aBLRYurLXO7wsWzOqM
         b/PgNiFSUimvludF696SpFvLfb4pqE5TcGBjwqybU1l256OPA96z/Yifc8KzXCkpzjQX
         m5PQ==
X-Gm-Message-State: AOAM530E3nLa7M+q8RU/IRnGoEd789gNScHOQDxDo+SzM68lG6/AsFX/
	NoXzLHyHRpXaAOl2aOC9pHM=
X-Google-Smtp-Source: ABdhPJx8+or3o3DbhJZf1pgDRL7OYdmZ0Pw3RNoIwQqFU1HUv+O95gyChd9PpvJR7W64dW423RjTAQ==
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr9159673wmj.61.1629561172059;
        Sat, 21 Aug 2021 08:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id k18sm1875032wmi.25.2021.08.21.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 08:52:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove cmd_osdep.h header file
Date: Sat, 21 Aug 2021 17:51:51 +0200
Message-Id: <20210821155151.25822-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All functions declared in the cmd_osdep.h header file are only used in
a single c source file. Make the functions static and remove the header
file and its includes.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c      | 11 +++++------
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  |  1 -
 drivers/staging/r8188eu/include/cmd_osdep.h | 16 ----------------
 3 files changed, 5 insertions(+), 23 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/cmd_osdep.h

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 955499eb608a..ce73ac7cf973 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -6,7 +6,6 @@
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/recv_osdep.h"
-#include "../include/cmd_osdep.h"
 #include "../include/mlme_osdep.h"
 #include "../include/rtw_br_ext.h"
 #include "../include/rtw_mlme_ext.h"
@@ -16,7 +15,7 @@ Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
 No irqsave is necessary.
 */
 
-int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
+static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	int res = _SUCCESS;
 
@@ -59,7 +58,7 @@ int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 static void c2h_wk_callback(struct work_struct *work);
 
-int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
+static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
 	int res = _SUCCESS;
 
@@ -87,7 +86,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	}
 }
 
-void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
+static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	if (pcmdpriv) {
 		kfree(pcmdpriv->cmd_allocated_buf);
@@ -105,7 +104,7 @@ ISR/Call-Back functions can't call this sub-function.
 
 */
 
-int	_rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
+static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 {
 	unsigned long flags;
 
@@ -123,7 +122,7 @@ int	_rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	return _SUCCESS;
 }
 
-struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
+static struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
 {
 	struct cmd_obj *obj;
 	unsigned long flags;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 3e1a45030bc8..7d50d64cf34d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -6,7 +6,6 @@
 #include "../include/osdep_service.h"
 #include "../include/drv_types.h"
 #include "../include/recv_osdep.h"
-#include "../include/cmd_osdep.h"
 #include "../include/mlme_osdep.h"
 #include "../include/rtw_ioctl_set.h"
 
diff --git a/drivers/staging/r8188eu/include/cmd_osdep.h b/drivers/staging/r8188eu/include/cmd_osdep.h
deleted file mode 100644
index 3954d6350cc6..000000000000
--- a/drivers/staging/r8188eu/include/cmd_osdep.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef __CMD_OSDEP_H_
-#define __CMD_OSDEP_H_
-
-#include "osdep_service.h"
-#include "drv_types.h"
-
-extern int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
-extern int _rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
-extern int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
-extern struct cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
-
-#endif
-- 
2.32.0

