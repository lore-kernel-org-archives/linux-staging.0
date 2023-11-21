Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30422085
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="OLr9snVR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A3PPcdvU"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 64F193201A16;
	Tue, 21 Nov 2023 13:10:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 21 Nov 2023 13:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590203; x=
	1700676603; bh=9rRVIO4sacT/WuKNye++g7i1GjccmOxkpvkcPs1Z4KY=; b=O
	Lr9snVRyMDQ8w03mSIyqUT1pQaYkzz9/FX2L01fYxSo+iQDza1KiP2CbddfHCSJZ
	caNN5+R3qRyUQ3qAIWxBsb8lNggReShRacy48OQUXEV+D4XYm6E+i38UNMyV/y9v
	CfSD2GC+IEiVa1X+bKyOgDXy8HWn1GdNhMmP8z3T8WhDRH93SLcAcPV/j/rfPA3C
	XS0o7mxXLzeyAzcvn6R7xYuiis4Y0kkzlAGVA8/ucFX7kyt9nEEYD1BIOjiebCmB
	nJ4dR45qPl7C57shDTqbc9BOFYPXXQnloA4R+e//fNeStruyJon7vpDMZZkUNjki
	OeabMDi1hFbNGPYAabXGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590203; x=
	1700676603; bh=9rRVIO4sacT/WuKNye++g7i1GjccmOxkpvkcPs1Z4KY=; b=A
	3PPcdvUTnckw2Nge3IAbwUT7LfBebXdWfSrFEDplDiNijNRV3IpNwyo435CVZUbz
	0TXFVa21Bdk/5Kjkx5N8B2hjjJodoBbOjeiElZ7nwrU8dm6q6DQnJj8LzIJTPDGg
	Rqyjfq0gSd1bxS1bgI68qZ4lroVcISsOKXCOGyCJ6rVEPYAOfIAbej4kgwCJakBf
	caSgT4htZnzzXGPr43LhJ/vgCqtBy0FF6CID/ghATBZa8gFGrA2/cT094PwrqUNt
	8ApVDHYTptMemlNHHefDbw0nNQS8voqYCUyCO+5sK5CPQ+wJbZRfOEg/wrnmoUEI
	NqwRRF36H7sADt72ESOPQ==
X-ME-Sender: <xms:e_JcZVoqorp4wMJIOY5leyyMcCpr98pypDrTttXllX5B6xiN5ndL5Q>
    <xme:e_JcZXoAB4iEq31JJinil5vJPK8i7ow6Z73AGo3j7-JlKFCht3pNxdMSDgSQXD2lx
    dTx4xGTHJ1XwXlGXts>
X-ME-Received: <xmr:e_JcZSMoQWnc1wpFE3xb7XSF3bqAWrPGv_XgYOBm-uMXoC5ozqtnVYruBDZ5cUirWMoNw26iwpkL1DVHABRC_bTweIkZbAdIeET8dbxwq3Zo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:e_JcZQ719PkZhTrBpX-oqf-gd07TwiO6GGYJGOtld2rOWri-9kdAzQ>
    <xmx:e_JcZU6vospMkV-MU_fWDukpII7eamkK4_AmqEqf_sLJJJYDeoHhQQ>
    <xmx:e_JcZYhUkzHiJMofrGdv-ElC-uJuL2GHb9GHQ5lH9OK1VmldbHoTSA>
    <xmx:e_JcZSnDznqhRaGcvUoqlWfhindaO4yxwasL8ni2NeVuNTuOj9OFFw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:10:02 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoudation.org,
	philipp.g.hortman@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 1/5] staging: rtl8192e; renamed variable HTMcsToDataRate
Date: Tue, 21 Nov 2023 13:09:43 -0500
Message-ID: <20231121180947.9223-2-garyrookard@fastmail.org>
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

Renamed variable from Pascal/CamelCase to Snake case the variable
HTMcsToDataRate.
HTMcsToDataRate -> ht_mcs_to_data_rate

Linux Kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index e607bccc079a..280e335cbb6d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -103,7 +103,7 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 	ht_info->rx_reorder_pending_time = 30;
 }
 
-static u16 HTMcsToDataRate(struct rtllib_device *ieee, u8 nMcsRate)
+static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
@@ -422,8 +422,8 @@ u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 			bitMap = availableMcsRate[i];
 			for (j = 0; j < 8; j++) {
 				if ((bitMap % 2) != 0) {
-					if (HTMcsToDataRate(ieee, (8 * i + j)) >
-					    HTMcsToDataRate(ieee, mcsRate))
+					if (ht_mcs_to_data_rate(ieee, (8 * i + j)) >
+					    ht_mcs_to_data_rate(ieee, mcsRate))
 						mcsRate = 8 * i + j;
 				}
 				bitMap >>= 1;
-- 
2.41.0

