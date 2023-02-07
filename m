Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139EBD38
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 08:40:41 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fi26so14400802edb.7
        for <linux-staging@lists.linux.dev>; Tue, 07 Feb 2023 00:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMvfmCD7tBbekIa2c88WSuoZ0Uv+htsjdlsAlXaUHew=;
        b=nUanZU9dEHI1L40Yv6J20WkesrTtHYfBYAHq/OB3TWoZ8D0sUap6bNqU75AJGYtSY1
         KYkCM99wASIGuxbotl1nTNBTGo/IJ3XCE/w2nHpGC+m7bo5KBcoydL9x+b6gJMYwZN9F
         NmRuRZ8RFdEU0Wz8L5yijpxEzx3B+UN6B22qva5I1JlAjEvAk69hD72l1FVlXGIq6D2J
         LEm9pZv+UOPnq9dI/5jKELc3I9Qv80fzgX27zE6LG8Cj/W/d70NC/EuFyXOfEOrPUBwE
         +kgNj5HdCaMTqCnGge4WikGKttofjua7IIa6uHv4k0rPR0fIk5Mm7R8JplNU6MbbRW7/
         659Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMvfmCD7tBbekIa2c88WSuoZ0Uv+htsjdlsAlXaUHew=;
        b=ADcLPJg0mj4hgEo5T++QD3je4WobfjXra6Tom6kHa4bU0fc2/dIxElbv29Jkaw6xOx
         eElLmrVD+vSoz454nfeySNsOHV+t66g6P6O65rrv7hYhqyHiS98GJFWJvjR23/C6D2XI
         TreGplrxMw8/rsJbu4Xmi4cyavH6ba6MObsjLifYH65D/QkmAu7b/2oN0FSUr6pncxFt
         lhdlKPDO9u6LkroTToy3iTKGB6a5DRNPZoOUOE7RBQJmxk736ASHqDQZHBfyTWUu+KQL
         EdjrEJ6KOyh8mrbVNUUh+mGQhvlyezGMeoszbYr+aTZ3rQUq0RAVE+klsN8OXKX4Cdyx
         XsgQ==
X-Gm-Message-State: AO0yUKWuqCDK4gTg6zl5pdT2wKFW9shF6f8K9FeDMtS7A+IOfYVLMX3s
	ys9NPBKSiBjiJmvswKRB8J4=
X-Google-Smtp-Source: AK7set+W5UGonxqIS5Ss6JhtTTbVOVCQ2tfVoBqFju/fXfteFgVSjJ1cYisM8roHKePbgXEkuxZntg==
X-Received: by 2002:a50:d748:0:b0:4aa:a248:a153 with SMTP id i8-20020a50d748000000b004aaa248a153mr2772555edj.3.1675759239812;
        Tue, 07 Feb 2023 00:40:39 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id s19-20020a056402015300b004a0e2fe619esm6117284edu.39.2023.02.07.00.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 00:40:39 -0800 (PST)
Date: Tue, 7 Feb 2023 09:40:37 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] staging: vt6655: Macro with braces issue changed to
 inline function
Message-ID: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mnOHG4BbaLD7s72P"
Content-Disposition: inline
Message-ID: <20230207084037.l6OHAgjSz7EJ_MDwBvFvzsrF6uEKkhBKEgoq00X3R1s@z>


--mnOHG4BbaLD7s72P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues" changed to inline function. In
relation to this, names of the callers of macro are also modified to call
this function.


Changes in v4:
	- Modified commit message to be clear

Changes in v3:
	1. Whitespace error from checkpatch fixed
	2. Should be applied together with changes in v2 for testing

Changes in v2:
	- Macros with one statement that is to call 'iowrite8' function changed
	to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are also modified
	to call this function.


