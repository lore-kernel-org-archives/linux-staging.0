Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF228ED
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 13:08:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ee13so2609059edb.5
        for <linux-staging@lists.linux.dev>; Sun, 05 Feb 2023 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDLxI4fpTDTmEI4qnM+uL8XIXglzEjq5nSIL0bjIDLo=;
        b=ci3bWc23frclFm9mFh/FFC9McKZJpWiGMUOa1XGn9GfJUSSISMbeGeDyQYXmbOEwhH
         ed+rXxN1EyWFqhNGB2Uce+FakwGgIKEHsEW65OeuDI77gjbfI8pMPXreVu+F5+jWk/cK
         DouPMTi3TjFYXY/4ZAy+xxx565ypbvcG+MlyGl8nLj0WThcTA9ls1gZKStEHIrGVrmBq
         SjSlMxGbu0Ao0CkK8BWKnrf+McX4EyweOiWW2YF2+Lke2RptfLU72xcWVrO9pBF2cOXZ
         e4Cz1DowAM57HR2zqSPoEOzsd9VtY4k9xtYO+KY2x84AfT0+zq/BPyYD8QS3PNGwVGVV
         PQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDLxI4fpTDTmEI4qnM+uL8XIXglzEjq5nSIL0bjIDLo=;
        b=ExDapNqQHsT3hXVtAp9bZ06dOX4GII+2/fLt0f0fUPbhnPaRx8B03tVQDblRxS2/Ph
         WCFo7vD2HWOX+Yqz63u938Z9vyHofnvhVFh0AHi/hueTv2cenNhxS8UaTK9rCuxRsxbi
         SLqs3LcUQWXtAycot7/nn/3UwTBIRjnMu44d6qTY2N5Ie942AZlQGwdjeRJHh00JbVW1
         2BNp4/1bZ4PdiL9pKZb7S4dg8uM74H90qNLywYN+8+F0lRM/rhS5gKbhHFQad6BkY0ZI
         ctSGffsDAZhvmrqpoqOnjS2ZDqhhOSj0XnFJZgMV+WCWusG3jPIn9aVpzOk4XiClsOPS
         oSdA==
X-Gm-Message-State: AO0yUKXLe/D06bXnkdsvj6hAEdvWz7RGdkP1tqvlhCRcI0H2TBn8d527
	ECFwvNN6uXb2xo0dG+QpdsE=
X-Google-Smtp-Source: AK7set/IJcGeqAYiBrIfoQWphmoP9Q59R+3UFGAOjal0ryJ8Jbiq5ISi436jjglfFLv6uv+3S8G9Wg==
X-Received: by 2002:a50:9304:0:b0:4a2:7489:a70a with SMTP id m4-20020a509304000000b004a27489a70amr18098803eda.22.1675602485029;
        Sun, 05 Feb 2023 05:08:05 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id b15-20020a509f0f000000b004aaa3c872d0sm1748175edf.87.2023.02.05.05.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 05:08:04 -0800 (PST)
Date: Sun, 5 Feb 2023 14:08:02 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: vt6655: Macro with braces issue change to inline
 function
Message-ID: <Y9+qMqYD2zGWRurD@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues"

---
Changes in v3:
	- Whitespace error from checkpatch fixed

Changes in v2:
	- Macros with one statement that is to call 'iowrite8' function changed
	to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are also modified
	to call this function.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
 drivers/staging/vt6655/card.c    | 3 +--
 drivers/staging/vt6655/channel.c | 2 +-
 drivers/staging/vt6655/mac.h     | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index a6ff496b01b6..d2d122dc16d8 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -643,8 +643,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_72);
 	/* Set to Page0 */
-        vt6655_mac_select_page0(priv->port_offset);
-
+	vt6655_mac_select_page0(priv->port_offset);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index e9a44bcebe32..60b445c38424 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -121,7 +121,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
 		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
-	        vt6655_mac_select_page0(priv->port_offset);
+		vt6655_mac_select_page0(priv->port_offset);
 
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index b9a7ca0fe604..ae3064303691 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -539,12 +539,12 @@
 
 static inline void vt6655_mac_select_page0(void __iomem *iobase)
 {
-        iowrite8(0, iobase + MAC_REG_PAGE1SEL);
+	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
 static inline void  vt6655_mac_select_page1(void __iomem *iobase)
 {
-        iowrite8(1, iobase + MAC_REG_PAGE1SEL);
+	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
 }
 
 #define MAKEWORD(lb, hb) \
-- 
2.34.1


-- 
Thanks & Regards,
Guru
