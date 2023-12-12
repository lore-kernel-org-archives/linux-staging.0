Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6807B3A3
	for <linux-staging@lists.linux.dev>; Tue, 12 Dec 2023 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="h7oOO4OT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IZEbm2k7"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B94A83200AB1;
	Tue, 12 Dec 2023 11:56:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 12 Dec 2023 11:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1702400171; x=
	1702486571; bh=S72tWKUns9afSXndZ/MSiOmUd5W9n0rvW6OunSV0Fe0=; b=h
	7oOO4OTjKB0q9x5ODhbEQ/MfIADXxV6B4fDcZDL4x7rOKVeN/Wvk7HdXjQVs4cU1
	ILwDlMt3Otijbuel2LUXMth2JQ9VLz3v2Rmb9o1ZDRnnmZ0b9hDiX1S+SRmdWqu7
	LgnbL0ScStYDO+edYlNEhT0qn5M5Pgs31JLuf/K+HAZPwEGsA0B2vh8x7g6JQU9C
	QmlKKtAFMGuN82mCcGNcA7miWl3wfN0JEzarAm45UEq7UWahsOZE3c0xQ9x1b6Sr
	+t25EFl9rlGzvpP0tz181bEQOPcQb7mxCq4VgWHyBBhlyRp8AghFe3fku6hAPgIs
	Kkg12uKjkjEXA3+budEWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702400171; x=
	1702486571; bh=S72tWKUns9afSXndZ/MSiOmUd5W9n0rvW6OunSV0Fe0=; b=I
	ZEbm2k7ir7AfFt5SufdrIOIwh8i5X0KoWSWZQ+KfLw5qRBfIXMA5xFYr1ZvwuSEk
	4Yz5N+9HEfhyxUBzeDnu2fRxD5VlLynkZRvS/HCSvEwWkitcta2u8pVH0g2516U1
	ZcI8P9oMgyl2GAkQR7EjXWBFS32+33euxfwtmwKx1qFCEjpsgDjvV8ipMfHd31F0
	YeQJj0IX//QMxRyANwxs13hSWPDMQx+Uhg77gDzLAaWHeOjrEy+1sQ0a1lg6LCb+
	3nLDdSB0d1UR4cbX38PduB4zcgw6SXskCUSsLCC+r6O+n5vTpGKCPslS5jfaSOJ5
	C6Jr6xsLJ0to2iP3zrDQw==
X-ME-Sender: <xms:q5B4ZVekydCxrfsCPO1KXTIGPfr8TPdxYVKNlmlLJ5Vg1juUk_LT6g>
    <xme:q5B4ZTM_q0n3fa0tMelJOpw2g8fjSbiYyxqJNP9CuT_jjE8OiBJYYYBUNoDcszFat
    LYRBmpUmiaX9_kaxJo>
X-ME-Received: <xmr:q5B4ZegSFq1Rk-DgUePXGkU9CDOoeZz14XU1ae17f_qM99gKhSrPgBuiaMIQH_TQbQinoeSz44WWxd_tO2MxKN10xguCCgb4TGbduoQV0uY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelgedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:q5B4Ze_oJWojAHP-Q2jqimV26YEqwteDIcPP7MDQj7vpUtCl5BIPRA>
    <xmx:q5B4ZRusAnzUS3uRGZgA5ab4wQa-sAk8Yiq4gYvHGEtIN222hoa_3w>
    <xmx:q5B4ZdEljsevsVpdTKmQRPPdYwbBi2YcYxGYZPLmB2d0RF9cjJGE-w>
    <xmx:q5B4ZZIUrS6V3dH2OJ3Gg_-IfkjshMitmmbJKnPspqjbGJorqteokA>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Dec 2023 11:56:10 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 2/5] staging: rtl8192e: rename variable IsEncrypt
Date: Tue, 12 Dec 2023 11:56:34 -0500
Message-ID: <20231212165637.17618-3-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212165637.17618-1-garyrookard@fastmail.org>
References: <20231212165637.17618-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. IsEncrypt -> is_encrypt

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index eb798a3a9052..b6e9b7e000ef 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -248,7 +248,7 @@ void ht_reset_iot_setting(struct rt_hi_throughput *ht_info)
 }
 
 void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
-				  u8 *len, u8 IsEncrypt, bool bAssoc)
+				  u8 *len, u8 is_encrypt, bool bAssoc)
 {
 	struct rt_hi_throughput *pHT = ieee->ht_info;
 	struct ht_capab_ele *pCapELE = NULL;
@@ -294,7 +294,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 		   "TX HT cap/info ele BW=%d MaxAMSDUSize:%d DssCCk:%d\n",
 		   pCapELE->ChlWidth, pCapELE->MaxAMSDUSize, pCapELE->DssCCk);
 
-	if (IsEncrypt) {
+	if (is_encrypt) {
 		pCapELE->MPDUDensity	= 7;
 		pCapELE->MaxRxAMPDUFactor	= 2;
 	} else {
-- 
2.41.0

