Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D58859B44
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 17:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="V56aqOQj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R/NWIg2u"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A7B255C036A;
	Wed, 13 Dec 2023 12:54:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 13 Dec 2023 12:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1702490072; x=
	1702576472; bh=NFWBZNBolF9xr8pUspxdkODDx6FqZO+GM1v/aSU4404=; b=V
	56aqOQj3PJEe+5cSrhEvK9EQd1kDwM2+ptCoWIo/NmaAlEC7thTzC6H/QYVeCCFE
	U5vWufD0AHO8K0eZMUoyvkALX3UnDQSZIjq7+9CTb+/x0a4601ECrB+ujtHFWDqc
	S53YPl3cur5VJ3cRMkAEhJ33oAeh1BEQ7g7OXSUAlt88rjRZqjr1GqmjKQfnR6QL
	rMPL0++0d0Fboh8AvDgRl6v6ORfPP2iPw44Vzu2G5YazfOlqvWv/IUwSIkze2mwa
	YHc1ula9wNM5x1uCqavjBycTbStAt2C9Ak6NCTXSMkJcVFaOQ6MsZ2kItyPFHwqy
	WEfuUg5m1tBs19AgjUuOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702490072; x=
	1702576472; bh=NFWBZNBolF9xr8pUspxdkODDx6FqZO+GM1v/aSU4404=; b=R
	/NWIg2uy7Nj+7ybTluEbChTzEXn7eGT36Rhi+JMJ2q7uB4Xyvkd9leCb00Zpg0y9
	HRSqRuZCDWoMfJ2Ss7zZOR5AWCd8RP/MPYHcnaaWKLZqaw0tljOJxe0vzgPZdwPB
	5IGlN0LLd4LWHcIlxHbUUc65TRaC/pinw3AFHsoyTnV6OT0JJRsYI8oxzldNBKzi
	2MbbST3EZCeSdi4X45iFbEUt79EXxi9t8KLi4sS3knkXTjBaSqqAuPayzaaa+l24
	rZ70PdaffXNdzD7fnXfuX3h153cWgH2/L+wU2k4lLTCnQMATWJdx4SG33c0q/E4G
	lo+5PrHIsNTPTOb3ERJBw==
X-ME-Sender: <xms:2O95ZZk8KO96UEnje-9gVRhxMJsJdi7W6Um5R15N7XG94RQp-hc-tA>
    <xme:2O95ZU1flc2ZrJIXdm88O43QMrNvRx6nFLto3BAwEsgLFcJ4vpSyWnF4crSlI--kv
    DljY1esGzR2SPl4U2Q>
X-ME-Received: <xmr:2O95ZfoZlVQZNk19ORqMv1bsfN22TLiHZpVUB74rskVcv6ORu7Miw9pLfrg5_lYM5s9RKE9FLRf5lmPFk_miahVXFvdc1Hu3HYdxQAyQs4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:2O95ZZkXLvzJS9269EbPeAF5SR0ijML649qbiX8HtQnEbaTStp6C_A>
    <xmx:2O95ZX1GI3TdIbevudfCbrBJqk1qoPN7gWuRs9JqzgEV2z8EtfAOUg>
    <xmx:2O95ZYvtewZ0BTlFlgsaWnYGQBNMZiL09McfxXnxWlCYNIKO7Ukrlw>
    <xmx:2O95ZYxZQl7W7U3tQtH0HvfgusiDTa2Uq5zkBYLIQaLqx97Jkn2cIQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Dec 2023 12:54:32 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: rename variable HTOnAssocRsp
Date: Wed, 13 Dec 2023 12:54:58 -0500
Message-ID: <20231213175459.5425-5-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213175459.5425-1-garyrookard@fastmail.org>
References: <20231213175459.5425-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. HTOnAssocRsp -> ht_on_assoc_rsp

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 4c99e2db97d7..8d07e5caa2b8 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -441,7 +441,7 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 			enum ht_channel_width bandwidth,
 			enum ht_extchnl_offset Offset);
 
-void HTOnAssocRsp(struct rtllib_device *ieee)
+void ht_on_assoc_rsp(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct ht_capab_ele *pPeerHTCap = NULL;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ff7fef68e309..f756395b9bed 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1760,7 +1760,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee,
 				  u8 isEncrypt, bool bAssoc);
 void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
-void HTOnAssocRsp(struct rtllib_device *ieee);
+void ht_on_assoc_rsp(struct rtllib_device *ieee);
 void HTInitializeHTInfo(struct rtllib_device *ieee);
 void HTInitializeBssDesc(struct bss_ht *pBssHT);
 void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index a6de4db9a9cc..d60bf5870c39 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1067,7 +1067,7 @@ static void rtllib_associate_complete_wq(void *data)
 	}
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
 		netdev_info(ieee->dev, "Successfully associated, ht enabled\n");
-		HTOnAssocRsp(ieee);
+		ht_on_assoc_rsp(ieee);
 	} else {
 		netdev_info(ieee->dev,
 			    "Successfully associated, ht not enabled(%d, %d)\n",
-- 
2.41.0

