Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8821446B5
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 20:19:35 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id vw16so561870ejc.12
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=04yBUYjfgAWOng38rhO9oZktPB+8MCP7LPU6LUdsNzs=;
        b=hmwcsW8F0h3YafaNsxN75zUgV80WF+pEIftfBrxjteAQGRJaONL8K0Hd2gI3j5JMsC
         3af4ILWZ5eTRbWXTa760hx5djUFM4Xp8g7uhl+jHIhynjioZJhYBCfI3sbe637Mo1Dqq
         7UB6WJSaUuxToSKQsgp8p+OEl+oUosvA3Jo92OBTtwCYwzaQbAvqItQZ7efoWzypFKIP
         8HqhfKrPGGieF5hmEy2bU4x1hVby97aiJqRirECQe6FVh6XAt6OsPX46W2V/9kk4u6JB
         YAoD9i07KmLTnRCReLVsP9FhQ3q37m5q8JHmp/+QNWznFU890qK4M8y1GksMICPUAZOQ
         66bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04yBUYjfgAWOng38rhO9oZktPB+8MCP7LPU6LUdsNzs=;
        b=x1ZNJmPhUzcZxxDEoUXrh9hXKl2z8ijNfpjU/iKi0RI260ewdSY+8WlgnIgwWVC3tw
         NX1l207cnthqaA0PzqBY8uqfa5NzFgtEJKrrMOVzLLG+k/ReGwr5ZqP+FGjpIyri9dIh
         deyxnkiGFrmA1yqWH6Sv6xMQxA6OJPYlJglI/NyqzcjZTKhZ/Yll/qlhFYxzdPCNZNbZ
         +PjWeMZjwfbHXHNNA7u6iv53Nb83tu6WqYWCpoRLPbJ1un0C56/n8woI7KFsJis/IRYt
         AGDM9X8s3EFyQRBqk7wtiB9USaHwtT3OGHdTYHTYXtt0UeVIM96SboZdX+CO89u9La2X
         v/ig==
X-Gm-Message-State: AFqh2kr4vqIr8LXSNlbcyOL1ZyR0FAGBDK3xo6/UT8oXC1h9PpKPPN93
	XgMxlr5+dulpho5VvFoiqAM=
X-Google-Smtp-Source: AMrXdXtuN0RIsc1WUKsvMqiXT2wJ8ek7cKBs0wr4YvLcqoAs/rB8afxJD26wQwSit4uctEKSHs+XlQ==
X-Received: by 2002:a17:907:cc98:b0:870:8300:a0a5 with SMTP id up24-20020a170907cc9800b008708300a0a5mr253735ejc.0.1673813973839;
        Sun, 15 Jan 2023 12:19:33 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id s1-20020aa7c541000000b00495c3573b36sm10738407edr.32.2023.01.15.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 12:19:33 -0800 (PST)
Date: Sun, 15 Jan 2023 21:19:31 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Rename bDynamicTxHig..,
 bDynamicTxL.. and bLastDTPF..
Message-ID: <585a76cf4d2c805eada805c18c18ef207b9a4ea4.1673812849.git.philipp.g.hortmann@gmail.com>
References: <cover.1673812849.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1673812849.git.philipp.g.hortmann@gmail.com>

