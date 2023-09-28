Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2AD46A5
	for <linux-staging@lists.linux.dev>; Thu, 28 Sep 2023 03:33:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 0E6E43200313;
	Wed, 27 Sep 2023 23:33:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 27 Sep 2023 23:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1695871982; x=1695958382; bh=wvlA+NEgSa
	40iZ8+dJx4biD+TYvPBRSKNWyvMlefuac=; b=X5w3FtffG3bQvaKagBeOs9cWaG
	3CtMrRGv7la0MAB2ZDODApjMNy/cHGZfCfdNSIvZM/djh+UTNpqh1y9jbtsisEe6
	XlJUaKukkRdN5MG3rpGMSJJ00PjZDhGxWzBmQMbXCmT2noAbNqlX77ZXczyyulkk
	8d/M8aqB40RxB8arqQcdtBIYl2UtueSlMdR46cuZCH3PU5wtSlYBHlKBmNTp/a+m
	k+4ibR8QqYkmLN36/jDEmQYg77Vwmh+ZnX4yPtGiDxT7aFsgaY8deHf0udWlTdJK
	TAJu4NOxPkH1BeEAStbNehbGQN0j5jIbT+o3Od3/mKDbkLBOYoiem5+V2vfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695871982; x=1695958382; bh=wvlA+NEgSa40i
	Z8+dJx4biD+TYvPBRSKNWyvMlefuac=; b=g3sY91I7aFuWCuhdFvz4XHc2CUMlY
	AmajZ0rshe/lcc9V4NsyxGlrj9u/ynE502bqGWJWmwJwXqu457nAmmml3pez1NsJ
	a0oEYih/VF4IiZ9tkjGdW7W2vCN9VCDOChtXZUvmSSPZ8L2jXvaxpEWWXbVHZEHa
	bpbjiQ4KTF9lrC7TVtEuCjwCZ5k+m+ZxEgUmEa67rEthUuL1PMOaYzA8aMmB5Ubo
	7Hu4rZ9Thc7nwXormjT7NcGLy+zfnSWbhp6uozcDjtjotTE2g5Oi5jEpjKuGas93
	Q07igr2hD2Db1Y/io0HPmme5EMoOwip4a195GhYq25TjP4lvfv4Xey3Sg==
X-ME-Sender: <xms:7vMUZRpg2uxVKJF6MhcNw5JIE5bu0zSwGfkVG9XpdCV5foQyRw7TzQ>
    <xme:7vMUZTpjQHf7PrhuX-Pgx8SHMb4nne9XnOzQGUTAFki9GufTKD-gJHmXXc7T29a25
    OdU_Oo7uwd0csRBVYM>
X-ME-Received: <xmr:7vMUZeOzaFymYV4LQBPBzF19tOQfaMO-Fuje0TXmKKPbcNwhHIOtgZego6n4mjRUEqKT9hvdWA7eWSrx5negfen8JNAVrSAEgk3K6LtV-yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdehgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghruges
    fhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhjeegje
    ehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsth
    hmrghilhdrohhrgh
X-ME-Proxy: <xmx:7vMUZc71WV4fk0eOas8G5JKZ-Lf85dQ-AQSTHdw6e4TY3Kqta6wGyw>
    <xmx:7vMUZQ6BUHlK9e8NoVJIOJGT_AMJaLVxKeOA-lbNqEAWTM55jjjh7A>
    <xmx:7vMUZUgjCJlOf0HUrGevUbVpnesjtzaEckykyrtzryX_sOuIwvl8XA>
    <xmx:7vMUZQFiWbkQifx3Hq5tmK-bwm-AsYlLhlrH5rpi7dkzG5TYeRCrhA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Sep 2023 23:33:02 -0400 (EDT)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v2] staging: rtl8192u: ieee80211: renamed duplicate variable
Date: Wed, 27 Sep 2023 23:32:20 -0400
Message-ID: <20230928033220.31783-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch renames a duplicate variable found in both rtl8192e and
rtl8192u causing the preprocesser/compiler to compile without error
when in fact it should throw an error/break the build.

Prototype in files:
rtl8192e/rtllib.h      remaining as ht_update_default_setting
rtl8192u/ieee80211/ieee80211.h   changed to __ht_update_default_setting

Function in files:
rtl8192e/rtl819x_HTProc.c remaining as ht_update_default_setting
rtl8192u/ieee80211/rtl819x_HTProc.c  changed to __ht_update_default_setting

Referenced in files:
staging/rtl8192e/rtllib_module.c  remaining as ht_update_default_setting
staging/rtl8192u/ieee80211_module.c changed to __ht_update_default_setting

Linux Kernel Coding Style "cleanup", no change in runtime,
staging/rtl8192e and rtl8192u compile/build before and after.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h        | 2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_module.c | 2 +-
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 4e598c7f0d31..ae2fb249eaa1 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -2293,7 +2293,7 @@ void HTDebugHTInfo(u8 *InfoIE, u8 *TitleString);
 
 void HTSetConnectBwMode(struct ieee80211_device *ieee,
 			enum ht_channel_width Bandwidth, enum ht_extension_chan_offset Offset);
-void ht_update_default_setting(struct ieee80211_device *ieee);
+void __ht_update_default_setting(struct ieee80211_device *ieee);
 void HTConstructCapabilityElement(struct ieee80211_device *ieee, u8 *posHTCap,
 				  u8 *len, u8 isEncrypt);
 void HTConstructInfoElement(struct ieee80211_device *ieee, u8 *posHTInfo,
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
index 6f6813899e31..f35765167e1b 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
@@ -146,7 +146,7 @@ struct net_device *alloc_ieee80211(int sizeof_priv)
 		ieee80211_networks_free(ieee);
 		goto failed;
 	}
-	ht_update_default_setting(ieee);
+	__ht_update_default_setting(ieee);
 	HTInitializeHTInfo(ieee); /* may move to other place. */
 	TSInitialize(ieee);
 
diff --git a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
index cf9400859700..d5354147e7ae 100644
--- a/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c
@@ -56,7 +56,7 @@ static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
  *  return:  none
  *  notice:  These value need be modified if any changes.
  */
-void ht_update_default_setting(struct ieee80211_device *ieee)
+void __ht_update_default_setting(struct ieee80211_device *ieee)
 {
 	PRT_HIGH_THROUGHPUT	pHTInfo = ieee->pHTInfo;
 	//const typeof( ((struct ieee80211_device *)0)->pHTInfo ) *__mptr = &pHTInfo;
-- 
2.41.0