Guru Mehar Rachaputi (4):
  staging: vt6655: Add braces to macro parameter 'iobase'
  staging: vt6655: Macro with braces issue change to inline function
  staging: vt6655: Macro with braces issue change to inline function
  staging: vt6655: Macro with braces issue changed to inline function

 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/channel.c     |  4 ++--
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 drivers/staging/vt6655/mac.c         |  8 ++++----
 drivers/staging/vt6655/mac.h         | 12 +++++++++---
 5 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.34.1


-- 
Thanks & Regards,
Guru

--mnOHG4BbaLD7s72P
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-staging-vt6655-Add-braces-to-macro-parameter-iobase.patch"

From 447c10de599e3434fb6c012cdfc2cc8e4b5c839b Mon Sep 17 00:00:00 2001
Message-Id: <447c10de599e3434fb6c012cdfc2cc8e4b5c839b.1675753094.git.gurumeharrachaputi@gmail.com>
In-Reply-To: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
References: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Date: Sat, 4 Feb 2023 04:34:38 +0100
Subject: [PATCH v2 1/4] staging: vt6655: Add braces to macro parameter
 'iobase'

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
 drivers/staging/vt6655/mac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index acf931c3f5fd..a33af2852227 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,9 +537,9 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
+#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
 
-#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, iobase + MAC_REG_PAGE1SEL)
+#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
 
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
-- 
2.34.1


--mnOHG4BbaLD7s72P
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-staging-vt6655-Macro-with-braces-issue-change-to-inl.patch"

From 4626600abe69c86a3f029360c37f7fda1107e78a Mon Sep 17 00:00:00 2001
Message-Id: <4626600abe69c86a3f029360c37f7fda1107e78a.1675753094.git.gurumeharrachaputi@gmail.com>
In-Reply-To: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
References: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Date: Sun, 5 Feb 2023 00:52:13 +0100
Subject: [PATCH v2 2/4] staging: vt6655: Macro with braces issue change to
 inline function

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues changed to inline function.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
Changes in v2:
        - Macros with one statement that calls 'iowrite8' function changed
        to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are modified
	to call this function.
---
 drivers/staging/vt6655/card.c        |  5 +++--
 drivers/staging/vt6655/channel.c     |  4 ++--
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 drivers/staging/vt6655/mac.c         |  8 ++++----
 drivers/staging/vt6655/mac.h         | 12 +++++++++---
 5 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c680925b9c92..a6ff496b01b6 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -545,7 +545,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	spin_lock_irqsave(&priv->lock, flags);
 
 	/* Set to Page1 */
-	VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+	vt6655_mac_select_page1(priv->port_offset);
 
 	/* RSPINF_b_1 */
 	vnt_get_phy_field(priv, 14,
@@ -643,7 +643,8 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_72);
 	/* Set to Page0 */
-	VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+        vt6655_mac_select_page0(priv->port_offset);
+
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 4122875ebcaa..e9a44bcebe32 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -116,12 +116,12 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 		spin_lock_irqsave(&priv->lock, flags);
 
 		/* set HW default power register */
-		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+		vt6655_mac_select_page1(priv->port_offset);
 		RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
 		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
-		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+	        vt6655_mac_select_page0(priv->port_offset);
 
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 45e5eccadb44..beb31a55abe1 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -400,11 +400,11 @@ static void device_init_registers(struct vnt_private *priv)
 	}
 
 	if (priv->local_id > REV_ID_VT3253_B1) {
-		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+		vt6655_mac_select_page1(priv->port_offset);
 
 		iowrite8(MSRCTL1_TXPWR | MSRCTL1_CSAPAREN, priv->port_offset + MAC_REG_MSRCTL + 1);
 
-		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+		vt6655_mac_select_page0(priv->port_offset);
 	}
 
 	/* use relative tx timeout and 802.11i D4 */
