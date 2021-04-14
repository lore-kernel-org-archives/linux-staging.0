Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A46D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:36 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id v6so31523382ejo.6
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cnExdzfO9je6lLNL7qtvdytBrdvZAdV+P/MA6dcwm/Y=;
        b=LFCnxo/ON6AR8hqk6TYHju9T6QsGLojj9S66l0FpBe1yOYFDfYAEdmRpFZfOz1G9md
         yrBMvBz+XAgb9jcDDWX8Q/kbLrP6jNqiQfqIwBRCkEZ92bMknaf+XIeePDX69SokWijx
         YgLuT2ylOBoS3uAVMreT4LkpvQgCMJvG/ClwaR39l1EYvDd/H9Q6/tZs+wErlKEfgxl1
         j1edSJiutNNNHAMml0362bfMJc6LwWmmGzBSIciLlLqJHPWIaqo/6ea151AeJDZ2X/5j
         gnzotl1RUgEMvnaXOJd7RPeXb3fdhOf1k+aFurpLFxbDffO/AIvqG9wJuz56bByhoWg3
         VP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cnExdzfO9je6lLNL7qtvdytBrdvZAdV+P/MA6dcwm/Y=;
        b=TvhhV+24Ciem9sA9nhphLmv1eZB+ONyF7jdh35knGY0kZmc1NQscTclCwgFSOACLpu
         RRqQSWXUniAbgmXHOE6C99VHLsHxtwMwt4CluFVCLLqeIsmtESgCf/ACaIeMDa5LyHRb
         E55WK56V9K2db4rADgbN2ba+fLqRKfMZ4RSiTCy8J22ASGMjraHFxOOmFEDf/tCCsuDr
         P//9g+7vp12yCXThkcm8ORgKVWllzZXatTQCy45AmEgNun42L/Uyuf34X0f0h0OQaekt
         2AEgQQZP0I1sxrP2J/i9/s5QnK92W31d6Lg7RAjZifjeZ8JD29vt3+s7oaCPxJnRkeA/
         8lBg==
X-Gm-Message-State: AOAM531L7e1w7uz9Stm31i1qFbRRL7P/qOuvuO5x+jRqFfyB1H+uJAYh
	psxsUZ73p6Q9kFs0KtNm9+cWBg==
X-Google-Smtp-Source: ABdhPJztchaXZGy4TYvWXRBUOA/K9lvgspXhAfnCq5NTnCE6kXdkNGxm0ItI1LLoSbdSkmpwXPK4oQ==
X-Received: by 2002:a17:906:3455:: with SMTP id d21mr144104ejb.11.1618423895284;
        Wed, 14 Apr 2021 11:11:35 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrea Merello <andrea.merello@gmail.com>,
	Jerry chuang <wlanfae@realtek.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/57] staging: r8192U_core: Remove unused variable 'ret' and demote kernel-doc abuse
Date: Wed, 14 Apr 2021 19:10:33 +0100
Message-Id: <20210414181129.1628598-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8192u/r8192U_core.c: In function ‘rtl8192_hard_data_xmit’:
 drivers/staging/rtl8192u/r8192U_core.c:905:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea Merello <andrea.merello@gmail.com>
Cc: Jerry chuang <wlanfae@realtek.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8192u/r8192U_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index f48186a89fa14..643769e32e433 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -902,7 +902,6 @@ static void rtl8192_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
 				   int rate)
 {
 	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
-	int ret;
 	unsigned long flags;
 	struct cb_desc *tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
 	u8 queue_index = tcb_desc->queue_index;
@@ -915,7 +914,7 @@ static void rtl8192_hard_data_xmit(struct sk_buff *skb, struct net_device *dev,
 	*(struct net_device **)(skb->cb) = dev;
 	tcb_desc->bTxEnableFwCalcDur = 1;
 	skb_push(skb, priv->ieee80211->tx_headroom);
-	ret = rtl8192_tx(dev, skb);
+	rtl8192_tx(dev, skb);
 
 	spin_unlock_irqrestore(&priv->tx_lock, flags);
 }
@@ -2972,12 +2971,10 @@ static RESET_TYPE RxCheckStuck(struct net_device *dev)
 	return RESET_TYPE_NORESET;
 }
 
-/**
+/*
  * This function is called by Checkforhang to check whether we should
  * ask OS to reset driver
  *
- * \param pAdapter	The adapter context for this miniport
- *
  * Note:NIC with USB interface sholud not call this function because we
  * cannot scan descriptor to judge whether there is tx stuck.
  * Note: This function may be required to be rewrite for Vista OS.
-- 
2.27.0

