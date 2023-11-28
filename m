Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752875ABB3
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="OsTBx/iU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TJBUZfPY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C5AA5C01D6;
	Tue, 28 Nov 2023 09:20:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 Nov 2023 09:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1701181230; x=
	1701267630; bh=SnX0IS/Z0iVFVy9GbQpy1iXgZuerSwSu+PLsNNHCF0s=; b=O
	sTBx/iURd3X69ZOb/OUYz50BYeE9RA9otJqklPJ7lDZ+A+6LNgHTGFzmzeV6ssEK
	SBf/E751hE8jxWGDA5ZxhWpMW23a8EQNT8iJtEgqt/dEA821C2iloctUXm121yeS
	2UR4dYhNE5rRjT8rjCeNhVHbbOHezYkwe8sWdpRUX8PMf28D3WF1Yeo1cX5LM6VH
	G2HrD6gawc+p6jD0+Dqms+n1yrAoQHcXDDeqtmLPFcB1v7yGhNP6dV089YL67JMZ
	KUxU8R8oMKIcVbENcau68mShjsR4Gx9i36BzMrb//ZYIwDJQzsvA97znT854rF6t
	RmXe07atMFrlN4/6jnLPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1701181230; x=
	1701267630; bh=SnX0IS/Z0iVFVy9GbQpy1iXgZuerSwSu+PLsNNHCF0s=; b=T
	JBUZfPYQDotsumwDR9tYh442AkYZVqJYJYTxIXai6jEy5fdSTGAMZgU0R93xkFTy
	nSUH4N+97/BD3jGH5VoMKhxsLa9AYxTdPQqoA/rQyEolYjEcXwoq47VyvfIe3Jhm
	xZ9CMWbyM5TwEGo+KLmlBJmWo9wjLcTVfsKnwkwsW/Z533vDtp3p2wZUDZrciPjE
	1RhH8NGHx+06i+SDiW9qf7lLVW0HdKzguvkiRf2ZWUoe6je3KTQo+vpL2clgJ+Cl
	1xBp+sjsS2nKIERjU4pJsB8BRenFw0I4/KDJL/N/0mPxpF64Qj3EAxqvKRK/yEey
	HNNg3n68FedQFN/H9nPeQ==
X-ME-Sender: <xms:LvdlZau72vWEjoALASZa_qiXtq8ArCcCuYkpbLuqphKbpL0oPbCgSg>
    <xme:LvdlZfelV8axlCugIoMcgEJ2Q3rAzDSNaZ7lx7TXitxsvoE2ITc2RS1hhzZttJw6V
    p4kyxx2l-J1Lbgdb_M>
X-ME-Received: <xmr:LvdlZVzsgVsnzCTpvBfdLRgTM3CMWLTg8sS719bOPLP07csJT1gsxWhlpRPUjlFPwFn-6Ue8Bv3qwZnKd4lvwYSB8QlqFNyVHQxZs18iO_p5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeifedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:LvdlZVO3X6IsHkVgomxt__OKeUP3EUfmIkf5TDKfH4Fkdcc7FegSpg>
    <xmx:LvdlZa9kPVh_9BuSGvADjWRWFkfo775OZlCHQ-btJUfspK0KWPnuiA>
    <xmx:LvdlZdW0087oVQjXyCaSd3a6NQRpBiLjkQeozrPkc1ZSWOCzDBZavg>
    <xmx:LvdlZRYADHoPNf1DWtHwipDU0cNrQTFSQ3E9k7qiAntX4jc4b869cg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Nov 2023 09:20:29 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH v2 3/3] staging: rtl8192e: renamed variable nDataRate
Date: Tue, 28 Nov 2023 09:20:27 -0500
Message-ID: <20231128142027.15617-4-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128142027.15617-1-garyrookard@fastmail.org>
References: <20231128142027.15617-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: Renamed from CamelCase to Snake case the variable nDataRate,
and additionally removed the Hungarian notation (n) that [v1] did not.
nDataRate -> data_rate

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
v2: Removes Hungarian notation.
v1: Renames from CamelCase only, Hungarian notation unremoved.

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 87e96f2abed0..f263f329db77 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -114,29 +114,29 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 mcs_rate)
 	return MCS_DATA_RATE[is40MHz][isShortGI][(mcs_rate & 0x7f)];
 }
 
-u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
+u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 data_rate)
 {
 	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
 				   0x24, 0x30, 0x48, 0x60, 0x6c};
 	u8	is40MHz = 0;
 	u8	isShortGI = 0;
 
-	if (nDataRate < 12)
-		return CCKOFDMRate[nDataRate];
-	if (nDataRate >= 0x10 && nDataRate <= 0x1f) {
+	if (data_rate < 12)
+		return CCKOFDMRate[data_rate];
+	if (data_rate >= 0x10 && data_rate <= 0x1f) {
 		is40MHz = 0;
 		isShortGI = 0;
-	} else if (nDataRate >= 0x20  && nDataRate <= 0x2f) {
+	} else if (data_rate >= 0x20  && data_rate <= 0x2f) {
 		is40MHz = 1;
 		isShortGI = 0;
-	} else if (nDataRate >= 0x30  && nDataRate <= 0x3f) {
+	} else if (data_rate >= 0x30  && data_rate <= 0x3f) {
 		is40MHz = 0;
 		isShortGI = 1;
-	} else if (nDataRate >= 0x40  && nDataRate <= 0x4f) {
+	} else if (data_rate >= 0x40  && data_rate <= 0x4f) {
 		is40MHz = 1;
 		isShortGI = 1;
 	}
-	return MCS_DATA_RATE[is40MHz][isShortGI][nDataRate & 0xf];
+	return MCS_DATA_RATE[is40MHz][isShortGI][data_rate & 0xf];
 }
 
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
-- 
2.41.0