Rename variable bDynamicTxHighPower to dynamic_tx_high_pwr,
bDynamicTxLowPower to dynamic_tx_low_pwr and bLastDTPFlag_High to
last_dtp_flag_high to avoid CamelCase which is not accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  4 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  |  6 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 34 +++++++++----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
index 1672a3fea13c..2c1a4392aeff 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_rtl8256.c
@@ -150,7 +150,7 @@ void rtl92e_set_cck_tx_power(struct net_device *dev, u8 powerlevel)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	TxAGC = powerlevel;
-	if (priv->bDynamicTxLowPower) {
+	if (priv->dynamic_tx_low_pwr) {
 		if (priv->CustomerID == RT_CID_819x_Netcore)
 			TxAGC = 0x22;
 		else
@@ -198,7 +198,7 @@ void rtl92e_set_ofdm_tx_power(struct net_device *dev, u8 powerlevel)
 			priv->pwr_track = writeVal_tmp;
 		}
 
-		if (priv->bDynamicTxHighPower)
+		if (priv->dynamic_tx_high_pwr)
 			writeVal = 0x03030303;
 		else
 			writeVal = (byte3 << 24) | (byte2 << 16) |
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index ad34bef5660c..1f8bfe83b8ef 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -480,9 +480,9 @@ struct r8192_priv {
 	s8		RF_C_TxPwDiff;
 	u8 antenna_tx_pwr_diff[3];
 
-	bool		bDynamicTxHighPower;
-	bool		bDynamicTxLowPower;
-	bool		bLastDTPFlag_High;
+	bool		dynamic_tx_high_pwr;
+	bool		dynamic_tx_low_pwr;
+	bool		last_dtp_flag_high;
 	bool		bLastDTPFlag_Low;
 
 	u8		rfa_txpowertrackingindex;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 6d3c9491d070..09ea3a6f373c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -2271,10 +2271,10 @@ static void _rtl92e_dm_init_dynamic_tx_power(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	priv->rtllib->bdynamic_txpower_enable = true;
-	priv->bLastDTPFlag_High = false;
+	priv->last_dtp_flag_high = false;
 	priv->bLastDTPFlag_Low = false;
-	priv->bDynamicTxHighPower = false;
-	priv->bDynamicTxLowPower = false;
+	priv->dynamic_tx_high_pwr = false;
+	priv->dynamic_tx_low_pwr = false;
 }
 
 static void _rtl92e_dm_dynamic_tx_power(struct net_device *dev)
@@ -2284,8 +2284,8 @@ static void _rtl92e_dm_dynamic_tx_power(struct net_device *dev)
 	unsigned int txlowpower_threshold = 0;
 
 	if (!priv->rtllib->bdynamic_txpower_enable) {
-		priv->bDynamicTxHighPower = false;
-		priv->bDynamicTxLowPower = false;
+		priv->dynamic_tx_high_pwr = false;
+		priv->dynamic_tx_low_pwr = false;
 		return;
 	}
 	if ((priv->rtllib->ht_info->IOTPeer == HT_IOT_PEER_ATHEROS) &&
@@ -2299,28 +2299,28 @@ static void _rtl92e_dm_dynamic_tx_power(struct net_device *dev)
 
 	if (priv->rtllib->state == RTLLIB_LINKED) {
 		if (priv->undecorated_smoothed_pwdb >= txhipower_threshold) {
-			priv->bDynamicTxHighPower = true;
-			priv->bDynamicTxLowPower = false;
+			priv->dynamic_tx_high_pwr = true;
+			priv->dynamic_tx_low_pwr = false;
 		} else {
 			if (priv->undecorated_smoothed_pwdb <
-			    txlowpower_threshold && priv->bDynamicTxHighPower)
-				priv->bDynamicTxHighPower = false;
+			    txlowpower_threshold && priv->dynamic_tx_high_pwr)
+				priv->dynamic_tx_high_pwr = false;
 			if (priv->undecorated_smoothed_pwdb < 35)
-				priv->bDynamicTxLowPower = true;
+				priv->dynamic_tx_low_pwr = true;
 			else if (priv->undecorated_smoothed_pwdb >= 40)
-				priv->bDynamicTxLowPower = false;
+				priv->dynamic_tx_low_pwr = false;
 		}
 	} else {
-		priv->bDynamicTxHighPower = false;
-		priv->bDynamicTxLowPower = false;
+		priv->dynamic_tx_high_pwr = false;
+		priv->dynamic_tx_low_pwr = false;
 	}
 
-	if ((priv->bDynamicTxHighPower != priv->bLastDTPFlag_High) ||
-	    (priv->bDynamicTxLowPower != priv->bLastDTPFlag_Low)) {
+	if ((priv->dynamic_tx_high_pwr != priv->last_dtp_flag_high) ||
+	    (priv->dynamic_tx_low_pwr != priv->bLastDTPFlag_Low)) {
 		rtl92e_set_tx_power(dev, priv->rtllib->current_network.channel);
 	}
-	priv->bLastDTPFlag_High = priv->bDynamicTxHighPower;
-	priv->bLastDTPFlag_Low = priv->bDynamicTxLowPower;
+	priv->last_dtp_flag_high = priv->dynamic_tx_high_pwr;
+	priv->bLastDTPFlag_Low = priv->dynamic_tx_low_pwr;
 
 }
 
-- 
2.39.0

