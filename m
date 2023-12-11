Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADCE180
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="JHP2Q3w/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S6b20Ogz"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 401433200A94;
	Sun, 10 Dec 2023 19:13:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 10 Dec 2023 19:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702253607; x=
	1702340007; bh=l9+VzySB0gw0n5S4jmMdo5qskQsKDEUo0nDqFjjTHyc=; b=J
	HP2Q3w/pu/VgtJUahD5j5cdG0DFwXJSQEYcAx9nUdg7NPrkeJOkQFEfcrJ3RlxQN
	xmZDgpbTe7HbWWi9Yv5XR2E04WMasIr1evzokfgyGvf4XrdhHkl+pNYkqaH3ixmO
	WzCh7pM/8sxoSkndx7zHpKuuVE7xU9OqReHPeU5Z9905ggOKSY9aXhg4sjeRwiUW
	euRx1L4yS8cIJBA7BF0bgr60Ms5Fd032H13S3ba3aetxHMAIAsSukW/C3T/aD9Up
	W7iPw9IV7WDvseHYpLnwWSvoNuUFBfiLo0eEjNExxRZLr4foggyjjRYB49/FDGYi
	l5zKsFt+PCPZ2UDz2hT+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702253607; x=
	1702340007; bh=l9+VzySB0gw0n5S4jmMdo5qskQsKDEUo0nDqFjjTHyc=; b=S
	6b20OgzwU+j+agz7yFzjviG5ZSi3MqhotdY+poREKpRJUceosPDYGfhsEcHZHHjl
	cK2Jdp/Y+a60gFrBm6z9xR2lHjoZMkXmso1qd05Svp1L9MH/wcrQpBm8ctAP+SG0
	xvkBHMFqRKP0sqgoyhbjGxxUI1JKP+44PxvA3ilPwxdNlAcv2+6cr3BiCvwqO0ME
	0Y9hTEhuFHsIzXdRJHtFGWbE/tMUu5/XLOeYZKn3tZ0zM2IIuJdn/WUZJWbUz/FL
	iymAmQRpyyqPLnX3hFfwEYMOE6J7syAH6vhWNYegjf25R+Oe6duQdFnwCjEiIX5Y
	gX5KVmpzwuw6AV3iylxeQ==
X-ME-Sender: <xms:J1R2ZakoXDB386SSI1u6IygvnL1qr9y3c2mwMNb4WqMCa4q6ne6_KA>
    <xme:J1R2ZR1Ch7XP-Fr2ylKcAdRHIqmuK_cOx3B8pbTCTupRq3-Ib86i3aFEmO8_nBgVz
    U7eOKoOwWWnV2gzN-o>
X-ME-Received: <xmr:J1R2ZYqMGeDIuLKF_GMwPsd6iC0FQ1cnYUzOqEH4u1LFO64-3utd70HIuU7MXDHOqxFVwjyXgII-5CGXwS_YJ0B_wg1vgzoWfBNvwxb3dis>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:J1R2Zek-QN9TPyczoW_8gwrXPSyESn86Zm1t4RCHcWdzclt4hRsC8A>
    <xmx:J1R2ZY3j7w8SPRgSJYV8N8A1Fgv7R13AtBUu3KJD6838enyBqS42NA>
    <xmx:J1R2ZVstd9zhLf4mG-0BtINyysD3qGCnIvRMoQR0hgI7PvY779rDyQ>
    <xmx:J1R2ZVzDV2lWY8fmuCWiHbHZtMb3xySQVkDvXN75XEeI2uUtqd7S-A>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Dec 2023 19:13:27 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: rename variable HTConstructRT2RTAggElement
Date: Sun, 10 Dec 2023 19:13:34 -0500
Message-ID: <20231211001335.26169-5-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211001335.26169-1-garyrookard@fastmail.org>
References: <20231211001335.26169-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. HTConstructRT2RTAggElement -> ht_construct_rt2rt_agg_element

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index c2c7fc316f62..a374f4c9f17e 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -328,7 +328,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *posHTCap,
 	}
 }
 
-void HTConstructRT2RTAggElement(struct rtllib_device *ieee, u8 *posRT2RTAgg,
+void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee, u8 *posRT2RTAgg,
 				u8 *len)
 {
 	if (!posRT2RTAgg) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ff3ba9bca023..0d6144548c34 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1758,7 +1758,7 @@ void ht_update_default_setting(struct rtllib_device *ieee);
 void ht_construct_capability_element(struct rtllib_device *ieee,
 				  u8 *posHTCap, u8 *len,
 				  u8 isEncrypt, bool bAssoc);
-void HTConstructRT2RTAggElement(struct rtllib_device *ieee,
+void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void HTOnAssocRsp(struct rtllib_device *ieee);
 void HTInitializeHTInfo(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9e9725ed8fa0..31a072e2a6d7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -739,7 +739,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 			realtek_ie_buf = ieee->ht_info->sz_rt2rt_agg_buf;
 			realtek_ie_len =
 				 sizeof(ieee->ht_info->sz_rt2rt_agg_buf);
-			HTConstructRT2RTAggElement(ieee, realtek_ie_buf,
+			ht_construct_rt2rt_agg_element(ieee, realtek_ie_buf,
 						   &realtek_ie_len);
 		}
 	}
-- 
2.41.0

