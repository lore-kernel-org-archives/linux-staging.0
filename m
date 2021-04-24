Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974371
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c4so11776434wrt.8
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2ZqN65XK5OLpZsVVr1uV7MpQbBGCFzPUcE3WgPQfd8=;
        b=RwX0OvUgKVkU1HvRZftDzWf02QvjA/1BX+mujfW2ncSPvGJpdL68TBlgENyqtsgW7N
         v4U+TfrOqz+wVGuWL527wRe3FIC7TNLOIksN70eyUIN+Ym6CrA9WrUcBiihD3pyyhLvF
         PJ5wugev0PAqPvzyxxm/lPktzxbv2eDF30cPEmZ1vVMjtxtpw2oYHxxN5HD3SZu9vT5a
         H16dAAxCZTQgGl73kUugD8/nUfrRcigxhYLatiT2S6IoZcbMxwHlSqVtLJDu16pSPt8v
         3cNdiIT/05zN4JeXIjsutY4drpl7WWEB0Cvnq/Qy7CSbacR+RijomQhDae0b30jjCV+N
         9uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2ZqN65XK5OLpZsVVr1uV7MpQbBGCFzPUcE3WgPQfd8=;
        b=msR5FAir9xqOw0ZvEz0SYIzaNZmK7JHiOuiAyvj1axgvGzwFnUdET1mGJxUdsv1LI1
         nZT+/b6LRT0amGL0Q/wevZdnGx16uu2pDH8r3h7tu5k0ufC0IS0Hu5jfigNlL9RxuP/I
         hBvggC3XlvxqWI1qTEO8KRdy5H+1iheS7tf2OrI9w16OQwqQoZcjaAiuXak6kpw7u/eC
         ZycLj5XmVbaIQyFhhx6/33wbjrp8AXt8c6xMHoEQ26vwjS4jDkF7ssRWhjBQBq4xqBsn
         UQYyI/tkuPk8CV2ise/qJ1S94U9t9aNxM/0UM43Pr0pruL5PI7PF1o2yZJpQ3GVh5c3Z
         o0Eg==
X-Gm-Message-State: AOAM5332zGkBa9+K041k1Nvhut5vmHHgQZAsV+tII4I+lXwJSffPlkkz
	w6FOqHrPHLo1UESmM5sBu1g=
X-Google-Smtp-Source: ABdhPJzjNksjeJmrMzaR5htTMru0pZgkE48svY7NVrTFUp2i/pacQFRwK6JGJGYzS1GqwS/sNZeHhQ==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr9808980wrr.88.1619255015908;
        Sat, 24 Apr 2021 02:03:35 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id n16sm1590093wrp.50.2021.04.24.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 36/50] staging: rtl8723bs: remove unused macros tied to core/rtw_pwrctrl.c debug
Date: Sat, 24 Apr 2021 11:02:19 +0200
Message-Id: <0f746668ec65d6c188ba422778d6edc2b6eb7d91.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macro definitions tied to
core/rtw_pwrctrl.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 251b9abdf591..a392d5b4caf2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-#define _RTW_PWRCTRL_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <hal_data.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 8e324313ebf9..a7f6827c282f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -23,9 +23,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTW_PWRCTRL_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _HCI_INTF_C_
+#if defined _HCI_INTF_C_
 	#define	_MODULE_DEFINE_	_module_hci_intfs_c_
 #elif defined _HCI_OPS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_c_
-- 
2.20.1

