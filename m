Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD459B40
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="cybKX0jg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jB1yXDr9"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 836CD5C034E;
	Wed, 13 Dec 2023 12:54:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 13 Dec 2023 12:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1702490068; x=
	1702576468; bh=j2Lwj/7ATuziI84jX0SYgACrEXwbUDWaibcfIk9VTfY=; b=c
	ybKX0jgrYyHy2RkPnf9gts2KKxztJWAqIuGOxLro/pNAIOQysNB3N6XZvnEdJdYf
	GxwNNnerhbuKbENLimWNyswWLYscw5jZ8G18/anlULXLETXNkndbCWtXI5lgqcND
	li5XTgzQJcePOYtOrT3eo2QYxtT7qQ6ESsYhekoTmxd3gcyRz5wKeampktSMPpWX
	bchHhgu23NUsWHj6k55pR3WWhzrPnMCwOfWqwPHlOmflo1gV+oFMSVxI7y3czCWW
	LBkox8IEvlOY+NTJNQ6SLE7Z0Dhxo4+nqHti5co2/nhABIQaonRpGZf6LzUr+m2L
	iP36Gj8+AWPCUJMNeC1gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702490068; x=
	1702576468; bh=j2Lwj/7ATuziI84jX0SYgACrEXwbUDWaibcfIk9VTfY=; b=j
	B1yXDr9TYhF/cSW2STM+mYtUFUUmF0W59ICjy+iHD2SOwrqXiXe40zrM5KxBXvCG
	pZwDDwLulP1sVngx/M5SBEIoswDSNFS6rCfsq+GkEJ4F55J3eztrZC+WGfRuRtYX
	bqiUC56vdEu6Ba97BViifI3lTmuC2absTgc6rwTeFk3S+FfqQxl5hwsOt/sgMZ45
	ldAdienGhjaGqKITIr843EG2pCQDvRMkmR/CeAaynMItn+ErxFlYCCi2u6CsdZ70
	5OEia8n30LkEDN98naKpINA39AOu9YVFEqvhF8rFh1/kbt/OMFWJPToe41yV9qdC
	yZzYmxX3e77irjsafdadA==
X-ME-Sender: <xms:1O95ZWzEgiHDHVTkdtsFKzvGzqDAYXJHzibYLEHlo6-uLPV1WcmsRA>
    <xme:1O95ZSTGrMQzzeAIXVFj9pzIFxZmGFtYw7GAXx_hIqVCcRvc3WZqQOfUqKCv0EoLW
    Nu-68pE7SPj49N6Bak>
X-ME-Received: <xmr:1O95ZYUNJdCC2E-CuHTFzpvuWXzIEYgXY-srsDfMrSiJcBDX8NYNQhb6YwA3xPJMgBUPYYligI-jfAuuP5C8tW2CFGUPVDoW9CfUZNAVlxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeljedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:1O95Zcira_uIEuTp10jBZMtdBGOfsPjcaUaBnZ1K3CsBflvL0ZoqHQ>
    <xmx:1O95ZYCY0dGqCsUxkZa076Rh-wsRtygbaWplDhezrII3KTVgH4TCZw>
    <xmx:1O95ZdKKJ7wgnKc2qc-c8W-gxF8uFfLfgffA43J8QOql6Ae0Fkd2Dg>
    <xmx:1O95ZbO4UzTbPA0Mz-U29home7jy96pMfktqLrJZxt0rrdZg2L9vBg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Dec 2023 12:54:28 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 2/5] staging: rtl8192e: rename variable HTFilterMCSRate
Date: Wed, 13 Dec 2023 12:54:56 -0500
Message-ID: <20231213175459.5425-3-garyrookard@fastmail.org>
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
rename it. HTFilterMCSRate -> ht_filter_mcs_rate

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 06542ac851fc..9f942352a119 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -417,7 +417,7 @@ u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 	return mcsRate | 0x80;
 }
 
-static u8 HTFilterMCSRate(struct rtllib_device *ieee, u8 *pSupportMCS,
+static u8 ht_filter_mcs_rate(struct rtllib_device *ieee, u8 *pSupportMCS,
 			  u8 *pOperateMCS)
 {
 	u8 i;
@@ -538,7 +538,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 
 	ht_iot_act_determine_ra_func(ieee, ((pPeerHTCap->MCS[1]) != 0));
 
-	HTFilterMCSRate(ieee, pPeerHTCap->MCS, ieee->dot11ht_oper_rate_set);
+	ht_filter_mcs_rate(ieee, pPeerHTCap->MCS, ieee->dot11ht_oper_rate_set);
 
 	ht_info->peer_mimo_ps = pPeerHTCap->MimoPwrSave;
 	if (ht_info->peer_mimo_ps == MIMO_PS_STATIC)
-- 
2.41.0

