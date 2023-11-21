Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9795D20DC5
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="YitlP8Qe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CFDoL82A"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 9C6283201993;
	Tue, 21 Nov 2023 13:15:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 21 Nov 2023 13:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590505; x=
	1700676905; bh=0Lp9mqeAz/6pwwL4dTxdUdXhfanY55hRrrW5uod0AVg=; b=Y
	itlP8QeWpnQBU3apMda2NVWRUmKiBAzFTovUrlG5mOp3xxJGJHfIoEN47OywEb/p
	cB7853DVyWInzN/MS4r4RWDvXtnHZNzDkYnSRtj913FbhvlOnreWft2O/OJPn/1q
	1aPJSyIjss44EjM1XvxvlVKDYdXXcQrt7JF7Y2uPaq4XHnfkpr3jUEiDBCDVxdEE
	mhVAOnJQJNRTwkjLOYttPLYqOWS2cWu6ny61Y4tXwjyIAsIIUJw5gnjfhhMLkWXd
	orhX0+tQ9RxLxsJKA8SlSN2uC1JPBGtNPILn5jS5KzePQhk1FxtCqiVf57+TgsyE
	EqLHe10xbrRkJZx6TUIPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590505; x=
	1700676905; bh=0Lp9mqeAz/6pwwL4dTxdUdXhfanY55hRrrW5uod0AVg=; b=C
	FDoL82AjOZderFEBZFP0+2wGH4uiZhqNJjBi7x3oxORAsEcHhVUMjDIQPI75TwWY
	k7dD9ssmfmBVzxcYXHJO2ejxjwkAi8hLiGY62t8HB4ftwynZRddcTLSTwS9QZtWX
	8rlmOhEqTlN79Qb0FyK2imN1QsvJ/afSHubEM3p76ZjL8CkdrJpcZ77ScDvhtKac
	JYe1To6BM7wmlJpTpAql0mG1w4+650JGN6HnwFodTBKtXkU+bm4wN46URNYmT3Lv
	DZT/gZFLZ1/a+O6hOp98wrdxkETqZXzlcErt1CczwJJ701VEfjQnrH77oLQVLqTz
	VuaNpwcV7Wl5PMivX6FmQ==
X-ME-Sender: <xms:qPNcZVKIhUvGqChFehOfa7RczkV_RH7P-ahDg6Q_fBsbLceBsKPNqQ>
    <xme:qPNcZRLT4i_1MmPzcGHlZarJfa-blJ8bD1U0gYbtDmjQaCYPsCz-5sW0InDwtQTZm
    EzZba4YG-lJaeMoEgA>
X-ME-Received: <xmr:qPNcZdtiLlVVwGyXg3lzM12VqT0-Us9qWAV-uBHbPB0QMvz1Edq2aCd1X_tBU2i4lJCdFkWL0Iv5U1wiGnQIkGhjwFzXrCXSpVhAnweyNm5R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:qPNcZWZFWEIBlpc9ol4VXvSbTTsXeeO1M3rZEGgdsvtit0Cs2Zem6w>
    <xmx:qPNcZcb0OjiQ09xdLp29lZrockQCjoavpro6eb90WAc_Zfael-dPfg>
    <xmx:qPNcZaC4csT-JFLJFd7_85CM9wXNkXptVy-U-bBtCZVPcGOlNNSMHw>
    <xmx:qfNcZUGSPYgHLaEeDr56Io9la_D2AnOd9Z9iV8PiQsogM15v5hSk1A>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:15:04 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 5/5] staging: rtl8192e: renamed variable HTIOTActIsMgntUseCCK6M
Date: Tue, 21 Nov 2023 13:14:35 -0500
Message-ID: <20231121181435.9337-6-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121181435.9337-1-garyrookard@fastmail.org>
References: <20231121181435.9337-1-garyrookard@fastmail.org>
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

