Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D3522085
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="Z2YNfCLq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="22zB+/61"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 056113201A54;
	Tue, 21 Nov 2023 13:10:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 21 Nov 2023 13:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590212; x=
	1700676612; bh=yt9x+GFYOOcz+oCAtF66VyzySg0BOpnmmsYizNQZV7o=; b=Z
	2YNfCLqrDKaYqr51M6wygPIzqgDINqmy4Ymz43fNZUaphMFZdRPR/mDJv8QnIpJt
	ZWDesi/wfOofxqFxRWDkLOWqPc41uj8mN9D84Va66/XFKIrxKZrDaIL/fRpSl0NH
	VbQy5MVF1JypZrzkcoGg4+WaA8KclEnZJexCVm9TExepyy0nKZh+aLDWo5br5yjS
	f0eMBfz6uo3qYAPwho3whgNPciDB2Rl8G/H4e+dNbaT82D198huKzfWRH803zRHn
	dZf4XU2w0WFHDsXSEE8uaGRdQjzfptuRunVtxokUQt4EGruODXMgYs0IMhsSLxRF
	BjesS6Zm5pT68KBbNqPGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590212; x=
	1700676612; bh=yt9x+GFYOOcz+oCAtF66VyzySg0BOpnmmsYizNQZV7o=; b=2
	2zB+/61VAx4PEt+f8k1ZgPYvdgAdGTnhVizE9gnNrkkmEBmJBTHl1wc1vShERf3h
	HkYvcbBhfVN9kpqOfXlE4G8hLHJQMVYkI6IP1omZ+en0+5UwV2QQaFz4wgA7gXdv
	ngjumz04feLRde8GE0Ze07i7OvF2rX2mcO1XFvpAB6esA8p78TsR3r0elSdrGv76
	fjLwFZoOYiJzTO3jjmMKZrnvjIQN2YY0umAEwibJYGzk+smOhmWdde7xM/L7/VfV
	pNC6K6HAXVkvQQauCjNPGSG34SQDLItoOuwRZxT4pGJTfTbalU4n2trlUolW3pLC
	m+DS4Q0/wuTxbkxij49EQ==
X-ME-Sender: <xms:hPJcZa4d2G9ZkwT4KV4Mnj0JvCFwK8q95-qbDkc7YOGkK-Q_8fj9FA>
    <xme:hPJcZT4TDVIWxYTt7jmA8mf6fM0VFlpU2JrAAMjQMQo_4-j0APeeqJiMZlqa7DHaC
    9RCrj6-X6Hc68plmJc>
X-ME-Received: <xmr:hPJcZZc9Yyck623Cw0SxV6FCWMzePIwDil6WK1X-1kNjkGdlWN9KtUqWLVtJMBhCrgb5s3o8FmeO_gZ9mNCeUtJLC_qsbWj29NRr991HBa-p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:hPJcZXJPruw9Zep4KUOdVFt_f8Ms8Y92tFjzURi40wl1ERi2GX3_dg>
    <xmx:hPJcZeID9LbLu3F6gBK_F3UAVTcmq_gxAZYFZzH9bGLd36B_DJo_Rw>
    <xmx:hPJcZYxPoTL2kzURCb4k36e43YvDzxTc3_MB9E01qB0YqKmOpI44oQ>
    <xmx:hPJcZa2aFxBsNqGsGormkbYfeokAbuXdLkhpzgJ-iAFmHrpMwnot8A>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:10:12 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoudation.org,
	philipp.g.hortman@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 3/5] staging: rtl8192e: renamed variable IsHTHalfNmodeAPs
Date: Tue, 21 Nov 2023 13:09:45 -0500
Message-ID: <20231121180947.9223-4-garyrookard@fastmail.org>
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

Renamed from Pascal/CamelCase to Snake case the variable
IsHTHalfNmodeAPs.
ISHTHalfNmodeAPs -> is_ht_half_nmode_aps

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index fb8294f31a60..0993263c13d3 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -139,7 +139,7 @@ u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
 	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
 }
 
-bool IsHTHalfNmodeAPs(struct rtllib_device *ieee)
+bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
 {
 	bool			retValue = false;
 	struct rtllib_network *net = &ieee->current_network;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0226a69f40c3..6b549629087b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1782,7 +1782,7 @@ extern u8 MCS_FILTER_ALL[];
 extern u16 MCS_DATA_RATE[2][2][77];
 u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
 void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
-bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
+bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
 int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 42d652fe8601..89bc38774fa7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1872,7 +1872,7 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->softmac_stats.rx_auth_rs_ok++;
 		if (!(ieee->ht_info->iot_action & HT_IOT_ACT_PURE_N_MODE)) {
 			if (!ieee->GetNmodeSupportBySecCfg(ieee->dev)) {
-				if (IsHTHalfNmodeAPs(ieee)) {
+				if (is_ht_half_nmode_aps(ieee)) {
 					bSupportNmode = true;
 					bHalfSupportNmode = true;
 				} else {
-- 
2.41.0

