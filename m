Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9D71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:40 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e5so22022399wrg.7
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/iRqZNCmCgxmpFbtmmNVS6lXC39KZ3FxTpPWN6Xmdw=;
        b=kkETIbPAMKrWgB3GJLegv/n7bkOYFzk2F9EyimD5MsOVsT6V4+Agkm29HbC3UdZIZQ
         KmHJcU/b9m0rZKTWV9McwfuNtOm9MkbdNVVwv67LfC+9Pcly4ey0VxW41Z2DlhtkM5R5
         sfzTjC7h1YRRzZzAaC3+7WTr4AIhGgmEca3lxL0fylAUebfI64zaY6LJpKh6pROdgZFO
         h4as3dC/ZMRrjmEphWU70CReFRyi9a5H3dNdJpo1htICfqEdlpkd2Lh3+fd3g4fjXKtJ
         +Zd6bzYmGfNtIWSQ5ePfAmj+OTtnrVUQ9V7j2if1YkwBd2ZdH8U/w578ZB4Jdlh25fNV
         vXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/iRqZNCmCgxmpFbtmmNVS6lXC39KZ3FxTpPWN6Xmdw=;
        b=SNIyybNcUhxVCBhViJrxQ6ABbkambQQDbfI77omNe5amhhCT03DPCIpoTdX/iC20hl
         j7Rd7Xzw6JYdwf2/hgc2obRicQ2LxlO8hew643fwIQ5esuQ+HUYq0eNcs9rqmJN7HelC
         JtozXcxW3SFN2t+O7iZELitkmVnuAriNfXId9U554AbyC/zREjGpt6jWgnKeVx941/92
         NKw5t+bQ+sflt3oO+Oo6q/+6cwKrrzM6qYBQF2C0hCIX+qUphINTfb3DV6bvbOvvxQN+
         g7WHOhHRSqKqBCV1xoTPT0k7nkn/1uvFaEYfNZ1d4D0De2kJzmM7Xyl3XTbir9N6W/zn
         oibQ==
X-Gm-Message-State: AOAM5313nMUHbYH7dW3TmqOgzS5ZIi+8F4sBDHl+QVyC41vgvrNewsGZ
	h4YJ9s8/tdrBrq46YnfqjbBLE7Bgi6tYoA==
X-Google-Smtp-Source: ABdhPJwuChLrSMelNjxtMt9YStvxO4QP1m10Zlt/FsdYxnPDfnkoKltZdpnIMXZbhU57mU/Aw7IojQ==
X-Received: by 2002:a05:6000:1789:: with SMTP id e9mr10083140wrg.110.1619254958990;
        Sat, 24 Apr 2021 02:02:38 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id l5sm12377999wro.4.2021.04.24.02.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/50] staging: rtl8723bs: replace DBG_871X_SEL log macro with netdev_dbg()
Date: Sat, 24 Apr 2021 11:01:45 +0200
Message-Id: <9e6a1e4dc8962bfd58375be98619c76e8e28febe.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace DBG_871X_SEL log macro with the net device driver
recommended netdev_dbg().

This macro by default does a raw printk, and the alternative
behaviour, never triggered is a seq_print() call.

So replace with netdev_dbg().

The operation has been done with the following semantic patch
script:

@@
expression sel;
expression list args;
identifier padapter;
identifier func;
@@

func(..., struct adapter *padapter, ...) {
	<...
-	DBG_871X_SEL(sel, args);
+	netdev_dbg(padapter->pnetdev, args);
	...>

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 0ee0190c09d7..a43fa38cae62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -23,9 +23,10 @@ void mac_reg_dump(void *sel, struct adapter *adapter)
 	for (i = 0x0; i < 0x800; i += 4) {
 		if (j%4 == 1)
 			netdev_dbg(adapter->pnetdev, "0x%03x", i);
-		DBG_871X_SEL(sel, " 0x%08x ", rtw_read32(adapter, i));
+		netdev_dbg(adapter->pnetdev, " 0x%08x ",
+			   rtw_read32(adapter, i));
 		if ((j++)%4 == 0)
-			DBG_871X_SEL(sel, "\n");
+			netdev_dbg(adapter->pnetdev, "\n");
 	}
 }
 
@@ -37,9 +38,10 @@ void bb_reg_dump(void *sel, struct adapter *adapter)
 	for (i = 0x800; i < 0x1000 ; i += 4) {
 		if (j%4 == 1)
 			netdev_dbg(adapter->pnetdev, "0x%03x", i);
-		DBG_871X_SEL(sel, " 0x%08x ", rtw_read32(adapter, i));
+		netdev_dbg(adapter->pnetdev, " 0x%08x ",
+			   rtw_read32(adapter, i));
 		if ((j++)%4 == 0)
-			DBG_871X_SEL(sel, "\n");
+			netdev_dbg(adapter->pnetdev, "\n");
 	}
 }
 
@@ -64,9 +66,9 @@ void rf_reg_dump(void *sel, struct adapter *adapter)
 			value = rtw_hal_read_rfreg(adapter, path, i, 0xffffffff);
 			if (j%4 == 1)
 				netdev_dbg(adapter->pnetdev, "0x%02x ", i);
-			DBG_871X_SEL(sel, " 0x%08x ", value);
+			netdev_dbg(adapter->pnetdev, " 0x%08x ", value);
 			if ((j++)%4 == 0)
-				DBG_871X_SEL(sel, "\n");
+				netdev_dbg(adapter->pnetdev, "\n");
 		}
 	}
 }
-- 
2.20.1

