Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC282C8B
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 11:48:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id o11so11061054ljg.10
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RK+6qjGekkhso7ZmHz5xp91yYV6WriZFzt8aMd1Ug9M=;
        b=BORaO7EYbu57yQm21r7IsN6BVHOSi704+cJnZNx8CNZYdxz0kGuVMv6g2DjSdblNO6
         OVmRP7mLq4Z+7ZufnRjeZv1b0RE+KuN2LpM08YWGgVWfNjsmOp2tyfd3lzZtfHYwQ8KA
         4AHP+cjrzfBNJYbtqHYn4kjpbXdiENN888O94xv5F2Zviu4ztEdE4NDd2xRhym1ofA7a
         f99eHyirnC+VyH+nVN4Ema6nDnR2sI7ih04DuLCp9tFYN9klLK9Od21OiTKxEIBPjW7B
         /Yw5fHX6rUzc4me4x6RafFOKJrj8WPOB8gdyzHCnUUFvvOOcOtoU+xQlcIgTCN6u01Nr
         Sk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RK+6qjGekkhso7ZmHz5xp91yYV6WriZFzt8aMd1Ug9M=;
        b=eaS/E6uhG+vZXWYKKYNNjtMAz8AH0i8W9zgbLj3iKOdx4KVl58+VIE6LPvoSSB93Qk
         2tJSRYaTiWecohwKOCVGj7OAQXklqcwuW+GgN2rQi4NcLN/QcvEMEEZKSkoba5XFM6qr
         /rkpS4T5jJvy93WHSNP2rkjpi9Lmj9fZU8WWoD/b3QDeyH+FMlgNAMlpTTcTcjrpml0H
         gIS/RSeKOScjZ77Bo19PsS59vrsgv6TRMFIfCIa7p6v524ccpoHbuIBDnbwJovNNk+9n
         QyA9g7VoicHQrMRDUdb6SLzvoU3PfrRu1lBAGY6ml4Sd115pGgZ7wm3BQRQKIYJ6bX+a
         /z5Q==
X-Gm-Message-State: AOAM530jZv0ILEi88SdMmc5juqZ1rRFSwjzPOEaa0BaFI3BSxonxblTt
	6w4Rm8G6Jpgnc6O9vvBqm6Q=
X-Google-Smtp-Source: ABdhPJyS6qE8FEolXx+xvwovE8QEKUwUxUvWxmhzd2k2CnY5pfLsQsxcMueC2C7FVeQ0jdN+XRi00w==
X-Received: by 2002:a2e:7204:: with SMTP id n4mr12538121ljc.430.1635076091066;
        Sun, 24 Oct 2021 04:48:11 -0700 (PDT)
Received: from localhost.localdomain ([2a05:9cc4:7f:3477:17df:bb08:b570:84da])
        by smtp.googlemail.com with ESMTPSA id b25sm1418970ljf.116.2021.10.24.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 04:48:10 -0700 (PDT)
From: Jim Christian Haukvik <jchaukvik@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jim Christian Haukvik <jchaukvik@gmail.com>
Subject: [PATCH] staging: r8188eu: fixed spacing code style warnings.
Date: Sun, 24 Oct 2021 13:46:58 +0200
Message-Id: <20211024114658.74391-1-jchaukvik@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes some warnings reported by checkpatch.

Signed-off-by: Jim Christian Haukvik <jchaukvik@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c | 42 +++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index cde0205816b1..5b2a421aed56 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -2,25 +2,25 @@
 /* Copyright(c) 2007 - 2011 Realtek Corporation. */
 
 /*
-
-The purpose of rtw_io.c
-
-a. provides the API
-
-b. provides the protocol engine
-
-c. provides the software interface between caller and the hardware interface
-
-Compiler Flag Option:
-
-USB:
-   a. USE_ASYNC_IRP: Both sync/async operations are provided.
-
-Only sync read/rtw_write_mem operations are provided.
-
-jackson@realtek.com.tw
-
-*/
+ *
+ * The purpose of rtw_io.c
+ *
+ * a. provides the API
+ *
+ * b. provides the protocol engine
+ *
+ * c. provides the software interface between caller and the hardware interface
+ *
+ * Compiler Flag Option:
+ *
+ * USB:
+ *	a. USE_ASYNC_IRP: Both sync/async operations are provided.
+ *
+ * Only sync read/rtw_write_mem operations are provided.
+ *
+ * jackson@realtek.com.tw
+ *
+ */
 
 #define _RTW_IO_C_
 #include "../include/osdep_service.h"
@@ -183,7 +183,7 @@ void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-	     return;
+		return;
 	_read_mem = pintfhdl->io_ops._read_mem;
 	_read_mem(pintfhdl, addr, cnt, pmem);
 
@@ -213,7 +213,7 @@ void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
-	     return;
+		return;
 
 	_read_port = pintfhdl->io_ops._read_port;
 
-- 
2.33.1

