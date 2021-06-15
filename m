Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865EF6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ba2so48897951edb.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 04:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2r5MNcCSbm0M6BZ8kNpV7bxrB7TQ/PA1iHkO8WPawOM=;
        b=YXxcedOLIO/hw5poO7LMC6vK0V9sVwCIJImbhzOaBkl618H5EbC/+wN+H5BPRqgj61
         ZOcNLI3rbW/EyfWUvW5OGcF3w1pp/hzAT55tpSCB/Kw0V3cBeUcAO1UipwD6wGnrkOaz
         1gnVibeEXssGCWAiQ0cjzqxxAJSa4v1y4FwRzaZn7BrShd0nlHmhCa/djdOggJ/++uT+
         BS0jOuFcXA5mxn+6P5E+vEQEz5Z7ALxk2L70YU1L4wlpydEiNh5a6bqIJr7x9HT5mK8C
         gOJyjJBVq4FSwrawpHY6aAo/fJLpIcC+ZR+sic8DdvuVNo+6XuzrEppZeTqmqEKJ/TjN
         hRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2r5MNcCSbm0M6BZ8kNpV7bxrB7TQ/PA1iHkO8WPawOM=;
        b=M1BA3LNA4MzuxZAZWaLnQcR3vQEKx8JAgdPC1W4pMbzQYDR8tVUr/RummxQbvN2f16
         rCVnWgqU5OmHIksQz/GpE7f6x2gOeMoDFu/Sn+lHLzLsSfy0HZ7AZWpakinB/NctZalT
         EcguYg6+ltOUDAWih8rxafz7TrRcLsTQ0xtPBMO2PkE7E5i+O1kWb+o3Rlw/j4nYJAO7
         VR0ZenJlCW/gBj8Fn39BDSQ4GjGRZAQItQfXPKAIrwL9OhRCEe0jIe8QdHJe2TGEKNki
         WHqkuiCnXKkpykF2ErG7GXqFP8lUvoUU9ShLAZgmgGblaD8P1g6jgr+ZhZnP3Kp2mu7Y
         WxVw==
X-Gm-Message-State: AOAM530oKsKfPEKPPSQsJhZzZB5dk+4dP3IKutS6BdrVTdowpSFXi4PX
	W5An9eX/K7nZN2USWK2alY8=
X-Google-Smtp-Source: ABdhPJyO0r3I8iLDoKYOiJzcLTeDciKM2YMmT0H4HQ7pMQEmodR/gzsoB/hXgofpif64nCpBWvc5wg==
X-Received: by 2002:aa7:dc4c:: with SMTP id g12mr23331736edu.258.1623757550186;
        Tue, 15 Jun 2021 04:45:50 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id m19sm3980355eji.53.2021.06.15.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:45:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8723bs: remove include/autoconf.h header file from tree
Date: Tue, 15 Jun 2021 13:45:37 +0200
Message-Id: <9317fa8fd41da4668a41775207b5e6dad33e7447.1623756906.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623756906.git.fabioaiuto83@gmail.com>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove include/autoconf.h header file from tree.
It just contains a compiler configuration check
which is not needed.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h      | 14 --------------
 drivers/staging/rtl8723bs/include/drv_conf.h      |  1 -
 drivers/staging/rtl8723bs/include/drv_types.h     |  1 -
 drivers/staging/rtl8723bs/include/rtl8723b_spec.h |  2 --
 4 files changed, 18 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/autoconf.h

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
deleted file mode 100644
index 8587b746c720..000000000000
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef CONFIG_WIRELESS_EXT
-#error CONFIG_WIRELESS_EXT needs to be enabled for this driver to work
-#endif
-
-/*
- * Auto Config Section
- */
-#define LPS_RPWM_WAIT_MS 300
diff --git a/drivers/staging/rtl8723bs/include/drv_conf.h b/drivers/staging/rtl8723bs/include/drv_conf.h
index 9cef9ce589a1..9e8c37b29a7f 100644
--- a/drivers/staging/rtl8723bs/include/drv_conf.h
+++ b/drivers/staging/rtl8723bs/include/drv_conf.h
@@ -6,7 +6,6 @@
  ******************************************************************************/
 #ifndef __DRV_CONF_H__
 #define __DRV_CONF_H__
-#include "autoconf.h"
 
 #define DYNAMIC_CAMID_ALLOC
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 49b404e5cfaf..cc0dac355589 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -15,7 +15,6 @@
 #define __DRV_TYPES_H__
 
 #include <linux/sched/signal.h>
-#include <autoconf.h>
 #include <basic_types.h>
 #include <osdep_service.h>
 #include <rtw_byteorder.h>
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
index 999555476ebc..6816040a6aff 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_spec.h
@@ -7,8 +7,6 @@
 #ifndef __RTL8723B_SPEC_H__
 #define __RTL8723B_SPEC_H__
 
-#include <autoconf.h>
-
 #define HAL_NAV_UPPER_UNIT_8723B		128		/*  micro-second */
 
 /*  */
-- 
2.20.1