@@ -1586,21 +1586,21 @@ static void vnt_configure(struct ieee80211_hw *hw,
 			spin_lock_irqsave(&priv->lock, flags);
 
 			if (priv->mc_list_count > 2) {
-				VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+				vt6655_mac_select_page1(priv->port_offset);
 
 				iowrite32(0xffffffff, priv->port_offset + MAC_REG_MAR0);
 				iowrite32(0xffffffff, priv->port_offset + MAC_REG_MAR0 + 4);
 
-				VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+				vt6655_mac_select_page0(priv->port_offset);
 			} else {
-				VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+				vt6655_mac_select_page1(priv->port_offset);
 
 				multicast =  le64_to_cpu(multicast);
 				iowrite32((u32)multicast, priv->port_offset +  MAC_REG_MAR0);
 				iowrite32((u32)(multicast >> 32),
 					  priv->port_offset + MAC_REG_MAR0 + 4);
 
-				VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+				vt6655_mac_select_page0(priv->port_offset);
 			}
 
 			spin_unlock_irqrestore(&priv->lock, flags);
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index b4ebc7d31961..357df6031adb 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -188,13 +188,13 @@ static void vt6655_mac_save_context(struct vnt_private *priv, u8 *cxt_buf)
 	/* read page0 register */
 	memcpy_fromio(cxt_buf, io_base, MAC_MAX_CONTEXT_SIZE_PAGE0);
 
-	VT6655_MAC_SELECT_PAGE1(io_base);
+	vt6655_mac_select_page1(io_base);
 
 	/* read page1 register */
 	memcpy_fromio(cxt_buf + MAC_MAX_CONTEXT_SIZE_PAGE0, io_base,
 		      MAC_MAX_CONTEXT_SIZE_PAGE1);
 
-	VT6655_MAC_SELECT_PAGE0(io_base);
+	vt6655_mac_select_page0(io_base);
 }
 
 /*
@@ -215,12 +215,12 @@ static void vt6655_mac_restore_context(struct vnt_private *priv, u8 *cxt_buf)
 {
 	void __iomem *io_base = priv->port_offset;
 
-	VT6655_MAC_SELECT_PAGE1(io_base);
+	vt6655_mac_select_page1(io_base);
 	/* restore page1 */
 	memcpy_toio(io_base, cxt_buf + MAC_MAX_CONTEXT_SIZE_PAGE0,
 		    MAC_MAX_CONTEXT_SIZE_PAGE1);
 
-	VT6655_MAC_SELECT_PAGE0(io_base);
+	vt6655_mac_select_page0(io_base);
 
 	/* restore RCR,TCR,IMR... */
 	memcpy_toio(io_base + MAC_REG_RCR, cxt_buf + MAC_REG_RCR,
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a33af2852227..b9a7ca0fe604 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,9 +537,15 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
-
-#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
+static inline void vt6655_mac_select_page0(void __iomem *iobase)
+{
+        iowrite8(0, iobase + MAC_REG_PAGE1SEL);
+}
+
+static inline void  vt6655_mac_select_page1(void __iomem *iobase)
+{
+        iowrite8(1, iobase + MAC_REG_PAGE1SEL);
+}
 
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
-- 
2.34.1


--mnOHG4BbaLD7s72P
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0003-staging-vt6655-Macro-with-braces-issue-change-to-inl.patch"

From 2288b803515a781f0829c8e07e96e6cbe827ff4e Mon Sep 17 00:00:00 2001
Message-Id: <2288b803515a781f0829c8e07e96e6cbe827ff4e.1675753094.git.gurumeharrachaputi@gmail.com>
In-Reply-To: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
References: <cover.1675753094.git.gurumeharrachaputi@gmail.com>
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Date: Sun, 5 Feb 2023 13:40:42 +0100
Subject: [PATCH v2 3/4] staging: vt6655: Macro with braces issue change to
 inline function

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues" changed to inline function.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
Changes in v3:
	- Whitespace error from checkpatch fixed

Changes in v2:
	- Macros with one statement that is to call 'iowrite8' function changed
	to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are also modified
	to call this function.
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


--mnOHG4BbaLD7s72P
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0004-staging-vt6655-Macro-with-braces-issue-changed-to-in.patch"


--mnOHG4BbaLD7s72P--
