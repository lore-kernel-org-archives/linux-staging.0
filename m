Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306172208C
	for <linux-staging@lists.linux.dev>; Tue, 21 Nov 2023 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="Snml3+dQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cwXRkNHK"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id E57773201A66;
	Tue, 21 Nov 2023 13:10:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 21 Nov 2023 13:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1700590216; x=
	1700676616; bh=hopG2M/LEQ0YkzvfYVZfqXAwYlgWV1Hj2Np8CK+F5ww=; b=S
	nml3+dQngMvnAfO8H718MyjO0HO3oke65JvD9vqUWmM6UGOQhTQnS5GRj1Xl/BZI
	c4BGs1Yh/QnHUDBUchDiekh08pmtaELNS4bxoPnSH5kTWlgr6GVND4CIK7n3Wnap
	7OKVzTzgSpJZeuc8mxziD5h25YdnYLr2rgkrCFZ3wnM8y5N2m4tc/vVnDkEXw7H+
	6ugGM4yGI81Zegsz6nz/5Ehlu453n5Vsk94xXnzwMb1Ry9qNyhgOV6m7G0u9OSJn
	p0UvQoyyvTZoOGBcg858y0zMmr6+uIU1E5rufY6O8gE/d4s+dFj6B6LV3RF2mFYJ
	tdpvdVPAUeyvGl6r5hFGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1700590216; x=
	1700676616; bh=hopG2M/LEQ0YkzvfYVZfqXAwYlgWV1Hj2Np8CK+F5ww=; b=c
	wXRkNHKhhyIcwHj/CKZtMim5MarEs4Syj7tkJsPt705/X3FcPLexxXcSHTwoMlHB
	Fs3rNci4DfQY17JOnNIwYM9VTENOSScerI/GDninjDCayaS8L5KoWVVsRzAGqESD
	/cQJ85l0Ey74Sbe2hl1g6CIMxxANKkqUTqqaphgIeYOwmAAWIQpdDFXtTuQ8gcni
	AkzmlcgLx8zD3Pq+ewj8XS0IG25ui7VTOcxFvR4H51ePRqZpeRimHTP40qW6AJPY
	/vqZ5KpH80haKpPy+EVWKpJJEUcf7bcHwvoBvz5lyEOuNON3qlr+KZuFQcWPPreZ
	f79VQs9WQsWKgJH7vk1Vg==
X-ME-Sender: <xms:iPJcZYhs0EVc1YG5EBg0X0hMd6vcGxF70o7uN4TwLDBdei82tzwjxg>
    <xme:iPJcZRCClkADKmWj-8vmS049p1MQ8Z0YVWPip5UPOJEcLCEKlCYO9YCvtsxVrDDNn
    ygu0kCozgvKmN6heqo>
X-ME-Received: <xmr:iPJcZQEZEHd0VLYyGwoUxVg1BpE7KORagH-5w5PF1teRRKCVoSIPyXTOm9j3ecic5cr2yGI_icPhQMNJqqih8YExEQu7LaPQ9j5RU17ROCr9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudegledguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomhepifgrrhihucftohhokhgrrhguuceoghgrrhihrhhoohhk
    rghrugesfhgrshhtmhgrihhlrdhorhhgqeenucggtffrrghtthgvrhhnpeekuedvffeuud
    ekgeeiueffjeehgfekteefheeuleefudeugfevleelhfefgfejvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrhguse
    hfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:iPJcZZT3IFhDT0BfoOgncTm3p97EKvvS9Rhz0gzC6IdmciR1Pj0mcQ>
    <xmx:iPJcZVwmLPV781csStwNIKlpV05jVxjve9Gw4hy_to2WQ_OWQ5tsBw>
    <xmx:iPJcZX6Z-bObS4qF8hfFQ07omr_O8r7ItMjC3T3-fggucus12jmaJg>
    <xmx:iPJcZd9wYJDrBoMfKwASsMiwqesJ0I98M-Fi-S8GfEkkjkt52y-LGw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Nov 2023 13:10:15 -0500 (EST)
From: Gary Rookard <garyrookard@fastmail.org>
To: gregkh@linuxfoudation.org,
	philipp.g.hortman@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gary Rookard <garyrookard@fastmail.org>
Subject: [PATCH 4/5] staging: rtl8192e: renamed variable HTIOTPeerDetermine
Date: Tue, 21 Nov 2023 13:09:46 -0500
Message-ID: <20231121180947.9223-5-garyrookard@fastmail.org>
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
HTIOTPeerDetermine.
HTIOTPeerDetermine -> ht_iot_peer_determine

Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
Driver/module rtl8192e compiles.

Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0993263c13d3..0873c19ca051 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -164,7 +164,7 @@ bool is_ht_half_nmode_aps(struct rtllib_device *ieee)
 	return retValue;
 }
 
-static void HTIOTPeerDetermine(struct rtllib_device *ieee)
+static void ht_iot_peer_determine(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rtllib_network *net = &ieee->current_network;
@@ -672,7 +672,7 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 			ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 		}
 
-		HTIOTPeerDetermine(ieee);
+		ht_iot_peer_determine(ieee);
 
 		ht_info->iot_action = 0;
 		bIOTAction = HTIOTActIsMgntUseCCK6M(ieee, pNetwork);
-- 
2.41.0

