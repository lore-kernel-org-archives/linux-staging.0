Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83B249EA
	for <linux-staging@lists.linux.dev>; Wed,  6 Dec 2023 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="kOy4359q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zkweNvXl"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 836EB320046F;
	Wed,  6 Dec 2023 18:04:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 06 Dec 2023 18:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1701903840; x=
	1701990240; bh=LdvIlOAXoikrOB54goWHhb+eiW1iC/9ih0Hj6Tkkyn4=; b=k
	Oy4359qatBNbDIsupmBK00MrFd8XTNEXDMDwEWk1QIASpjibIJE8hvFcpEO3HqPp
	+ZIc9kHZ7SY9/Scos7vLYk3mS/QlFA9GpF8C4VACBjsUrP5qobSqJiyF7TUJAOwm
	o5hqWfg0m70ZxWCkqjwhIG1fTLB8YqtMZgqCT3Fabw463yn7xS+bI2AGjrFlDWz1
	gYUQI6OTLWAY3ve7rwCODXDtnL53g1G7xN+qDecHiEEYl3uMo5MziAkM7Lz26AgA
	3eU45bApCFJHDSd6wNBWpQ8dYyZKyd0RJNcnvZLQk5t62VfrCv8aNHwLSymyMp4T
	YO0r/OmARHXpeJ71eCEnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701903840; x=
	1701990240; bh=LdvIlOAXoikrOB54goWHhb+eiW1iC/9ih0Hj6Tkkyn4=; b=z
	kweNvXlu6OHiZJWvqMxaKN7RSmZgtF6hbMUJ/447f9D/ta2+eB2zh5mhEe/EmXdd
	0/I2Zq+8qGfbafI4mLF2P4Qrx5HksTd0GuE9NjrrP8rEqvLFSf9+9inrOhXSJIef
	e6KAYQrS0sKCOLSiG7zbtJlW8b6QjE0431I/+Y94czD8hJf1axcdrqk/YDMvS3Ko
	6f1cmB568tXSVgf47/52jtCqhQ4jHXrgXWtfiEq6UCVmHyaEztjwls6k5FwYbaUD
	Db9vVfDSktZ9sQkjYceHaw2bXetLW8D80T3Df6r6hvHkX9D16XRiP0k6Tv+SGz9x
	0wONE2wPpdUcYWDeLAHwA==
X-ME-Sender: <xms:3_1wZQsFOdl1eOEZ28ha0rgBaldOEhqyUzJbT2t2uS4-K0Y16jtpww>
    <xme:3_1wZdcj6S9UQQs-9uAhDrdZs8GUH1HM0IZELZVTcY3To_gu3hy54BqAYnzLOPZbJ
    3_HgrAO2If2pdN78RQ>
X-ME-Received: <xmr:3_1wZbzEC1Di2jI8T5a9gVnvuGapPD8lU6ewJ4_ednqB3E75jXsBqFcws7XWDgkYM3ndCR4p-8wX9b3o2wbmIpnjIdc9q3yVc9umjPCysdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekuddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepvdevtdeigfduvd
    euhefguddutdeijedtvdejvdevvdfgvdetudehvefhhefgieeknecuffhomhgrihhnpegs
    shhshhhtrdgsugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehgrghrhihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:3_1wZTMY91FxscAUnvyZD-vSjduJw7cGBu6ItV_jRniISPhhZi6D2g>
    <xmx:3_1wZQ_kOqvY1ZuHS-hebKSv6r-l0avc3ufmEXvXgRiips0y90rcEA>
    <xmx:3_1wZbUws5FXRolTi0nU6xNTi7X8vlcm58DgVoc0PdtjKvjaw1g7ng>
    <xmx:4P1wZfYXK242KPLFq_vxW_f5814ZSYkeN-zsnvL6sh-A4lE8cZv1CQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Dec 2023 18:03:59 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 3/5] staging: rtl8192e: renamed variable AMPDU_Factor
Date: Wed,  6 Dec 2023 18:04:02 -0500
Message-ID: <20231206230404.1721-4-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231206230404.1721-1-garyrookard@fastmail.org>
References: <20231206230404.1721-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. AMPDU_Factor -> ampdu_factor

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 7a3e36db849c..c01ccf252924 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -113,7 +113,7 @@ struct rt_hi_throughput {
 	u16 nCurrent_AMSDU_MaxSize;
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
-	u8 AMPDU_Factor;
+	u8 ampdu_factor;
 	u8 CurrentAMPDUFactor;
 	u8 MPDU_Density;
 	u8 current_mpdu_density;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 9841af15089f..0f044356e428 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -85,7 +85,7 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 	ht_info->amsdu_support = 0;
 
 	ht_info->ampdu_enable = 1;
-	ht_info->AMPDU_Factor = 2;
+	ht_info->ampdu_factor = 2;
 	ht_info->MPDU_Density = 0;
 
 	ht_info->self_mimo_ps = 3;
@@ -507,11 +507,11 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	}
 
 	if (!ht_info->reg_rt2rt_aggregation) {
-		if (ht_info->AMPDU_Factor > pPeerHTCap->MaxRxAMPDUFactor)
+		if (ht_info->ampdu_factor > pPeerHTCap->MaxRxAMPDUFactor)
 			ht_info->CurrentAMPDUFactor =
 						 pPeerHTCap->MaxRxAMPDUFactor;
 		else
-			ht_info->CurrentAMPDUFactor = ht_info->AMPDU_Factor;
+			ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
 
 	} else {
 		if (ieee->current_network.bssht.bd_rt2rt_aggregation) {
@@ -571,7 +571,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	ht_info->bCurrent_AMSDU_Support = false;
 	ht_info->nCurrent_AMSDU_MaxSize = ht_info->amsdu_max_size;
 	ht_info->current_mpdu_density = ht_info->MPDU_Density;
-	ht_info->CurrentAMPDUFactor = ht_info->AMPDU_Factor;
+	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
 
 	memset((void *)(&ht_info->SelfHTCap), 0,
 	       sizeof(ht_info->SelfHTCap));
-- 
2.41.0

