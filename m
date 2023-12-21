Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974D156DD
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="CO98p2Js";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zXZmYc3Z"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 4EA4F3200A14;
	Wed, 20 Dec 2023 22:12:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 20 Dec 2023 22:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1703128358; x=
	1703214758; bh=NFwX6DpI/WDWMxbg2l+n1YK4Zppa2WdhFie4RInmDDo=; b=C
	O98p2Jsr/wI2aGEzhwrZTaHo5auKL+fSV4hxVPQEtrctofq3RKFYq+W7ofxqyOUl
	/LzEhHt8UqOMrGaDxfM+iw6gyxYXQlcZqHyaDVHZCwstBcLSaK/TbiH7TdqkNGqL
	582EhRdZYXAJxQu8Tbepc2ArpzRVoACaoATu+7K74kD7WV288u64hQYpxhDWbsYP
	qKdkaWQX6Bv8Spg7ythMaQ104jyW1vXKA5p2o9zrmD1utXPTiKvJG/dGLJdVwD7l
	C9JWynmXELNBekuTIWFtZo+OrVgQAfX/3j+CSW9Tx/fJs4V0GKJVXs6njOP9mqwz
	qFUPAF51/iyYvCQK6S6/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703128358; x=
	1703214758; bh=NFwX6DpI/WDWMxbg2l+n1YK4Zppa2WdhFie4RInmDDo=; b=z
	XZmYc3ZiUlhPdBZmZ2Ed6oQqKVyRA7GjjH2O7vZf168qi0udD6HTSD2VzP+U80VZ
	QGoNqweUCsLQWxjZv7+iak2kWgf6W0XhKVeUEaCf1XIS92tJh9zUfV5IiY7U0Loc
	P9J2W2r/Smv4vlBUVGetjfTahbi5NlWn6HeAnMNHJAw4lTY8mEac8DUVwx5oW+Er
	DtPUAciGUIIitRFduOyeqeOyeqr1XEnlnvd2yTKQOOKUC/XSO2rN78eXv06RpOiZ
	Y9obcanHHOfVBQOzuqLzN83KUZqALcE/bkmbi1VBVJo1efQ0c75vWcouDTQYDUwU
	ewreBCfO8js1Z6wrT5wmg==
X-ME-Sender: <xms:Jq2DZZ28T2h8AH_I_y-YpyUdpoQDD_b_FMeZsFQBkr7U2nyXXdSwOA>
    <xme:Jq2DZQF5GlyrcR7ZK_dmo2fo6cHx0t3zkTRs9UtaYOZiac8s6qLlyRYxZy47VCHUy
    5u0Ph8orfzQIeybkxo>
X-ME-Received: <xmr:Jq2DZZ7DSGJUL9bX9VUalkQRgY3pGcFW8VLsJV9berAMY1XlEk7WIDEj7PPDMBE5aTBRP6D9H7fMdZfRXVmFzJfmVDcnyHuy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:Jq2DZW2qRtcoEzXIrN5FRfr6z2rbsywHh735FTddtJ2EbZdM8FNwuw>
    <xmx:Jq2DZcFC9AQYEyvKO6V8uCURxFJ-qxH-8YVjuOXxDLjPMqxiQK1M1A>
    <xmx:Jq2DZX9uzPg4JiuLJ0mwexyDJYDO4eHYltXyajk_G53rFCAyZUFfhA>
    <xmx:Jq2DZWO2DRTdPtF8KRAxgg8UNzrPfkw_DoSsyFGUwgOSOyt85gOv4A>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:38 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 3/5] staging: rtl8192e: rename variable HTCCheck
Date: Wed, 20 Dec 2023 22:12:57 -0500
Message-ID: <20231221031259.14853-4-garyrookard@fastmail.org>
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
rename it. HTCCheck -> ht_c_check

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index a32f3553df93..5698b48fdcc9 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -622,7 +622,7 @@ void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 }
 EXPORT_SYMBOL(HT_update_self_and_peer_setting);
 
-u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame)
+u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame)
 {
 	if (ieee->ht_info->current_ht_support) {
 		if ((IsQoSDataFrame(pFrame) && Frame_Order(pFrame)) == 1) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 78eae7daa351..341d9ddc9a1f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1767,7 +1767,7 @@ u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 		       u8 *pMCSFilter);
 extern u8 MCS_FILTER_ALL[];
 extern u16 MCS_DATA_RATE[2][2][77];
-u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
+u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame);
 void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 5f219cfb65eb..595ec9af25ea 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -857,7 +857,7 @@ static size_t rtllib_rx_get_hdrlen(struct rtllib_device *ieee,
 	size_t hdrlen;
 
 	hdrlen = rtllib_get_hdrlen(fc);
-	if (HTCCheck(ieee, skb->data)) {
+	if (ht_c_check(ieee, skb->data)) {
 		if (net_ratelimit())
 			netdev_info(ieee->dev, "%s: find HTCControl!\n",
 				    __func__);
@@ -1401,7 +1401,7 @@ static int rtllib_rx_Monitor(struct rtllib_device *ieee, struct sk_buff *skb,
 		return 0;
 	}
 
-	if (HTCCheck(ieee, skb->data)) {
+	if (ht_c_check(ieee, skb->data)) {
 		if (net_ratelimit())
 			netdev_info(ieee->dev, "%s: Find HTCControl!\n",
 				    __func__);
-- 
2.43.0

