Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBAA156D0
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="DsIP/a4o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="482VMzHb"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id E6AD13200A14;
	Wed, 20 Dec 2023 22:12:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 Dec 2023 22:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1703128365; x=
	1703214765; bh=XWnAqBfJFUH3eglypfU2Un+KkV5x4RHsq5AWEE/Xgd4=; b=D
	sIP/a4oWU5nZf8wQuvLeM7RrhZXqOpQPXIetN+IuPRdLHFPiN5NQLTlnkhhapz4F
	YeUKBQ3jeSrMc2JBLE/0tfBzElMn/mhnK16F16+xkS/iAhoJRSMkm2+T61WlcT+Y
	78GNz7o5D1HaHJoqf6+jKZvgxhGZ0dvlpyNlTCiHClRa/2JwuE+uSwKyXq2R/b23
	g9VlB3mMSkN/dJQN8jBokiaCTkXA6WD45W7MJOBpChEJPFzr84hWdZhdRULmKpHm
	9ItGJW+325iNgBvUWr3QRhicrwLd3YxkYsbJsYdT85gSgbQl/z/et9BALc/HKGe1
	rrj/dYZeUfimVRmEd6nzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703128365; x=
	1703214765; bh=XWnAqBfJFUH3eglypfU2Un+KkV5x4RHsq5AWEE/Xgd4=; b=4
	82VMzHbmvGNvPCPDE5tsRhSAuQhErnxNP8JyuXF3M4r9gU3qIRKgeocapGqkEJdN
	tdnBQAuK1qQjhDflEWGW/opB75AzEyARcb21MyweYwJXPp0CPMYHfwK8oRD7k6uJ
	dc6WymJQFjJ+F9DmIHc8voPfiCXq53Gw3TKl0IMypZnjfpdzd2CwHXxdmdCde584
	alpOZq4TIzVYrjohv00ooxz7xwomrz5cxRXog+LBkXMLzXFDBUA0X6Y6QdzZgmv/
	BhPEKcp5QCjt7jAMEQo3Nu3eUdlWMm4H9uQqXqm+y5iFcM2wmbC6WFro/a4Pczst
	89EgxwfKsn6Q3PHYjI4lw==
X-ME-Sender: <xms:La2DZZvCaIVcXwgHTXgLCecQ4DGSc35sanMxIB22j-NRQoU_VrNLiQ>
    <xme:La2DZSc6TAVcniy4w-3sLinNzeK7ixY0rwDwJVlVBQh-IUhwHNLjTxX9_ZMnVksj1
    NH7XFsp_bKjIMLzKN4>
X-ME-Received: <xmr:La2DZcwkCCOt-mm8DB0PUBXF2UL31ko10b4jHqkZqshvJC0s4JarRIZnwZ23bNVmMnGQ5AD4JKs_dZA2qLslDkps1OzDPe53>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:La2DZQNfelSLv2gV46jGIDCkOiqRrDH7P_GkP-CN-0Qx4dyPbohZeA>
    <xmx:La2DZZ_qflbsW_j5VQ_6o9x-r9mhcGcVsygN2Y1zChQBBfS0yQRppA>
    <xmx:La2DZQVcT4gjazT8dkJopzgrisJ--aRl9w9zHhFnTELXf8QmFJD0Dw>
    <xmx:La2DZbknj5jA62IkSTpByBISwpXLgYAGfceiF5fJs0mm8lVwsXRhAA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:44 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 5/5] staging: rtl8192e: rename variable ePeerHTSpecVer
Date: Wed, 20 Dec 2023 22:12:59 -0500
Message-ID: <20231221031259.14853-6-garyrookard@fastmail.org>
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
rename it. ePeerHTSpecVer -> peer_ht_spec_ver

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 2911ea82dd17..68577bffb936 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -97,7 +97,7 @@ struct rt_hi_throughput {
 	u8 cur_bw_40mhz;
 	u8 cur_short_gi_40mhz;
 	u8 cur_short_gi_20mhz;
-	enum ht_spec_ver ePeerHTSpecVer;
+	enum ht_spec_ver peer_ht_spec_ver;
 	struct ht_capab_ele SelfHTCap;
 	u8 PeerHTCapBuf[32];
 	u8 PeerHTInfoBuf[32];
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index ac17d510a2a5..6d0912f90198 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -240,7 +240,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	}
 	memset(pos_ht_cap, 0, *len);
 
-	if ((assoc) && (ht->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
+	if ((assoc) && (ht->peer_ht_spec_ver == HT_SPEC_VER_EWC)) {
 		static const u8	EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
 
 		memcpy(pos_ht_cap, EWC11NHTCap, sizeof(EWC11NHTCap));
@@ -525,7 +525,7 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 
 	ht_info->sw_bw_in_progress = false;
 
-	ht_info->ePeerHTSpecVer = HT_SPEC_VER_IEEE;
+	ht_info->peer_ht_spec_ver = HT_SPEC_VER_IEEE;
 
 	ht_info->current_rt2rt_aggregation = false;
 	ht_info->current_rt2rt_long_slot_time = false;
@@ -569,7 +569,7 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 	 */
 	if (pNetwork->bssht.bd_support_ht) {
 		ht_info->current_ht_support = true;
-		ht_info->ePeerHTSpecVer = pNetwork->bssht.bd_ht_spec_ver;
+		ht_info->peer_ht_spec_ver = pNetwork->bssht.bd_ht_spec_ver;
 
 		if (pNetwork->bssht.bd_ht_cap_len > 0 &&
 		    pNetwork->bssht.bd_ht_cap_len <= sizeof(ht_info->PeerHTCapBuf))
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 14f34e6a591a..953222d57f0e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -866,7 +866,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 		tag += osCcxVerNum.Length;
 	}
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-		if (ieee->ht_info->ePeerHTSpecVer != HT_SPEC_VER_EWC) {
+		if (ieee->ht_info->peer_ht_spec_ver != HT_SPEC_VER_EWC) {
 			tag = skb_put(skb, ht_cap_len);
 			*tag++ = MFIE_TYPE_HT_CAP;
 			*tag++ = ht_cap_len - 2;
@@ -900,7 +900,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-		if (ieee->ht_info->ePeerHTSpecVer == HT_SPEC_VER_EWC) {
+		if (ieee->ht_info->peer_ht_spec_ver == HT_SPEC_VER_EWC) {
 			tag = skb_put(skb, ht_cap_len);
 			*tag++ = MFIE_TYPE_GENERIC;
 			*tag++ = ht_cap_len - 2;
-- 
2.43.0

