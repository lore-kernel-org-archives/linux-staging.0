Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1F62FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1391996wmy.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+j7lRegxzNVtgM/b7Sy9jh8N/GGtG6h5FSr8oPr7oJ4=;
        b=qxo/PTIF85lLgEg4lYW4gRt1e/iyQjhNRbgA99W4Q/M/og4zHxymfxOQgPz2NyhI2T
         QPp9E6+27qNJ8zUq1OZQ3Qsqpx9+C4xrhMMETWQp0NgO4JtitrfLxAkhvVO2okBaMU22
         3mWeyu55x6GTv2zSo0PY2Qm03glCXzD3w5Os+eABAxxY4S5uUllc1vCxFbNrMaMQZYZ3
         Z+HpQUJQBiJ4qh2+JtvsN/B5sKzgJ+Ekb5D8cU0kndKMznI2096chsix6nK86ln/sLpa
         anxMwXyjQvNbHenmnoiiwqVzGvUM5vNzrK99XQuyT+I3aP/FBHIcGeqIJkqAwE+Tbo7L
         NqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+j7lRegxzNVtgM/b7Sy9jh8N/GGtG6h5FSr8oPr7oJ4=;
        b=hxjqXfjkXPy1/fpxXv/M+VXVqmG34S1JJYmPXTZPoOudW7IMBTau3CB1zUaEDUhCan
         ivW8spnFGKxWCFz/l7D+cUk966An96c8jO+oneMJI5oo7Us1iB/oj250V+VIlks2hTfD
         QTqWdrdvVEWxtWEDLdFADSw3f+sLTkaVeNllmYSXWZ85c5sIImL2Lte44EaZm5G99gru
         X9zvpkFKxY5Jg4f+4zmyocD6E3xkVYt8FeYuS/GZYPZ+y98LiIe/yqvmETnJPZzC0s/j
         65vd4ut+ceYcaT0P7Lpra7T0UpEn+faZ74D3uT+CdtQpn4h2qOVA6o9sjUNNMApi5uVd
         Vgog==
X-Gm-Message-State: AOAM531BsMdrBT5gswzKSpKTHdyz+WJ6I6ep40wJhcFdjUvfuUeumfs8
	wFD+JqM/jsqkQuudFUnSGyI=
X-Google-Smtp-Source: ABdhPJzPuG0XtlVxSEWjPfZOdCnfzAoRIpjKRGdiorgLkxNVGjgjIPM4R+e6Xr8/EbwY9OGqZ9sevw==
X-Received: by 2002:a1c:9853:: with SMTP id a80mr4724814wme.44.1619189984763;
        Fri, 23 Apr 2021 07:59:44 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id z14sm9258507wrs.96.2021.04.23.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 38/49] staging: rtl8723bs: remove unused debug macros tied to hal/sdio_ops.c debug
Date: Fri, 23 Apr 2021 16:58:29 +0200
Message-Id: <6789381e398082317ba9d442091439db74f52626.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to
hal/sdio_ops.c debug.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 2 --
 drivers/staging/rtl8723bs/include/rtw_debug.h | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a31694525bc1..b5434ab71578 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -4,8 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  *******************************************************************************/
-#define _SDIO_OPS_C_
-
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <rtl8723b_hal.h>
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 3becb1b8d15e..c061d874f4e6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -21,9 +21,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _SDIO_OPS_C_
-	#define	_MODULE_DEFINE_ 1
-#elif defined _OSDEP_SERVICE_C_
+#if defined _OSDEP_SERVICE_C_
 	#define	_MODULE_DEFINE_	_module_osdep_service_c_
 #elif defined _HCI_OPS_OS_C_
 	#define	_MODULE_DEFINE_	_module_hci_ops_os_c_
-- 
2.20.1

