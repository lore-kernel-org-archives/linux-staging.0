Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183E33CD0
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="AkQxzzfe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pi4sCD+s"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 360913200A3F;
	Thu, 23 Nov 2023 09:43:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 23 Nov 2023 09:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700750634; x=
	1700837034; bh=1+7AvHJjIM3thaE/1epeB6XcVD1TVhLtKMuA2cV98x0=; b=A
	kQxzzfeh3TLofcDvbbsV0jqn2P2BA+jpGHZOXofQZ0MVwFhyrC3ZU+UgWzd1J0Nh
	eXroOMbWQZWVZSaNZGMX102rqaKDXYy1AL9/yvfgJJmsRpI1ix8C9cnavlf8CCpL
	OqyruE+X+SqDZkpamthfTHJ094BKUdxKUcYdBauD9AxjUo2YKurP426pf6AgsKQ5
	MUGeg0zKvDlKj8bt5Utb/xyVVslWokch0hOPvE6gkcFAfOcD9I+xcKBYEV+s3V8z
	HrudkiJ9s5cjXVr8XnXP5WARyWIvVJ83XyAwVi2jiUsWzqdXzS72geRqPeYU+aZ6
	1wxYQuKIb0G9AiY4FoR1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700750634; x=
	1700837034; bh=1+7AvHJjIM3thaE/1epeB6XcVD1TVhLtKMuA2cV98x0=; b=P
	i4sCD+sqVoHBS+4/EaGpFALOcIg8Xa6Z7ts/yCTyDB8LTEZkkS8K+rKjl7zyDbRV
	TS5Sx6vlJ4UR9NDT66KVBs8S6UzxFCBwyYml0Ub5kzo3F5aTAPVBko+6SUJlyZn8
	+63JuqcjHHtCXPcLdEPsglmI3JwQSluRLzXr6Q+5vUZF27jozM/tMjjY4bkdvAxW
	Dk3NrTvIWzM/B9PK6EOxR1J84Uia/8++IFdXxCXg4ugknX7ioBeHrIU/b3qheNPu
	sOgCq2U3rC71xlIIl5Rt9skJtcGCkUaFmvfRHexAvwZ0mKkXtEwCyqSIAWV8g5KZ
	6hQ+KhLw5uhDxT6rW4WnQ==
X-ME-Sender: <xms:KmVfZYrOhWoeBT92UUMr3cxQrYcAjsWUDK1tX_nJBovv1NXyq2S7Mw>
    <xme:KmVfZeoIt-16hQ36E-1H8LCEbRWj6YdJiCu3eoWrYCqVdszQrNFb8Uo_r9HC9AtOA
    37oEci-pv3J1YCdZAE>
X-ME-Received: <xmr:KmVfZdNfCcQnJOT3nPinlQVmsA0DyP7iEJIrZunDVZqFJcHYi8eTpFNDGFDJLXgebWeAChx64t4Wp8IHbImPgmDwxX4MHc7WBYQSiZQ47TAx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehfedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:KmVfZf7KfHlropoRAVB2eKD8ynWOfE0FREpsNTqZxODm33PJKOMaxQ>
    <xmx:KmVfZX5m7npVJ2akDSHNw3bUAj4HqpNdzE3nVjjikgHL_DxH8dVQfA>
    <xmx:KmVfZfhzpcikipz5xTrP3huSqUklt0SiiJcigjCx3BOeKaRgqya7Hw>
    <xmx:KmVfZZlg21BeD215qkYjOJ62DH_YIjigOHXcJ5jFxoVdiHi4gP6MPA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 09:43:54 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v3 2/5] staging: rtl8192e: renamed variable TXCountToDataRate
Date: Thu, 23 Nov 2023 09:43:34 -0500
Message-ID: <20231123144337.13112-3-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123144337.13112-1-garyrookard@fastmail.org>
References: <20231123144337.13112-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed from Pascal/CamelCase to Snake case the variable
TXCountToDataRate.
TXCountToDataRate -> tx_count_to_data_rate

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
v3: Corrected versioning from v1 -> v3, includes change history.
v2: v2 was skipped over..v3 corrects this.
v1 Style and compile issues, asked to redo.

 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 280e335cbb6d..fb8294f31a60 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -114,7 +114,7 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
 	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
 }
 
-u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
+u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
 {
 	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
 				   0x24, 0x30, 0x48, 0x60, 0x6c};
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d2cf3cfaaaba..0226a69f40c3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1783,7 +1783,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
 u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
 void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
 bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
-u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
+u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
 int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index f32584291704..28aba1d610f7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -208,7 +208,7 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
 {
 	u32 tmp_rate;
 
-	tmp_rate = TxCountToDataRate(ieee,
+	tmp_rate = tx_count_to_data_rate(ieee,
 				     ieee->softmac_stats.CurrentShowTxate);
 	wrqu->bitrate.value = tmp_rate * 500000;
 
-- 
2.41.0

