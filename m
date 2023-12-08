Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A641849
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="PALd6cdJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wk52Z2Bd"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id 32A205C00D4;
	Thu,  7 Dec 2023 20:55:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 07 Dec 2023 20:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702000523; x=
	1702086923; bh=yb/fGzMDt5O/3Q7y/S5/N/cQQ03CVnhxpiNtqmtprvA=; b=P
	ALd6cdJgLZ5ZsXHE4LvyfeT/YwaLKhGq1wwBg+tYLNogjUbgok76HgbF7N81E68e
	OywFxvyfTzga3yBULYAQtErxka3lrX6KMcVBGKZZvMrovqpkulJIvHzApvKcWor5
	2dyzDHRGJwlLmUvLSN6paby5cOwAVMH+8LrGwRbriVY6sDTNCqzHIA8RJsaIyIsy
	aFWlAXG0zZwyu/K1MDa73843bFjiQYN+dTQuGCcmCg9v0nMbX1z/O4bL/5CgJldM
	48kvbKVbwvJd1k3zrXjIxYx3Uu4i1JP7HnRAwpkDLB2aYddha/MybBKvvGjjDgKC
	Ukdhqm3IfPd3QOiY2RHAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702000523; x=
	1702086923; bh=yb/fGzMDt5O/3Q7y/S5/N/cQQ03CVnhxpiNtqmtprvA=; b=W
	k52Z2Bdaf6qSJZRiRGbKCxxF8vDaKhjPQMHlOAWqFm25rA6I+E5VVrIvMq0ZTGrf
	PVB6BGg/bBCQjKBN9VUnXuB+TmW3ozaHHKDgpIfKtqyLDhD0qEYux7DEdieyDMzt
	dP558aIXqNc5r6Bu4DODdkTGCR3etVc/TaFXMbjPS8u3AcXwCyfawcOxFweQTVQm
	mqlQTEaTI2sxzvVix3ZPo/CSe9hxcYow8VkAWaIRz+S5+33rmeBWAKdHZgQEwR9+
	Wyid/darH8ctADVdRE90xT1k/GSUJUEIZ65QXJKnrM+7rFsTENH0Hx0STP/jwyOk
	rfiYAeI9fM+fNOatJDwFw==
X-ME-Sender: <xms:i3dyZdR6-l7Rfgd5rZ9WPTyNULCS10KySKWTYMOMlMpVpk2JqUg1Qw>
    <xme:i3dyZWzgZtYBJI48lGd9nQihaKi--7-jLlSygP3pjg25c3Pq3h1JC_5PJm3EI38az
    6_YA0Tvq91VRJ2hh98>
X-ME-Received: <xmr:i3dyZS3uXjo1ASRzQsOtnFDhJ_btfK8SJRUN5H5bDQ2Zgx_09EoPCtKozWFH3ZE8WOGEUtQKccz7oNRF4df2PwqG3oNn_Ak_X_rQIH5Kg1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekgedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:i3dyZVBDxwDqc0b-uZlnBBc-dO8pJjutxfmVtV5uBgcyhZ2MPqOavw>
    <xmx:i3dyZWhNVQVpGjkr14LBNobpnUfCSIwVhd2pZKEs2VbgxrXFYXPFHA>
    <xmx:i3dyZZoBpPX08DeuSeN9IxmGRGIxUradnJplH7E3rpysNJJPbGaz4Q>
    <xmx:i3dyZXtADU4Ew8JO_AKhoSLT8tI_XWyCl9WYEfQJRhXSyknP-DvdxQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Dec 2023 20:55:22 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: renamed variable HTIOTActIsCCDFsync
Date: Thu,  7 Dec 2023 20:55:35 -0500
Message-ID: <20231208015536.21013-5-garyrookard@fastmail.org>
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
rename it. HTIOTActIsCCDFsync -> ht_iot_act_is_ccd_fsync

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 73c0204303ec..5486b1ab4b5a 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -218,7 +218,7 @@ static u8 ht_iot_act_is_mgnt_use_cck_6m(struct rtllib_device *ieee,
 	return retValue;
 }
 
-static u8 HTIOTActIsCCDFsync(struct rtllib_device *ieee)
+static u8 ht_iot_act_is_ccd_fsync(struct rtllib_device *ieee)
 {
 	u8	retValue = 0;
 
@@ -662,7 +662,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		bIOTAction = ht_iot_act_is_mgnt_use_cck_6m(ieee, pNetwork);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_MGNT_USE_CCK_6M;
-		bIOTAction = HTIOTActIsCCDFsync(ieee);
+		bIOTAction = ht_iot_act_is_ccd_fsync(ieee);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_CDD_FSYNC;
 	} else {
-- 
2.41.0

