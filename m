Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB610E3
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 00:24:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id C761632002D8;
	Wed, 27 Sep 2023 20:24:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 27 Sep 2023 20:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1695860678; x=1695947078; bh=UZsdvMhzyA
	6QvPkUPhas+SEiSuLod/Pr9jY7SWB1/7Y=; b=iGaFaHDk3j+Q1lqh6df3AG0wSw
	lRRLbyEzonfxTo/IjcCIN0mu6Y0XWcObg+L6eQK+KHbjCNkh+XYGB2zN5aPtgHP6
	NAgsgBt8Wfv6sputjVwEIVM42mY2Qcoi+RGqMhVrza8JFpnT7CxM6qE4rziTufwq
	tqi59u4g4FLS8O8mTyNR1r9N3lLwoM8Id0qCIgghqsT2z2qrM1MugheCxGTnxuhV
	JsbJuh4eBS2yGzhoAS6ns5fTxL6FrzMexorY7vMZJZjKyBeBYwLS9IrEQNqqyBrc
	MhYtPydIC7xt7PCTDkZnZ3QQE3S/6W+6CoXabRI3SE5hVEaLwDsAfVN1+YYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695860678; x=1695947078; bh=UZsdvMhzyA6Qv
	PkUPhas+SEiSuLod/Pr9jY7SWB1/7Y=; b=bRXrvbKBMp2Iq0phBBtZ1CclS7M3b
	zOutbjqZ2XXPs02lPFScyNeWD/a3B87W7W4kvzcHV/Tdaa6I7oqCuchYkt6tp10y
	FZ0KnKQFKCIEYSxqpqALA+VmYp3RtL4sY3vsVUZdReOAghuZRyYcjglSJHMF5c0P
	eXwVVgJ/BM7G8IMNMVYSOspVagr4dAlHe98p8I+eHcRhpd4kHxD76t50ChKKFsNX
	8cY+CqTn8KIXQpJQyYz7kSvhVKoZ79b1Al80XGKh8BNHAakxJVJrIDxUOdrSVSUg
	Gy5J3Kb2sqCO+C/0jpt0bGxYGNZQn+uJX46Qd+B1ywNBaa9odiczC/Uaw==
X-ME-Sender: <xms:xscUZeEJV4_jc2o8PsXAGJCve-iVuf6mNhUC6SeLX2nNQWxX4FNaKg>
    <xme:xscUZfV2UbyZEs0tY_MzRzwbcrkR0B3tbQmjiMfaeEWqCjfulyVzAmxy26BBbU0gz
    3tB3iMjJRt1jGNcBZs>
X-ME-Received: <xmr:xscUZYIczHZj4ypUpeZ26R0makL3cSI96cj7ffXPGosaxEGSJbaqtsn6B7kYekhRc5tepCf0VBS5SEM1LJH_g-2Ki6OumS-xygYk6tpqeko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdehgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghruges
    fhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhjeegje
    ehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsth
    hmrghilhdrohhrgh
X-ME-Proxy: <xmx:xscUZYFbQD9ExpUy-p487SelNpwBrhYmUz9N9klK1E0Iou7AxmS1uw>
    <xmx:xscUZUWgzDWc4xSSUgAy-T3atpssEefmEnQfzRt2QNQFLI0DSOWLMQ>
    <xmx:xscUZbPXoNYVQ9pZdA6jDkwWPIkidhPXNE69CXAiOEARIonmwsl-oQ>
    <xmx:xscUZRiRr8j45bLExy8DdmYaLxZvBHapUHeeTRZDm9YcoTGfY39-7A>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Sep 2023 20:24:37 -0400 (EDT)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH] staging: rtl8192u: ieee80211: renamed (3) variables
Date: Wed, 27 Sep 2023 20:23:56 -0400
Message-ID: <20230928002356.28607-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames the variable in staging/rtl8192u
HTUpdateDefaultSetting -> ht_update_default_setting
in (3) files of staging/rtl8219u
1) ieee80211.h
2) ieee80211_module.c
3) rtl819x_HtProc.c

Linux Kernel coding Style "cleanup", no change in runtime,
staging/rtl8192u builds before and after.

Signed-off-on: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h        | 2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_module.c | 2 +-
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 694d1b18f81c..4e598c7f0d31 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -2293,7 +2293,7 @@ void HTDebugHTInfo(u8 *InfoIE, u8 *TitleString);
 
 void HTSetConnectBwMode(struct ieee80211_device *ieee,
 			enum ht_channel_width Bandwidth, enum ht_extension_chan_offset Offset);
-void HTUpdateDefaultSetting(struct ieee80211_device *ieee);
+void ht_update_default_setting(struct ieee80211_device *ieee);
 void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap,
 				  u8 *len, u8 isEncrypt);
 void HTConstructInfoElement(struct ieee80211_device *ieee, u8 *posHTInfo,
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
index 3f93939bc4ee..6f6813899e31 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
@@ -146,7 +146,7 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
 		ieee80211_networks_free(ieee);
 		goto failed;
 	}
-	HTUpdateDefaultSetting(ieee);
+	ht_update_default_setting(ieee);
 	HTInitializeHTInfo(ieee); /* may move to other place. */
 	TSInitialize(ieee);
 
diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index a93f09033d9d..cf9400859700 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -56,7 +56,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
  *  return:  none
  *  notice:  These value need be modified if any changes.
  */
-void HTUpdateDefaultSetting(struct ieee80211_device *ieee)
+void ht_update_default_setting(struct ieee80211_device *ieee)
 {
 	PRT_HIGH_THROUGHPUT	pHTInfo = ieee->pHTInfo;
 	//const typeof( ((struct ieee80211_device *)0)->pHTInfo ) *__mptr = &pHTInfo;
-- 
2.41.0

