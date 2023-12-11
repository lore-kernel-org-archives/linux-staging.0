Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF019A
	for <linux-staging@lists.linux.dev>; Mon, 11 Dec 2023 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="YPiD4QAs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0bc3M0Ii"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 3FAC03200437;
	Sun, 10 Dec 2023 19:13:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 10 Dec 2023 19:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1702253590; x=
	1702339990; bh=sFGKShzabhlyuVSSUy34jDemRKcuuox+OoL+c4F1AtE=; b=Y
	PiD4QAs86cHyIgE6iQ5hApgl0RJLFJcCzlkZ1dl/NKEOir7hgziSfL3oyTpz1qYB
	lUB9oGpjJKfYLzJCLsyRHUDzQAlM0PMLCGMytv8bStewsSAD9bCitZ+abRPkD2Ce
	QG3QmfTIcs7okglTJJOdNcx+dOK+F1IbSE5e/Z/zOWL7tp6lci/HPzkt38IU/JXM
	TQKtk0f/A/BrxX8MGbOjbQToWRos8dj8ZRATk+ysFC+gxhDEXPzcDCM2QOTg5x/t
	cko9aIg1AMZfMMz7+0R/yzv9i2OluAXFP3h3BT+joChgG8FMBNfp6jhWMjjE7N67
	vjfO5OrFlpNj3eCkNRjag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1702253590; x=
	1702339990; bh=sFGKShzabhlyuVSSUy34jDemRKcuuox+OoL+c4F1AtE=; b=0
	bc3M0IiBqoDnUxnaTzEQ46sWIYBeja7IVRWC1Bbzfg1G+VZfLe2d07vnqhaFgB9T
	p5FdA3D80fnu+GYvKaKbSfGz0QMyhbw0t36olWZ/gmUheAkn9mvBAr8f2bO/+yxO
	7SLUqLhs8e5Exitri+IqeyXsk5FQaZL3ax9xDcaNGPQs1GA3WUCwjrdVGkmAXWfy
	XWl6w1GGvRbXegG6Y9eI2kqV+nHTyTzo5L3nANsfCo7h4OAbiv1acsl47ylsW9uC
	BR4xJ7tG9g67iN9dpeFo2tWuWou5elqCzMRLGvCqPqjGPsPexvX8SIC2X7640NvD
	jIa98ACLIG3yRytpcSSyg==
X-ME-Sender: <xms:FlR2ZePj3EarnYglFu092sDQTlFWkuam4Hfu5V5GgsakJTTigxZ-Fw>
    <xme:FlR2Zc8VBdgqb7sC4D1WMeptrq9UV0DzTPV3Q9i7xc0A76GasE5RSxSeTU0tbW3Ro
    YJNv7shv0b7Wl2gq0o>
X-ME-Received: <xmr:FlR2ZVSb9h-N1kdy9loAFOZwHHhMlHG0lNS1wIXWuYl5butN1DZlFzshXPknc4ulKxQAJoK87jezJF99hr_au1CJS51MeXqdxtdmMu4VDyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeluddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefirghrhicutfhoohhkrghrugcuoehgrghrhihrohhokhgr
    rhgusehfrghsthhmrghilhdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuvdffueduke
    egieeuffejhefgkeetfeehueelfeduuefgveellefhfefgjedvnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghgrrhihrhhoohhkrghrugesfh
    grshhtmhgrihhlrdhorhhg
X-ME-Proxy: <xmx:FlR2ZesG4XlT5LXITj5xlX4Mdut6UnAsXWRr5jxYwKRKDu0L7HY1cQ>
    <xmx:FlR2ZWfY7ncY7YeN7VSWO3IuglIXFed3-FZa24L8O1ewRFfIYYyAPA>
    <xmx:FlR2ZS1K-fj0qVHeyhQpWabceBPzXY9F7zHjVAk0Sf-aKDPmTk98wA>
    <xmx:FlR2ZW7oXX6Cp3Le1pBOHQk99siIQNjNM4UAc6kZmHi3vtc-cDZLyQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Dec 2023 19:13:10 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 1/5] staging: rtl8192e: rename variable HTIOTActDetermineRaFunc
Date: Sun, 10 Dec 2023 19:13:31 -0500
Message-ID: <20231211001335.26169-2-garyrookard@fastmail.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211001335.26169-1-garyrookard@fastmail.org>
References: <20231211001335.26169-1-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Coding style issue, checkpatch Avoid CamelCase,
rename it. HTIOTActDetermineRaFunc -> ht_iot_act_determine_ra_function

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 99626be899fd..e155a292f6b1 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -227,7 +227,7 @@ static u8 ht_iot_act_is_ccd_fsync(struct rtllib_device *ieee)
 	return retValue;
 }
 
-static void HTIOTActDetermineRaFunc(struct rtllib_device *ieee, bool bPeerRx2ss)
+static void ht_iot_act_determine_ra_func(struct rtllib_device *ieee, bool bPeerRx2ss)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
@@ -536,7 +536,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	if (pPeerHTCap->MCS[0] == 0)
 		pPeerHTCap->MCS[0] = 0xff;
 
-	HTIOTActDetermineRaFunc(ieee, ((pPeerHTCap->MCS[1]) != 0));
+	ht_iot_act_determine_ra_func(ieee, ((pPeerHTCap->MCS[1]) != 0));
 
 	HTFilterMCSRate(ieee, pPeerHTCap->MCS, ieee->dot11ht_oper_rate_set);
 
-- 
2.41.0

