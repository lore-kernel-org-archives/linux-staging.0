Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C48E180
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 00:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="IMQQZA+N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UaJF/M0C"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 7AB523200A49;
	Sun, 10 Dec 2023 19:13:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 10 Dec 2023 19:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702253610; x=
	1702340010; bh=Bmw/wp7j+cPK5IuVvd2b+9dGsZdJqyjeSb9WLoFcNEU=; b=I
	MQQZA+NxAw8AiC89aWIutdFP8t4Mg4gh5lTjw/2VacReOCzHpaoTmFc6qPso/q7w
	FMHkzET+lQwYCNpYvDNdVqdWs8v7opJ5iMXYxnogacl4HqqOVTU3rb/E+0Ha1UO2
	twyXbmh3Ct19jGD9bk9/K3jJ0KWumlv3DAg693ZFiaVrq1VQikr+HdZpGJrU1L9V
	foQWz3JTifnhQA8k7meoAOg00KwRXIE44rXMFAGrVNbUr9rWQv0xqooR8p1eYYYU
	XK+T6zmw9YrnFvk5k/iM4qJMrRMhNhvlid1bF2VfWcO8TN+k9P9S1iDjrHwfZcy6
	Xw1D7krZhUHwDgqFQRW/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702253610; x=
	1702340010; bh=Bmw/wp7j+cPK5IuVvd2b+9dGsZdJqyjeSb9WLoFcNEU=; b=U
	aJF/M0C2s1Wiyd4dTnKDPsCjG+5azGtgLC/OMPxZnH8wXV7y3c1Lb0pgkZMoiXeJ
	LJnG3wYvk2X53Rwh+4Ax+WMHz0fxFLDGhQfuiBX3sP4DGK7AviNb0WGfc9/GLdsZ
	VTL4TKAniyk8tTiOc5FSfhF5yuYj0u+lqhFCKGhzB5/yJPKFsABIsYTH23Q4vREi
	Y+HfeNVgfRT4pzLHIO2oUJF0B6uKnmq6MftvXtiqhd2U6GEJpTJseXrb8R777kI1
	lTLOCGxjR8SV8OFGNBcke/TJxF/uo5MN87gwxyvutOk1z2F8KI6/vh/q8y31ss6l
	12H9yPVFAZuMoFQ9hrmzw==
X-ME-Sender: <xms:KlR2ZbkPSR-qSPFVaWB1t32rpwDGMuu4ji7xA3BiEa6XInJvCqL7_A>
    <xme:KlR2Ze0DviqxlM-XR1JT-31-BFmjqvEBVt4XOhPZZrCYaWMa5iPPfzi4N_55pZz8v
    FjugxebrmW1RezKK_Q>
X-ME-Received: <xmr:KlR2ZRrySgbiQ13-oKEXjpNbwnZ50xtZA7JJ8ZyNsUp6PbAIWm-QhMj_iCdXagd15ObPxXOCUXngy5auMMPeS5rI6NSBQAbv2GD8hsbsamE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:KlR2ZTndRwRgUuTBiR8pJEJbKSBRuIofWIXxq5FJF2I-sl7kO5A2bg>
    <xmx:KlR2ZZ0rKv6LNIy_aAwnVTQu4CXxWsHs12PMoUnRZ1ja9CyIV-vXRQ>
    <xmx:KlR2ZSs8xvZcuVvpC3g118KfhcNvcvb97eiI019Ut_Eep6d2RVJegw>
    <xmx:KlR2ZSzcyzsTBbgPOjcmxHsaBCzVk38imRS6UrsSGhzDwXNI0qjYaA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Dec 2023 19:13:30 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 5/5] staging: rtl8192e: rename variable HT_PickMCSRate
Date: Sun, 10 Dec 2023 19:13:35 -0500
Message-ID: <20231211001335.26169-6-garyrookard@fastmail.org>
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
rename it. HT_PickMCSRate -> ht_pick_mcs_rate

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index a374f4c9f17e..14e25f87c1bf 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -350,7 +350,7 @@ void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee, u8 *posRT2RTAgg,
 	*len = 6 + 2;
 }
 
-static u8 HT_PickMCSRate(struct rtllib_device *ieee, u8 *pOperateMCS)
+static u8 ht_pick_mcs_rate(struct rtllib_device *ieee, u8 *pOperateMCS)
 {
 	u8 i;
 
@@ -426,7 +426,7 @@ static u8 HTFilterMCSRate(struct rtllib_device *ieee, u8 *pSupportMCS,
 		pOperateMCS[i] = ieee->reg_dot11tx_ht_oper_rate_set[i] &
 				 pSupportMCS[i];
 
-	HT_PickMCSRate(ieee, pOperateMCS);
+	ht_pick_mcs_rate(ieee, pOperateMCS);
 
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
 		pOperateMCS[1] = 0;
-- 
2.41.0

