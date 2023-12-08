Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E241C87
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb72dX0O"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5451faa3aa7so545884a12.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059606; x=1702664406; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HoMxh9Soo4aEQSXS16TywESmqL58qNmWTbQ/HnkwzzM=;
        b=Wb72dX0OOUT2qi+QUerC/3M50CbSlAr+/QaoIJ4558qCUVxJDVlGI8YhzFIlE7x4MD
         7qYThq2ryl27/kFBd6Dugk0qFwONow8k1pF4AtPhVWNTD4QEb5fipCpp5eFCvo1U7anz
         liFkxSpUR9qbrmVZCNYTQhQ6+gVJ3eoft2fl8pxNA8HGXImzxNoDqoVp6/4XdCBilnQo
         z4CyrucTvbzsUHcV4tRCIyQ1pR+ykOjA7DX5ueYYmWP5k3MbdoyQKs2mj2wKvL/uC1YZ
         MIBwGL2gPhT9FYbpu5swa9Wa0PfT/fmdDsfAISvwchhci1nkBbskRYMO3fGsuVJPnRx9
         A2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059606; x=1702664406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoMxh9Soo4aEQSXS16TywESmqL58qNmWTbQ/HnkwzzM=;
        b=LR9t0ZvwnxX+ocGigpw7t7PWB7RrR1d84SQFPHTZyzm8AmjQ90lBb/ViAizZrnUOH6
         OhjZVarFji6rFzfRz/bnjlwxlbB7VC58hAZ5fBKSm5Mw+LwAb5ztrwf431krprr3lSIZ
         HErJ25jupQxWtwk/ql86MrdEFmCwXEoPTb0wGIwOeIXfUbXGmgwIsUdvZy1OMn/Z47fr
         TkD82ZPc+gFgsgzmi7TofoWbBOEjesWvVhQjR0M89jk3rNIEcKIpQof+Tvt6KxLO8Nw+
         guRUcAcIALYKHewxN3Zfi/Bp3Y5alXGwH1kA+lmE3gKwRj3/fIYwfXI26kKAehVx14x1
         jC+Q==
X-Gm-Message-State: AOJu0YxfSpij7BKMhlIzc7yl58BH6R5alUviJoSBDHfhGgQjeUe/zjE/
	BMzXYNKNilLEXof8STLmu/A=
X-Google-Smtp-Source: AGHT+IFMn9cxeKoi5L9gzVrLQAnO6MVj8mKG3A52AQuQQ6B5/EPfEH5iwi0gBIiQYToZFEEiafDLpA==
X-Received: by 2002:a50:cc8e:0:b0:54c:fed1:81cc with SMTP id q14-20020a50cc8e000000b0054cfed181ccmr666882edi.1.1702059605919;
        Fri, 08 Dec 2023 10:20:05 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id di5-20020a056402318500b0054cea9f91e9sm988808edb.20.2023.12.08.10.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:20:05 -0800 (PST)
Date: Fri, 8 Dec 2023 19:20:04 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] staging: rtl8192e: Remove files dot11d.c and dot11d.h
Message-ID: <ed7de82ade0fde1835bbd88aafba74aeb128beed.1701989555.git.philipp.g.hortmann@gmail.com>
References: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989555.git.philipp.g.hortmann@gmail.com>

Remove files dot11d.c and dot11d.h as they are empty.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/Makefile            |  1 -
 drivers/staging/rtl8192e/dot11d.c            |  8 --------
 drivers/staging/rtl8192e/dot11d.h            | 21 --------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  2 --
 drivers/staging/rtl8192e/rtllib_rx.c         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c    |  1 -
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  1 -
 7 files changed, 35 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/dot11d.c
 delete mode 100644 drivers/staging/rtl8192e/dot11d.h

diff --git a/drivers/staging/rtl8192e/Makefile b/drivers/staging/rtl8192e/Makefile
index 6af519938868..a1492215dab1 100644
--- a/drivers/staging/rtl8192e/Makefile
+++ b/drivers/staging/rtl8192e/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 rtllib-objs :=			\
-	dot11d.o		\
 	rtllib_module.o		\
 	rtllib_rx.o		\
 	rtllib_tx.o		\
diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
deleted file mode 100644
index ec71bae05c1f..000000000000
--- a/drivers/staging/rtl8192e/dot11d.c
+++ /dev/null
@@ -1,8 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- * Copyright(c) 2008 - 2010 Realtek Corporation. All rights reserved.
- *
- * Contact Information:
- * wlanfae <wlanfae@realtek.com>
- ******************************************************************************/
-#include "dot11d.h"
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
deleted file mode 100644
index eeefbfa96938..000000000000
--- a/drivers/staging/rtl8192e/dot11d.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- * Copyright(c) 2008 - 2010 Realtek Corporation. All rights reserved.
- *
- * Contact Information:
- * wlanfae <wlanfae@realtek.com>
- ******************************************************************************/
-#ifndef __INC_DOT11D_H
-#define __INC_DOT11D_H
-
-#include "rtllib.h"
-
-/**
- * struct rt_dot11d_info
- * @channel_map: holds channel values
- *		0 - invalid,
- *		1 - valid (active scan),
- *		2 - valid (passive scan)
- */
-
-#endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 546c8a33dae8..1d6d31292f41 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -34,8 +34,6 @@
 
 #include "../rtllib.h"
 
-#include "../dot11d.h"
-
 #include "r8192E_firmware.h"
 #include "r8192E_hw.h"
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d9517dbc5593..62d02576b441 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -34,7 +34,6 @@
 #include <linux/ctype.h>
 
 #include "rtllib.h"
-#include "dot11d.h"
 
 static void rtllib_rx_mgt(struct rtllib_device *ieee, struct sk_buff *skb,
 			  struct rtllib_rx_stats *stats);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 3c92eb401e8c..5c89744b2bbe 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -18,7 +18,6 @@
 #include <linux/uaccess.h>
 #include <linux/etherdevice.h>
 #include <linux/ieee80211.h>
-#include "dot11d.h"
 
 static void rtllib_sta_wakeup(struct rtllib_device *ieee, short nl);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index b48c89d2e7bf..5d165d0b134d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -14,7 +14,6 @@
 #include <linux/etherdevice.h>
 
 #include "rtllib.h"
-#include "dot11d.h"
 
 int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
-- 
2.43.0

