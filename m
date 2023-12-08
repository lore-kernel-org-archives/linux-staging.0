Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26971849
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="kY4o1Lvd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PDbt1lvj"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B14515C0203;
	Thu,  7 Dec 2023 20:55:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 07 Dec 2023 20:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702000515; x=
	1702086915; bh=qdU7YaA5F2sl4c6JILBgnoiR/p6RwiGUUhFFxFoXd34=; b=k
	Y4o1LvdFq7mtMsPHsFEJR2U/mrW2VQ75qCTMrOLCnLaZBCdyWTGWrtAU+BN8EEW8
	JwtokYSZrzPVQlHqOJddA1cz9nIwGPVmubta7K36W4HKsg5mhc4Abu5f9qwKFZLu
	lzXG2CXgz2cC6sUh8RM43itdFPjzb8UtvqOgFOjYOHiXGbo+YLzefe4TnvOeMBWU
	g71pxYQfEiXVmNSvBH4zcn72+8u1wPiJyrNjJ8gLNg1DMyl2E8wfbAA+QFyOWel2
	VDhF62akfzLZfx/FxjoQ1rDrXQiYSwP5bTcOs5yH5CJkLiSquixzzqd2XVYNsW7Q
	bGNpJxjHPPTgUDUbGo7Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702000515; x=
	1702086915; bh=qdU7YaA5F2sl4c6JILBgnoiR/p6RwiGUUhFFxFoXd34=; b=P
	Dbt1lvjhXQaZN9RS0Rm6H2BObqKTkLHCzoZ8U/kWTZnvagBTGVBTy3Mwyk7jHOkW
	jAqhR1jJbFXZNdM3lT8Zto3woFNRSYnH1UQuFdkkSotnRM9haOpwbkZnovWOMmBN
	0hAL6O4FDpKudUyoY5CnbUMaomGHb7RrtGMOWhgjH1CwX+y6YJ7KDMcdUiup/y0i
	mhF3U5COwNak6WD746fpiLDN3/ouZiR+xPlx1/794xZfMrxwf7lxZPUMMNlCvfcn
	phDs3w6KL83BJkwVi/PfWJENh+/V/F0lTGuKMngyO7fHvDA6phfJPGcnH0WgHvNd
	ilw3CUJiaxlgmwsFaNtaQ==
X-ME-Sender: <xms:g3dyZXwID0i0MFEIGhvnfDe3Nxzk7p0_EOMd9w_VpMdX-oE8wf8nfg>
    <xme:g3dyZfQgTNI2Src8ZA4a3fskqjIroYKFF83b2KvpsmDWlJwq1Z3o-LbCns_Z7uitA
    kPKGtclglZj6ALrOkA>
X-ME-Received: <xmr:g3dyZRWYVeDFLDz9SGXZJH-m0yDTbE3sarqBUZGEc1nFDUIMXhyMZINE3wk4fuDwXCQBzZzbcIsMBdLd7B0ro2xHX6exj_Qr18k5uMXIUYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekgedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:g3dyZRgLVBmI-CTAK-3alXvayqlM2qGAG7hYHr53PUjW8UF2V-7bZg>
    <xmx:g3dyZZANJJHTqhLCqtCVtbCk_l8OUucgyED_5vAXFPLwpAPHEE1g-Q>
    <xmx:g3dyZaLCLxJeSb8ZZPXoKG5XCiauPXokyZMB5_NDD5MmjUgYg8Jl2A>
    <xmx:g3dyZYMaHac7tJmIzHHNdZHEZfynSqPzvIjgD6G-xS966wX26N0iVQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Dec 2023 20:55:15 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 1/5] staging: rtl8192e: renamed variable bCurShortGI40MHz
Date: Thu,  7 Dec 2023 20:55:32 -0500
Message-ID: <20231208015536.21013-2-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208015536.21013-1-garyrookard@fastmail.org>
References: <20231208015536.21013-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. bCurShortGI40MHz -> cur_short_gi_40mhz

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HT.h          | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 6 +++---
 drivers/staging/rtl8192e/rtllib_tx.c           | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 39fa5f60db45..f01240f7e514 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1763,7 +1763,7 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 	}
 	ratr_value &= 0x0FFFFFFF;
 	if (ieee->ht_info->cur_tx_bw40mhz &&
-	    ieee->ht_info->bCurShortGI40MHz)
+	    ieee->ht_info->cur_short_gi_40mhz)
 		ratr_value |= 0x80000000;
 	else if (!ieee->ht_info->cur_tx_bw40mhz &&
 		  ieee->ht_info->bCurShortGI20MHz)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 330dafd62656..c73d2ac910d5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -287,7 +287,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 
 	if (priv->rtllib->link_state == MAC80211_LINKED) {
 		bshort_gi_enabled = (ht_info->cur_tx_bw40mhz &&
-				     ht_info->bCurShortGI40MHz) ||
+				     ht_info->cur_short_gi_40mhz) ||
 				    (!ht_info->cur_tx_bw40mhz &&
 				     ht_info->bCurShortGI20MHz);
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 98c1e5840e31..f89b618f71a5 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -97,7 +97,7 @@ struct rt_hi_throughput {
 	u8 reg_bw_40mhz;
 	u8 cur_bw_40mhz;
 	u8 reg_short_gi_40mhz;
-	u8 bCurShortGI40MHz;
+	u8 cur_short_gi_40mhz;
 	u8 reg_short_gi_20mhz;
 	u8 bCurShortGI20MHz;
 	u8 reg_supp_cck;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index a421c56af9e2..f9c76aaf8791 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -109,7 +109,7 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 mcs_rate)
 
 	u8	is40MHz = (ht_info->cur_bw_40mhz) ? 1 : 0;
 	u8	isShortGI = (ht_info->cur_bw_40mhz) ?
-			    ((ht_info->bCurShortGI40MHz) ? 1 : 0) :
+			    ((ht_info->cur_short_gi_40mhz) ? 1 : 0) :
 			    ((ht_info->bCurShortGI20MHz) ? 1 : 0);
 	return MCS_DATA_RATE[is40MHz][isShortGI][(mcs_rate & 0x7f)];
 }
@@ -481,7 +481,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->bCurShortGI20MHz = ((ht_info->reg_short_gi_20mhz) ?
 				    ((pPeerHTCap->ShortGI20Mhz == 1) ?
 				    true : false) : false);
-	ht_info->bCurShortGI40MHz = ((ht_info->reg_short_gi_40mhz) ?
+	ht_info->cur_short_gi_40mhz = ((ht_info->reg_short_gi_40mhz) ?
 				     ((pPeerHTCap->ShortGI40Mhz == 1) ?
 				     true : false) : false);
 
@@ -563,7 +563,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	ht_info->cur_tx_bw40mhz = false;
 
 	ht_info->bCurShortGI20MHz = false;
-	ht_info->bCurShortGI40MHz = false;
+	ht_info->cur_short_gi_40mhz = false;
 	ht_info->forced_short_gi = false;
 
 	ht_info->bCurSuppCCK = true;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index e2dd2772bbeb..041520e6c28d 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -362,7 +362,7 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 		return;
 	}
 
-	if (ht_info->cur_bw_40mhz && ht_info->bCurShortGI40MHz)
+	if (ht_info->cur_bw_40mhz && ht_info->cur_short_gi_40mhz)
 		tcb_desc->bUseShortGI = true;
 	else if (!ht_info->cur_bw_40mhz && ht_info->bCurShortGI20MHz)
 		tcb_desc->bUseShortGI = true;
-- 
2.41.0

