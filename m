Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD042FB6
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso10670522wms.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPndQDaxyiG3jrsoqJVhXHV4P1NA8knQl6XJxmATvj0=;
        b=aBAVsiJKu6YBvtzM5OfjgZiVVE3LcvxOEaE/O16uOCvsgLgRvF59fE09xyJTFy8P9w
         C0Q5ufntaCbHm4XFNA6SRNDLh8WFHv3sCkv3rsN4qzr/P+bfmp11dTRoyZKT3puKg4P4
         4jBcn/ptwzc9URDHmN8JAo1brCORsB8a6vu7VyStZ33YXVNGAl4X3KMLWnUoofBnDixn
         H1WjtIgig4B7hRBYa8S2adZLjdHeq+3mUuxQJpjb+F3R1lyAJ4Vmcp9JoYhgF+S1Is+W
         AJXBLdVW3rW+/uNy7R156Hc7NJG9XtxJL2v7Wb44yhXz4DOucaWjxqRh4xYelsr4RaGG
         XN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPndQDaxyiG3jrsoqJVhXHV4P1NA8knQl6XJxmATvj0=;
        b=XgwYfk9EkY/qCaQbyCL5bk2thzmX0RsnhS8m/rOXiLQTnh5pSJGgy6jySITqwRPWji
         KpCxzS773nTYgkArgiDu12G65CkHUqD0Wc+4bt9+J4cLShKOEA60jzjUiVXLKUg6PNmb
         TilTe5kjW5fVehwEIfs56mWRV/L+LxOM6y4rni3VIo+w0gv/K2N8sm150U2gTLg7iDZl
         K4bMD07t7qNqfQNe7WOb3R0ZgOk0ivM5Ktek75THqfkyHCQqwR0HnA8IaTryK0s3Ri+P
         zGwzrajxGrkCEGn/pvsaXe5Dn6IYHgw9un83wwaDGbQceQ3VZXEZ+7Di2czxc18QYtTf
         NpNw==
X-Gm-Message-State: AOAM531SnMz1w1snIynHzB4cKb95U/bWWjtmqzl7e6UhRvGpO31A/14i
	9xQmqrBL2DwBfb+xWdd1RU9mD4QahcM=
X-Google-Smtp-Source: ABdhPJxpHXbVCiKXkXzJ5MZE2JKxiSI0SoBy3R53wX/1p84LWroJk0UEd89Uvv3nVux0fXtwFZeCFA==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr7327391wme.76.1628329701880;
        Sat, 07 Aug 2021 02:48:21 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id p22sm11062009wma.10.2021.08.07.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:21 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/21] staging: rtl8723bs: remove empty files
Date: Sat,  7 Aug 2021 11:47:57 +0200
Message-Id: <92cba6beb56150635ab4c7985d733c93fba7fe83.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty files after function move,
hal/odm_RTL8723B.h has only an unused
macro declaration.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/Makefile           |  1 -
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c |  8 --------
 drivers/staging/rtl8723bs/hal/odm_RTL8723B.h | 12 ------------
 drivers/staging/rtl8723bs/hal/odm_precomp.h  |  1 -
 4 files changed, 22 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_RTL8723B.h

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index fe45200ff53c..159ca1b9016b 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -35,7 +35,6 @@ r8723bs-y = \
 		hal/odm_HWConfig.o \
 		hal/odm_NoiseMonitor.o \
 		hal/odm_RegConfig8723B.o \
-		hal/odm_RTL8723B.o \
 		hal/rtl8723b_cmd.o \
 		hal/rtl8723b_dm.o \
 		hal/rtl8723b_hal_init.o \
diff --git a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
deleted file mode 100644
index 66bda505c01e..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.c
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include "odm_precomp.h"
diff --git a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h b/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h
deleted file mode 100644
index 12b3ca90a43d..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_RTL8723B.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef	__ODM_RTL8723B_H__
-#define __ODM_RTL8723B_H__
-
-#define	DM_DIG_MIN_NIC_8723	0x1C
-
-#endif
diff --git a/drivers/staging/rtl8723bs/hal/odm_precomp.h b/drivers/staging/rtl8723bs/hal/odm_precomp.h
index 5041c9535e9a..edce506022a5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_precomp.h
+++ b/drivers/staging/rtl8723bs/hal/odm_precomp.h
@@ -43,7 +43,6 @@
 #include "HalHWImg8723B_RF.h"
 #include "HalHWImg8723B_BB.h"
 #include "Hal8723BReg.h"
-#include "odm_RTL8723B.h"
 #include "odm_RegConfig8723B.h"
 
 #endif	/*  __ODM_PRECOMP_H__ */
-- 
2.20.1

