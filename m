Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B770
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m9so35966704wrx.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/iRqZNCmCgxmpFbtmmNVS6lXC39KZ3FxTpPWN6Xmdw=;
        b=Lstd56lwaDm+NDZ8FCqag0buthMnw89j+qBz4lqDoOz9Jp5qbWTOhPGA7u7zBb9KPf
         FUooqBEZRwCaHI7MkTOyihg/MOog3bQHoiB6q4T909ds1a/+NxTh5eDLgevYHUbvdWPs
         //ugm3/GC5mRCL+gMuPpmXvBnmf5eTG2slbHPIzeFp8WlUe/2aaIHRtRWzDY1iKJfpYa
         GWdZSl2zAbzrngoJkh0S+1IU2YRZF30JKhsvbLSb/gB7P6fseaFvYkAD9iYQVVN0/vlN
         8DBOGv9E4BP7yshfX/GwqTnQcbulsoU2YIxE0PLwD1kOVPj7+A7PQfA2yOpHnZhHU0up
         fSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/iRqZNCmCgxmpFbtmmNVS6lXC39KZ3FxTpPWN6Xmdw=;
        b=q1jOTyg42YGGcrM1b5U6DMp84soPoHmMUWHOe7JbIjLIX3HvAesHKTaxiUPoEVk+49
         VpGLOlHrtFIbErHKsCQyFQGdYRvlGI/vanj3U9qMzZshlNKBAHEn2U0mhc0q1e0HQknE
         Vbb5H9OIYPINOxR4h5PfdMPkvIkEgB5BXIKeWMflR8rEXeXXln5bSnaSLTEXLG/a0hjU
         ZtT8lRq+ZQ6WC4L/0SNNf6uijTexcj3D4lL0cfv1rxOSEp+tvVnWjta0CkQa52Zi7TFA
         CMqUnOScuP84+moM068rFqtrlowUbAa3oVeevyEB3YwUJZd1U8fszU+9BbFZMikV/IkF
         TLMQ==
X-Gm-Message-State: AOAM5306Sn067+JvXoBCZudyeAR+AsSeqKVI/JV0yhPw8Q1yGIEgLfCs
	2hjeeQoFok2VGm/wqUK72fc=
X-Google-Smtp-Source: ABdhPJyXG5UOS9dkjHZYC4OHZGQ+16R7j+25bKuVMzTn/GcVepTH59hgh4J237N6dvWuF+pFlDqTFA==
X-Received: by 2002:a5d:400d:: with SMTP id n13mr5193739wrp.372.1619189925539;
        Fri, 23 Apr 2021 07:58:45 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id a7sm9480868wrn.50.2021.04.23.07.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/49] staging: rtl8723bs: replace DBG_871X_SEL log macro with netdev_dbg()
Date: Fri, 23 Apr 2021 16:57:53 +0200
Message-Id: <9e6a1e4dc8962bfd58375be98619c76e8e28febe.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
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

