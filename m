Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331722EF3
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="MQtI/AN/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uGhkX2Iz"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B5A233200A9C;
	Thu, 23 Nov 2023 09:45:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 23 Nov 2023 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700750708; x=
	1700837108; bh=tAugLoT/cPPoDO0Am/a0BT8u3Z35YCoGxKsBr3EXnro=; b=M
	QtI/AN/OWFiH6tb7WLOTkYq2+aUox/YLpAaGreo3QXK83UmUbsJoBiFHx3sa2HDX
	posoADBbrUE8qmSYugyYRh2L9cMcmkRhkSILa6HKDaUGaqVcQmAo3fucLcSNApAt
	JxExn15ZkrWhwv3ImYK3YP0nhO98Ujy4M1rMw/fvVFe5JEBZU1h3CuyUwPy+co/n
	XUbxMXFRSC7dmxnuuo+y3YLdkdRmiGG5bIJcA1bN4KDp9cyd+K/Jhnt1QluMOkHV
	mo45OeABQ2DwvKUdfTbt1WYwezFvUHKdznD8+c82P8SprU+n0cPSFIevDgf7eUIt
	pTWfxfELfozEPXpY/rwOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700750708; x=
	1700837108; bh=tAugLoT/cPPoDO0Am/a0BT8u3Z35YCoGxKsBr3EXnro=; b=u
	GhkX2IzPqAziu5NrED4YvksIa8Fa0q8lHWf5LdQfI3cIeViAkvHnTN2Q1ne1w8Cs
	NX4ik4/js08HYBVIBc2+Cafhjsjlds12/+pgf3pIMKr30xxrHMjjGkDSiJiWUeNC
	gKSfEoQPLAEzHlrV5boTPWgXns40FSxEz6EX4s4X9ZWiT3eU85Q6Z0kAsXfpqe4v
	yHl1IKmUMxGuvPuWdj448cpYVmcBkUs5sLDgfxmBUb9argPEBpFBIxoWnHsu4/+x
	u5X1qMtLmPLwAxRq5U6Un81rTuvA7gMtWRJCHFuABMCSVmhy+QuwBBk9QOF6fPp2
	hwjGJ2dCyQaVxSvDuN22g==
X-ME-Sender: <xms:dGVfZfEa11BARTv6ZiHRB3lxn2t9t9fGaC4bBvgrMOZ_iZnzdgoXRQ>
    <xme:dGVfZcUa7cnz7EHm4Gva_QATpuyPxlFs3kM_8fm2fIVbonvVWhhr56bZnTP0FeYS8
    hiS7p5UrxpB8f5E-5s>
X-ME-Received: <xmr:dGVfZRK8_Xqhc60T2vXivCj7yFrWU7gqF5TUGzgBkA4VqSDt0xzuCKL3BLFnGunMPsMSLHladG_aUt6DKmFvyjfNU2ZSDj1KL03JwCqtGcVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:dGVfZdGrfJb5hldhQ1USQVQPajALpOMp8g735F-El4iGkMK3e4eL6A>
    <xmx:dGVfZVWyYvQQFZuJaCnQiZiVKW76syjy4evYLE-JUtFLnqa4qJzGEw>
    <xmx:dGVfZYPogFccJutwfSLNFZnn9K7-qO4ECdf9T8QMOHXzYPsDA6gRFQ>
    <xmx:dGVfZYS7njXMoAPIbho4Ev22NtdR34XJUVqCvx69oTR8PeUlBufY2Q>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 09:45:07 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v3 5/5] staging: rtl8192e: renamed variable HTIOTActIsMgntUseCCK6M
Date: Thu, 23 Nov 2023 09:43:37 -0500
Message-ID: <20231123144337.13112-6-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123144337.13112-1-garyrookard@fastmail.org>
References: <20231123144337.13112-1-garyrookard@fastmail.org>
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
v3: Corrected versioning fron v1 -> v3, includes change history.
v2: v2 was Skipped over..v3 corrects this.
v1: Style and compile issues, asked to redo.

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

