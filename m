Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F102208C
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="NuOed4Ry";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YeRV8tPv"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id AE0243201A89;
	Tue, 21 Nov 2023 13:10:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 21 Nov 2023 13:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590220; x=
	1700676620; bh=0Lp9mqeAz/6pwwL4dTxdUdXhfanY55hRrrW5uod0AVg=; b=N
	uOed4RycnVkahNz77foe0Uo8r3Q1LZafqpvHYgON/lEKXLX94lwmZp/Dt+NThZxl
	laPeKLYLSIapeBlxONDalwfRgZE6sHNMc/uAGN9QRtQf+HGWKjUTwy4zE4E1YO23
	kkqis7AM39y/2mz974uxuEoCKMW4+7Zt1l+Lz1Txd5fT3xKXiFKDhLDervPp9nwG
	BKic1+hfuxI1wm6FInaj+3vWFNg5JVrUcM+UowP+R0/GbWfv5xsoUsfLD18ISHkJ
	4O9gBUdE1M+JeYINipNyh5je376p0oQFntirlyI6fqrGQFodPrdinMw1LihYQYo0
	HnTkHAoh23VWeHXDzmImg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590220; x=
	1700676620; bh=0Lp9mqeAz/6pwwL4dTxdUdXhfanY55hRrrW5uod0AVg=; b=Y
	eRV8tPvhJFKOOj1LeD4yBa2ZMupRim79eggDXjf2+HhgbUlwUviy24pT4uoSbKuj
	p4T/CmUfV2zLMcmHNdbYPJLbgWg58ivPZbQPTvRUQZMFnx1bNmecgaK/MzMuHTw6
	iehnEOwyyQ0FV1Tdta8BJCA8MRRVTmbbQafm1BZUpACEC2NfVEBRwzKd5b0iO5kg
	yKgeR295h+nmDqQOgYsUlI4xannA/Jk9Tnkldr/0DKanlsNHPj7CTpwdcV6Aoedn
	JQSddMa5B+/7UiVUBaCu+cVY7MUr5crFeILraswexHepGKG6QTeMJzcyaXytVrUX
	VvtJSt1kODVGBxl66yC3g==
X-ME-Sender: <xms:jPJcZRyewDmxwgZyyRU9tU7sWYb0Syrau4ifdaHy4xHI5HH5uQ81JQ>
    <xme:jPJcZRSW1vaVjqq3pg1efdqXuv1_8q6tQFV19MK6dxZQmweSySDpJVttO23X-OnlR
    z9flNrIT0Fi_yhGQds>
X-ME-Received: <xmr:jPJcZbU2BI7c-GerC5mxrPAJyRI0YrSvI1J2k-spsTvaD5kfxqp2AtCtcO7LDbE4YRhTN1VuHiSiVtdNHuJkuh7RSmfvHsC3C66NM2_gVZV2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:jPJcZThVseqZLWE2IQv8xMeRL0l5VuOhd99Xuh5rZt2HeUHuXGVDRA>
    <xmx:jPJcZTBd9Zvm9JsshLNDNDraX_2sSIUvsEH4v1C-VHEweX3N6NxrPQ>
    <xmx:jPJcZcJpWOL-4W2ICboRC_H09iB0TX-aGmcUYQ9mYy9VDw4jJ9jRbQ>
    <xmx:jPJcZaOFx8PaPo6wHrL86O1qJ-mdEE75tUFdwAvdK5EOgDtcki3Dcw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:10:19 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoudation.org,
	philipp.g.hortman@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 5/5] staging: rtl8192e: renamed variable HTIOTActIsMgntUseCCK6M
Date: Tue, 21 Nov 2023 13:09:47 -0500
Message-ID: <20231121180947.9223-6-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121180947.9223-1-garyrookard@fastmail.org>
References: <20231121180947.9223-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed from Pascal/CamelCase to Snake case the variable
HTIOTActIsMgntUseCCK6M.
HTIOTActIsMgntUseCCK6M -> ht_iot_act_is_mgnt_use_cck_6m

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0873c19ca051..f43249fd78d7 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,7 +207,7 @@ static void ht_iot_peer_determine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static u8 HTIOTActIsMgntUseCCK6M(struct rtllib_device *ieee,
+static u8 ht_iot_act_is_mgnt_use_cck_6m(struct rtllib_device *ieee,
 				 struct rtllib_network *network)
 {
 	u8	retValue = 0;
@@ -675,7 +675,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		ht_iot_peer_determine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsMgntUseCCK6M(ieee, pNetwork);
+		bIOTAction = ht_iot_act_is_mgnt_use_cck_6m(ieee, pNetwork);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_MGNT_USE_CCK_6M;
 		bIOTAction = HTIOTActIsCCDFsync(ieee);
-- 
2.41.0

