Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30220DC6
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="NkBSyZWa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vbOsnEk2"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 11F0D3201951;
	Tue, 21 Nov 2023 13:14:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Nov 2023 13:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590496; x=
	1700676896; bh=9THkF506HhQTz9C2aPreqLigusizQOZKZ9S9SPw4Ix8=; b=N
	kBSyZWaGDoYvvuD011TrlutIOrxK+LgtnFPrXPa2NVAt2Kt2SWy5XWC1GJGAIUN7
	dkjFPEy0di8VJjWr5dTugaGJQ4q9SkJ4Zthq7ISjzlUnLErgwNDH6mAM5VTHesl7
	HpVA8jf0SkpQoM7FLew/TWSZiAvVMCiaoM/3pyBC+VIbLSr96Qv+PD0uBOUy7aC+
	EeOa1kVDmfcWgi9Hh9DHqe1UrdPuGYWjaJqCm1ygXZrx7+O6kHnQeX2Njx7oTsR3
	IORrF7fAgtVGHbOjGSlBTJoyaT+U78rHJdQ1QO9vioKCdFddZBFggNE86/rF9GPn
	YuH4R3rBWWi8NpfxuFajQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590496; x=
	1700676896; bh=9THkF506HhQTz9C2aPreqLigusizQOZKZ9S9SPw4Ix8=; b=v
	bOsnEk2AK/Tc0H8I/wKGDDnr5yBSUiBOxioD/xoHiDXVXd0+LRn3yTCtbA8n4Q5y
	dNm6uuNuHrepu4YSWoq9HK0LNS0bAEf1J+wR/fNJULYPwTygWBNs8ePVkhV16EHu
	rnfVbgxkhJbisEfOC+agg70+IN0xoDOkA9+FuHRH9acYYTmNJ1i8WNnx0H0gRW9i
	kPVZfhF6ztnAwtnxqcytCS2uCwSWdNu4u1jD1WVoXvGb4mzi7kMrDOFuXrKbUV+L
	08k/gMZ1OoXkNBgBdamnjx+PH9X3e73oFvkRujMgMCa599B1GFDh+h/HBzU+Wbvv
	1jpIJbia//UruKLICp//Q==
X-ME-Sender: <xms:oPNcZQtpsucXkMEw2s1qYPiLVgak6DbBcP422ifJz7NEhLQcaZNBIA>
    <xme:oPNcZde3cJljkgJmNJFP8m0iahox83ceQm5pCbu1c9HwmdqSeH-zyt-AtHZIQEfEj
    DaWOPQhMyBdz5SpfXA>
X-ME-Received: <xmr:oPNcZbzIvX0qsQKB923EaZzsqgMIdpOKjR3DFBHu1X1lMYBaUCYMcniUI7xeX7uEdfxBKh6aitUhLDueXiNa88jA3AJuaWtnUyy1SbjW379c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:oPNcZTPMWmZIyaiM2FYBJwFI7RKywSkaZEq_F24TEqkKdiGf9s1uww>
    <xmx:oPNcZQ-IZt20sIhpqGfl7iFbVCo4d7G0EinF422-nZ388DRw6y_PRQ>
    <xmx:oPNcZbUEoFOxF9WIdpMfl4aIGsXc-cSdNce-VJBJ1snzgvUE__05mQ>
    <xmx:oPNcZfZrXimex6F2XcFkok8aFzaqntETsNyefas9MqiYPHVyu7_KFw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:14:55 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 2/5] staging: rtl8192e: renamed variable TXCountToDataRate
Date: Tue, 21 Nov 2023 13:14:32 -0500
Message-ID: <20231121181435.9337-3-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121181435.9337-1-garyrookard@fastmail.org>
References: <20231121181435.9337-1-garyrookard@fastmail.org>
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

