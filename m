Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2ECD2E3
	for <linux-staging@lists.linux.dev>; Sat, 25 Nov 2023 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="MjLIBaIC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vAUrAbJ1"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A3A8E5C01AB;
	Sat, 25 Nov 2023 17:34:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 25 Nov 2023 17:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700951692; x=
	1701038092; bh=ssOlEj90pdgndKi1MAIl78WiIv77fBeBEc8NIZVThW8=; b=M
	jLIBaICww90ki4XOKinnXwvdh1FY3VmoUFhO6PE5dRRGJGZbK6D43WWRrEEgMAwy
	UbKi8Oevnon+Fsz9ykFPyullR1roWMRwE7Y3cHHkIUpX18DuenxwaiwkPhMBy24E
	JpBtXsORj/l+br0iqoxPPePcfVjAo7qKck0ve1je4JHCP/9hXOUeu4OcFKOezIBH
	+m0qbBYAXxYD3YJubn/QChlfaHQPL8vct3xRQUsK9ovbGDbWwUvSYSn21X9a9DfW
	HvmzVaa/FmisaOv9QcRx++g9dXM3MPl3T8jxGjnjIn0SJRhFTRMDrYJ72y1f/uuj
	vlHDEXAqgZOfL+Z8dBEQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700951692; x=
	1701038092; bh=ssOlEj90pdgndKi1MAIl78WiIv77fBeBEc8NIZVThW8=; b=v
	AUrAbJ1/voQZ9YLJiIkCnbyGUgzGHmTvgetqTrluuc30FA0x7nAsA6nreG7SGbqD
	JwM8SfOz0ltLf0qQjDQ5pDmkZY4aNQBAWWwnCIB4wqkzu/FJjlVZ95wyVTyWIJeg
	fe2bk6gLlMXSdD8DrGR6OsyHRBRwBupedO+qwJ7+a+uUg7vH2Y9fCIPtPDJ/v4Zy
	HwAz2Dj4V7WtnrGbFjD9npO8i50z3zD6nxvhaH7MXYJR3n9mPiCBmAeJGw4QhBJO
	LMLLeDXbihjLc4Ylua2Ypw9NBlpmPxOPASbv3PJxnbGwtC88K3TAMLkjI8rXtovs
	BYGUNEaP6GlpTJJ0ji3xw==
X-ME-Sender: <xms:jHZiZTjO7z5cWPHeWrRGByYev0ntfeGHtLpdWaFitd-N2QYzLbOpMw>
    <xme:jHZiZQA69zIFgtfPE2zyOHBesT2pd63UoYYpFoadINxFNo5Ke2K59vpqdspe0nJMz
    M4VMOYhslim3KXJbOU>
X-ME-Received: <xmr:jHZiZTEKwECPGqNHuhkK97v9vdLVurXYX82mk1lQw11-6E_kqb3Cr7fWsTZFCGcgSwTS0j_WQj6bq7blFvINfoRfMwmCI5beddbuYOApTo6o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehjedgudeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:jHZiZQTJ-0JZFosRQjiZv4V91nIYXEtyN9vaHfJbctUe3LRwlP1AZA>
    <xmx:jHZiZQzzwb9V0un50kvnNdmv55GeClhRUwhC0cPzmiyPNeEHzgy1Ag>
    <xmx:jHZiZW7g590XhHsZFosb9xtlvla1aMHp-mI5SOiYjNuTRcKoqonNOw>
    <xmx:jHZiZc-l1kapJ9ABSOY-tnTlzxI6xmB0uT3l7jVnJG_AAbNRthDZgg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Nov 2023 17:34:51 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 5/5] staging: rtl8192e: renamed variable is40MHz
Date: Sat, 25 Nov 2023 17:34:32 -0500
Message-ID: <20231125223432.13780-6-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231125223432.13780-1-garyrookard@fastmail.org>
References: <20231125223432.13780-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed from CamelCase to Snake case the variable is40MHz.
is40Mhz -> is_40mhz

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8291e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 82681d21ed2b..606dc54d0f06 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -107,36 +107,36 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 n_mcs_rate)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	u8	is40MHz = (ht_info->b_cur_bw_40mhz) ? 1 : 0;
+	u8	is_40mhz = (ht_info->b_cur_bw_40mhz) ? 1 : 0;
 	u8	is_short_gi = (ht_info->b_cur_bw_40mhz) ?
 			    ((ht_info->bCurShortGI40MHz) ? 1 : 0) :
 			    ((ht_info->bCurShortGI20MHz) ? 1 : 0);
-	return MCS_DATA_RATE[is40MHz][is_short_gi][(n_mcs_rate & 0x7f)];
+	return MCS_DATA_RATE[is_40mhz][is_short_gi][(n_mcs_rate & 0x7f)];
 }
 
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 n_data_rate)
 {
 	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
 				   0x24, 0x30, 0x48, 0x60, 0x6c};
-	u8	is40MHz = 0;
+	u8	is_40mhz = 0;
 	u8	is_short_gi = 0;
 
 	if (n_data_rate < 12)
 		return CCKOFDMRate[n_data_rate];
 	if (n_data_rate >= 0x10 && n_data_rate <= 0x1f) {
-		is40MHz = 0;
+		is_40mhz = 0;
 		is_short_gi = 0;
 	} else if (n_data_rate >= 0x20  && n_data_rate <= 0x2f) {
-		is40MHz = 1;
+		is_40mhz = 1;
 		is_short_gi = 0;
 	} else if (n_data_rate >= 0x30  && n_data_rate <= 0x3f) {
-		is40MHz = 0;
+		is_40mhz = 0;
 		is_short_gi = 1;
 	} else if (n_data_rate >= 0x40  && n_data_rate <= 0x4f) {
-		is40MHz = 1;
+		is_40mhz = 1;
 		is_short_gi = 1;
 	}
-	return MCS_DATA_RATE[is40MHz][is_short_gi][n_data_rate & 0xf];
+	return MCS_DATA_RATE[is_40mhz][is_short_gi][n_data_rate & 0xf];
 }
 
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
-- 
2.41.0

