Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C35154A8
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="i3xG86Cw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1CBqYs/H"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 869A032002FB;
	Wed, 20 Dec 2023 22:12:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 Dec 2023 22:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1703128351; x=
	1703214751; bh=eLwhieIwWiEuq+3M/i7XeeaQWFp+cT7u7PxwVjCwPro=; b=i
	3xG86CwT6k/nZBgyt2IOCPEEKqFRawb+aVrTeYTN2TBhUOBTXEZ+ONFnQpRpQ/HC
	TM3SYw2J4wK/2yNuOtf2jgOqoOe2Sk6ZdUAjyOB1rufAxMvnWv6gOjtDyrieVKQg
	W1KLnAyR325JIeER5xJHZ8bO2W5t6GsgZi2iGVTbNC3OKa68dFjRfiA13BycfSp5
	ogX+WnkorlrdsnqmEDH9dOuqJT0tiwZP1qPwyGqG1WhWWn0HptTaro6DZS3DHGvg
	V/EjcaDOlGuUpFVtyYXZlFuy1f3Xaig9ZSNofee7UzWU0lxMYCo+sptYpp8T6V7s
	J3UGloG85NewG8ZXLiloA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703128351; x=
	1703214751; bh=eLwhieIwWiEuq+3M/i7XeeaQWFp+cT7u7PxwVjCwPro=; b=1
	CBqYs/HpA5M7seGrzQ3MBBmqzrylPEwf9QP+HA65UStj2Pg4uopmiEwZjRuTx54R
	LumdW4x3YnUTQ72kekeqcZ0keWWoMpWM66/lNq6U8eeVT7ThLh3TbxI0VU/0eGq5
	D0yCiyzzLaW6I32VqpaVywquV/yyEOkag1Ap3nbNzLpnGkhjfkyqmd/OwIKXOm+N
	YsGcewGgD9WFvY0kCmKpxBZv3uTzEdOr4mnCVktOh9QJenowkPXLQv5nLctmOAZE
	4mFrL4GBhsc4ez0k/wM0sbpjF/pbQOWMAd+VSE5/cQjVqOgDnZIktk/cwFsgDk6y
	Th7XA7sD7WygpuGNFNKog==
X-ME-Sender: <xms:Hq2DZQVaLnnQbCZKQWfsQrtrlRnFtsotNWQUhAoiXIJfipDBM0mguA>
    <xme:Hq2DZUnuLtgWe-HPxTXzO1IeGBrzM5e6oFlLPY4FLWNDM2HRPkXwcIlzOR3_ZfsFW
    IEHSNVALg8o7dscp7k>
X-ME-Received: <xmr:Hq2DZUZjvSYXzr5cOr0Ss84HE6nFkseMWiQ-doQVYTeSsAPC7hLVDfysgXLQWFB9nb-nudaAVkVAG5qyh001tk7K4QWP7-Z_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:Hq2DZfWUPyNMnmQvwi76C5eBa-ZcWNSK-EjWlymccT64r5TD2CJ7DQ>
    <xmx:Hq2DZalOBiaty57iBnR7Lyy1UuIlZoVw5vAXkPL5sUbAzLkDGU2Kuw>
    <xmx:Hq2DZUfwDW5zkmnloRqtsLsg5mUMXQcj5-S8jPrT0V9M6UVGA_On3A>
    <xmx:H62DZetpdtZBs5X7KzSu3XSDAITDqjAqJEzXYK3Vf6JUNiuNNB9Zww>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:30 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 1/5] staging: rtl8192e: rename variable HTInitializeBssDesc
Date: Wed, 20 Dec 2023 22:12:55 -0500
Message-ID: <20231221031259.14853-2-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221031259.14853-1-garyrookard@fastmail.org>
References: <20231221031259.14853-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. HTInitializeBssDesc -> ht_initialize_bss_desc

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0d57bcda33b4..edfc2c7461ee 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -543,7 +543,7 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	}
 }
 
-void HTInitializeBssDesc(struct bss_ht *pBssHT)
+void ht_initialize_bss_desc(struct bss_ht *pBssHT)
 {
 	pBssHT->bd_support_ht = false;
 	memset(pBssHT->bd_ht_cap_buf, 0, sizeof(pBssHT->bd_ht_cap_buf));
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4df46eae6aa8..193b4a5a7c04 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1758,7 +1758,7 @@ void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void ht_on_assoc_rsp(struct rtllib_device *ieee);
 void ht_initialize_ht_info(struct rtllib_device *ieee);
-void HTInitializeBssDesc(struct bss_ht *pBssHT);
+void ht_initialize_bss_desc(struct bss_ht *pBssHT);
 void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 				   struct rtllib_network *pNetwork);
 void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 196eacc7a768..5f219cfb65eb 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2189,7 +2189,7 @@ static inline int rtllib_network_init(
 	network->RSSI = stats->SignalStrength;
 	network->CountryIeLen = 0;
 	memset(network->CountryIeBuf, 0, MAX_IE_LEN);
-	HTInitializeBssDesc(&network->bssht);
+	ht_initialize_bss_desc(&network->bssht);
 	network->flags |= NETWORK_HAS_CCK;
 
 	network->wpa_ie_len = 0;
-- 
2.43.0

