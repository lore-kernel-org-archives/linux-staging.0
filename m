Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BC208BA
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 23:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="K1hJNlw+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VRCvVyJt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id BE4715C0262;
	Sat, 21 Oct 2023 19:30:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 21 Oct 2023 19:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1697931043; x=1698017443; bh=xUCXOZtuV+
	3zXD2yS1827uYhmDye2ImPv/9KZZO0QHk=; b=K1hJNlw+PT8sfdejfb2gRLlGE+
	wESILtUDOxGlrzMjZUMnnljgbwN+DhwcqqzzeO1F9566gUvJg9rmWHiX+lUJAzeb
	pc5Ju9h5PYBzZ4rQtP9Uprueet+kbZ9aMVLvo5PFPub1FMK0Na3sExPWHQIt+zov
	gnbhdaM9NLTADFYVCGXluq2BqlkbvpmxB81csm8ooPZ2QFmcNUv9+AqtrNJgDb1G
	bUoUJoEcKcrcXrNhxQk6eyjHQ3AbvIenCwvtK7loEUIVSHPcQbADVNrvxD0i4eTv
	rOpabPHZ4Czta1+Q6XHKH1YNNAixXBhuvjdhfHo4JT2RD+B0qGrlXtcwbHog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697931043; x=1698017443; bh=xUCXOZtuV+3zX
	D2yS1827uYhmDye2ImPv/9KZZO0QHk=; b=VRCvVyJt5O4CQGrdaBu/ioHUGU45Z
	4A9usLIkjyw5XWdfAk//bKQERfAkTNNpT/DVSTnRRR61WDBI8f3fCAIfaf8xgM3M
	wrXbLl9FaqyjED9gZ55BB6LmAubeRxn9TyzOg2wSjImt7tuRnVoYaMFZRyhcAtSZ
	1N/47bmc4LmYQAoJRjYvfwifzxN6spddsyqdg77hsKPzbc+EwENVvCz7qspgE/Py
	uhiAdI84eM2rorQNO+2nSiQaf9TcBCjGlD9R9Q/w4KdvGYafy5nCNfj0oblS/7Vf
	nx8/5fVBB3w7FxHc4gBBffsgLhp/anUKZUog5Z92vWmBPBpjvw+LVU5Qg==
X-ME-Sender: <xms:I180ZYb4ENLlopfh0ChUKrShBXX-X5nzESHVHfwBocl_jjAXNsZBkg>
    <xme:I180ZTZRAEhiraslFY8NrmgngfjxcE510KpL51DOqNdk0sONDWu5RO3O68wTWYP4P
    7PMWFEJHnUIOPNgfOQ>
X-ME-Received: <xmr:I180ZS9wQZoGGQSBQKnh27rEG2YlFxCrpiMzUpW4gyPDOigrMd-bsCMxUN8bqETdaWPcVzdpNej4ucEi6ZrmeYy53uz2LIFBMLr70ieRjtM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkedugddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhkrghruges
    fhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeelgefffffghefhjeegje
    ehiedvgfelfeehueeuteektdffiefhveelhfegvedvveenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsth
    hmrghilhdrohhrgh
X-ME-Proxy: <xmx:I180ZSpq3uqAFt4iu2kLnOR_knk7-ehuiJABtcrDTnXxdx4e1tmYlA>
    <xmx:I180ZTq0EFtJ7zOMiDiVP9YQmfvqXB5zRv1HR0qQoCFlMsiylXL4lQ>
    <xmx:I180ZQR1Z7rJ6DJnJap9YYoXYQWgYPtGrbWmQEcZ0xc98S19ltyzBw>
    <xmx:I180ZSX3P5SpVvAlmWMOd4bCqf4cEFz4tQxOzfrIFSYAI6LzIrB-lg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Oct 2023 19:30:42 -0400 (EDT)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH] staging: rtl8192e: renamed variable HTIOTActIsDisable
Date: Sat, 21 Oct 2023 19:29:57 -0400
Message-ID: <20231021232957.9815-1-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed from Pascal/CamelCase to Snake case the variable
HTIOTActIsDisable, HTIOTActIsDisable -> ht-iot_act_is_disable

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 8522a3594848..5dca97b07874 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,7 +207,7 @@ static void ht_iot_peer_determine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static u8 HTIOTActIsDisableMCS14(struct rtllib_device *ieee, u8 *PeerMacAddr)
+static u8 ht_iot_act_is_disable_mcs14(struct rtllib_device *ieee, u8 *PeerMacAddr)
 {
 	return 0;
 }
@@ -696,7 +696,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		ht_iot_peer_determine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsDisableMCS14(ieee, pNetwork->bssid);
+		bIOTAction = ht_iot_act_is_disable_mcs14(ieee, pNetwork->bssid);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS14;
 
-- 
2.41.0

