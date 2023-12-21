Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D36156CB
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="X5h46tCX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IVkcvXIW"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id DB3F03200A14;
	Wed, 20 Dec 2023 22:12:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 20 Dec 2023 22:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1703128355; x=
	1703214755; bh=9jw6b4ctxOb/8uYJBFa5pYNQkgdRK6UDuv41VJI8kCA=; b=X
	5h46tCXA7FigPdelNRDUPT4s3UM/j6qfz+DUgs4NzqvsFUjyvvIYzBnDuze6QtU1
	vqLPOYjiVQzjgPH8OaSEIytuXa4P9fPMO01Lhe/jP6Ixdv7Tzcvt/ZtZpGvuqb+B
	3aEIwZri5UrjlSGxzU4AUrcdKDgguKtb7agUbgi4e0W+WEYRVqEXjMIDgHyq1ihf
	LYF2oD1eRx081I8SpIE4h5QIxeNEXA65TrRWcyXkJs2/HNsQfK0SyZ6bQ+q3ds9a
	DPYU6CAzb08PcB5nauIFA6PYb6BB0oGM6okCARnLoY1Hv1m1jo5weENss9MKtswq
	Z/O0QLgWzS9V96Rh/mAIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703128355; x=
	1703214755; bh=9jw6b4ctxOb/8uYJBFa5pYNQkgdRK6UDuv41VJI8kCA=; b=I
	VkcvXIWU/5xkKBJhsTGM8v//TDmvMoa19Rg68pxYnARBimOWuTOrfG/mwXWJ+i8q
	gwv93A3rc15df45h5hpkJfUnH62fK7ZhBTQUd1ZAElZk0K5EBaIvsA99yr0cr5DP
	0DAd7OkCy6fwXmnKsSyHW1GmbTSC+nnQMjFtGc9szmytL53YC+biSL7CgcWSFNKt
	3UN622QXR5UeTXhSEnX81VExFmbrSHH1jy33pHZXuTTQgt6xSwP/39yEeZUfA1YK
	wipCbO+LkrIw29z1DqfC+pna68BGQygP/1gwD5r9pIcvaW9awCwQDt4OHQFNpvex
	bFtizjjCWotXIrAbQfVkg==
X-ME-Sender: <xms:I62DZQ0hOdOL1x36Bd3hwl-tgo-XjdMjGOx-kS0Zloo69Fc9c5Go8A>
    <xme:I62DZbHc9kjMWJ7-iYAesN9qWG8Ah-OBS7Vb8Z8gFkHtF3BdUkM-qzvI3bli-Rhqa
    MWByzAswVOWX2wieSI>
X-ME-Received: <xmr:I62DZY5V78PCHa8bldurrAQcydJwNpNsgKbACZV7LfV-RzQCA5uCRhPd6OYYDTlrEVDtEQpzT8k4dsdzhVA3VTba-zlgQF0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepvdevtdeigfduvd
    euhefguddutdeijedtvdejvdevvdfgvdetudehvefhhefgieeknecuffhomhgrihhnpegs
    shhshhhtrdgsugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehgrghrhihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:I62DZZ1tkLsWI43WvNkcphYk5uAQoYGpkp6gqMBYqFVo3p3MqV4j8A>
    <xmx:I62DZTF--Q0x9sIJH3lmZ1ayTP74EDd0xnGRjsZwm8sDa7EuvzAchQ>
    <xmx:I62DZS9drW6mzJmO4L3UEypqSIU4zPLNLv1NGsl6ZGlfY4209c3fxA>
    <xmx:I62DZZOvuledyrLoHAsTWu4Vvqn7uWOK_DnE-547rniHqvqx-spSfw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:34 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 2/5] staging: rtl8192e: rename variable HTResetSelfAndSavePeerSetting
Date: Wed, 20 Dec 2023 22:12:56 -0500
Message-ID: <20231221031259.14853-3-garyrookard@fastmail.org>
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
rename it.
HTResetSelfAndSavePeerSetting -> ht_reset_self_and_save_peer_setting

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index edfc2c7461ee..a32f3553df93 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -558,7 +558,7 @@ void ht_initialize_bss_desc(struct bss_ht *pBssHT)
 	pBssHT->rt2rt_ht_mode = (enum rt_ht_capability)0;
 }
 
-void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
+void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 				   struct rtllib_network *pNetwork)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 193b4a5a7c04..78eae7daa351 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1759,7 +1759,7 @@ void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 void ht_on_assoc_rsp(struct rtllib_device *ieee);
 void ht_initialize_ht_info(struct rtllib_device *ieee);
 void ht_initialize_bss_desc(struct bss_ht *pBssHT);
-void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
+void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 				   struct rtllib_network *pNetwork);
 void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 				     struct rtllib_network *pNetwork);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9c94c5ceccd5..14f34e6a591a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1219,7 +1219,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				ieee->AsocRetryCount = 0;
 				if ((ieee->current_network.qos_data.supported == 1) &&
 				    ieee->current_network.bssht.bd_support_ht)
-					HTResetSelfAndSavePeerSetting(ieee,
+					ht_reset_self_and_save_peer_setting(ieee,
 						 &(ieee->current_network));
 				else
 					ieee->ht_info->current_ht_support = false;
-- 
2.43.0

