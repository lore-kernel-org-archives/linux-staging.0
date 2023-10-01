Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522517724
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:44:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9b27f99a356so309061566b.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167896; x=1696772696; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHEL4ZALe3kNObgKSEfdRhrWQpcI6CZqiH24RXB1Qgs=;
        b=m88W7HcX97ZxkZPc7tvleLZy0gBrD9Z0Cvn7ZUjJYQN/KWbPPRKQOevFimcdpVe/+V
         8POh5mFSrDZRmLnTFUe4UDuF8TVZYPwW59TS1REjksmVT9gQJM5KlggeiwY7kKm2Psec
         HvCbL7IgT7VWuDfvWo9Fajhlcq/SGES+ZGHPrm2P7O1uT3P6mqIxxFZSvhCoTGd5vIPT
         63e/ZVLMUmis0KbwNFuRWY41fQSEYbxNE/yWfZtj9qbloKck9Si04DHmd50wyq145+dW
         +kKJZnbBoQH51TlN9tcNr1WjsMyyFxoj4yikhIDqwjxIGP6XqLAKeVMLacC9DF89JPpf
         xqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167896; x=1696772696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHEL4ZALe3kNObgKSEfdRhrWQpcI6CZqiH24RXB1Qgs=;
        b=myPrQ1pTn+f8ao9ozezwPOEfZTQ8k3+ptfFOnSlzZ1A+Rlrsvw8YKk5fHamEIi/oam
         wdIdAQ6N1Gp4BpJ6RF/OgnxAVQoQTwwvISIH9FDC/dEC+ZJmVAAhrMp1JaUSWMrQ8MhT
         T48u4uKwAJ7P6pjXRq+NdTG6ePyDEgSY3ALkwnmndl4QeU6fgyV8/jjINy0i7rILhxB3
         LmOvb4QZaOecZMuCCxU2ixV+yEcbwa1wbOiBWVDLcXSbeaZDyvZqVzeicce4PsGR8RXH
         2PDqhPdQf+OSu7mYJ2Hl4CEErddoH7rRA8XtLh8Jfzev8Tm8Q8UdSw6FAQBOWdde87wH
         hUNQ==
X-Gm-Message-State: AOJu0YybkVHk/Yqu301Su3EUfT+ThU+06Ihh0ymbAnGtZurlMCBrJttg
	iUCtYyJqZICZxQkybGaYR38=
X-Google-Smtp-Source: AGHT+IHJsItI5qF7EHosVw7+KaqcorDCR6RAGP01XLgG4SDc3FBapzAv2L7WbSwVUtQngUO66Byy5Q==
X-Received: by 2002:a17:906:74d4:b0:9ad:dfe7:b361 with SMTP id z20-20020a17090674d400b009addfe7b361mr6959767ejl.5.1696167895946;
        Sun, 01 Oct 2023 06:44:55 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id j8-20020a170906050800b009934855d8f1sm15380208eja.34.2023.10.01.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:44:55 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:44:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8192e: Remove unused variable
 reset_in_progress
Message-ID: <25259d69b955472a74725f3665238fb6daee76b4.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

priv->reset_in_progress is set to false and never changed. All
equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 ++----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 5 -----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7ca6a04d034c..9da858510211 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1132,7 +1132,6 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
 
 	priv->force_reset = false;
-	priv->reset_in_progress = false;
 }
 
 static void _rtl92e_watchdog_timer_cb(struct timer_list *t)
@@ -1218,8 +1217,7 @@ static void _rtl92e_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
 				    MAX_DEV_ADDR_SIZE);
 	u8 queue_index = tcb_desc->queue_index;
 
-	if ((priv->rtllib->rf_power_state == rf_off) || !priv->up ||
-	     priv->reset_in_progress) {
+	if ((priv->rtllib->rf_power_state == rf_off) || !priv->up) {
 		kfree_skb(skb);
 		return;
 	}
@@ -1252,7 +1250,7 @@ static int _rtl92e_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 	if (queue_index != TXCMD_QUEUE) {
 		if ((priv->rtllib->rf_power_state == rf_off) ||
-		     !priv->up || priv->reset_in_progress) {
+		     !priv->up) {
 			kfree_skb(skb);
 			return 0;
 		}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 855bee78c674..fa5d0eec90d3 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -372,7 +372,6 @@ struct r8192_priv {
 
 	u16		tx_counter;
 	u16		rx_ctr;
-	bool		reset_in_progress;
 	bool		force_reset;
 	bool		force_lps;
 };
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 561ea68de56a..fd5228e7a462 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -530,11 +530,6 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 			if (Pwr_Flag == 0) {
 				mdelay(1);
 
-				if (priv->reset_in_progress) {
-					rtl92e_writeb(dev, Pw_Track_Flag, 0);
-					rtl92e_writeb(dev, FW_Busy_Flag, 0);
-					return;
-				}
 				if (priv->rtllib->rf_power_state != rf_on) {
 					rtl92e_writeb(dev, Pw_Track_Flag, 0);
 					rtl92e_writeb(dev, FW_Busy_Flag, 0);
-- 
2.42.0

