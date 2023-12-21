Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9483156D0
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="cyJosTxS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D83CsHQr"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 36BDB3200A0A;
	Wed, 20 Dec 2023 22:12:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 20 Dec 2023 22:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1703128362; x=
	1703214762; bh=0bq2fN9Uza31d9KmzZhN4ub+BZ6fkGAQSHJ72vJy0/s=; b=c
	yJosTxSgI65uFiKESvepvdG+axqYOpqzcBSw173RzBZ8y0gZ2jF/bRLKJvamOLjy
	OwK21UxWsveR4kEZeCvtkDwzUmF9kuXGj3sL51fH3Mf9C5O5Wa2uVdscrJubNRVm
	2fjNn3rbiT0MQt9lwYVa+69TOageza/MbWP1k4u/e4ev52Tp8+l3opv3O8wxOy2V
	J/rPUPZ5Dc+A6wpIjz5OU0DJ6DhSKnFm43Y8Nbto6OgieXGgId+2zX1gA3h10P5v
	rk0jBvFCJUpWFm8vSuYkHSaZaW1BdrCdZ0ulv1tlx0BgXXHMMw1HJDZvHSlaLq+b
	MFx4VlRfvWWnWdoUXsWAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703128362; x=
	1703214762; bh=0bq2fN9Uza31d9KmzZhN4ub+BZ6fkGAQSHJ72vJy0/s=; b=D
	83CsHQr5+ScJYMlkebknJK35UuIB/f7ctsFeQwITXcqJfm1esXoc8FShSWMzigk4
	6i3k24bmUL67yZ+F1v6hg4E/N0QKwdHXG2pTI2LkSwjoomR4wHFoj3X4/24tEsHy
	fbVmPWtBbcanB91F+dvXoWwVhS/BrPx/6Wj1g3Cd2hFWrnbuEOXqALkt4drFtKhu
	eK91AZf07N0Y2fvkgDISjKyziE8LmcKjISlz5QM5BsfRtdW/y+bA8/sMsuFLMZUG
	uvr3sxi/C2FgSYdfq8oKapyhlOcbC8Sd1DQ2JxZNAhSvtKEN62tiwIiY5LR4GIsl
	QCwNV+jRyQ1cWKtwNEI2Q==
X-ME-Sender: <xms:Kq2DZZYZGokyZ2ibZ-390sFXDXJdv2uSMpIQfMQDZobEgz3PMo08Jg>
    <xme:Kq2DZQbFV8UhJBzCtKpJJ472IgG6zmzlWqJfJFbRx8SuTa41JVURxNlaSW3aMtmD0
    TkAik2JWIBw2yeK2xw>
X-ME-Received: <xmr:Kq2DZb-fSq6IOiVgj0Stv8Wa806ATNE6kscgPBNRR6urGVM74wzY7wnsrsh0AY4iUGzqXN06BMyQKw8Xc_psN-zla0W2yAeK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddufedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:Kq2DZXoKQ2w7GcL9-G8lPN2iU8tEL-GIBOy369TsI8c1mW5aK5DmcQ>
    <xmx:Kq2DZUrWsARtIR7ga0Bl2k78KaVmSVQcVNYztDzXHTCkHSxCD91GYQ>
    <xmx:Kq2DZdRV8BhhW5DZPXerIpkw0mQabYIAygLsZC2VcQG5hta-ZNcWUQ>
    <xmx:Kq2DZRArH_3wBHe4EUzwF_WOBS2cxrjLHu7EO7Ez-okKXNOa_s3Wwg>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Dec 2023 22:12:42 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: grookard@yahoo.com
Cc: linux-staging@lists.linux.dev,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: rename variable HTSetConnectBwModeCallback
Date: Wed, 20 Dec 2023 22:12:58 -0500
Message-ID: <20231221031259.14853-5-garyrookard@fastmail.org>
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
rename it. HTSetConnectBwModeCallback -> ht_set_connect_bw_mode_callback

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 5698b48fdcc9..ac17d510a2a5 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -633,7 +633,7 @@ u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame)
 	return false;
 }
 
-static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
+static void ht_set_connect_bw_mode_callback(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
@@ -695,5 +695,5 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 
 	ht_info->sw_bw_in_progress = true;
 
-	HTSetConnectBwModeCallback(ieee);
+	ht_set_connect_bw_mode_callback(ieee);
 }
-- 
2.43.0

