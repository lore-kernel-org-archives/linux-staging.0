Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA00399358
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539474; cv=none; b=sz8Owg9qY5pCIEHEzMEhGyTHCO65cuVLqcSua1NyIhnW6i3HFoc4qawxxNTnXVkcY+Fc3eZ295Y0kkzTWsP4evyQLR8re/K53njS6cyYZ6O+YFGcBV3AQIhucfoa3QOHiOqvKCjmI3zQdO3KS56TnfUSX4pUqAQfikNT9DZ/N9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539474; c=relaxed/simple;
	bh=qFND23HI7OK3ZBakBGCGUpSM8dTS+iBM/RWka+9ImLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRJeqSUAkA2BsQYuCNTRPukbiCxMathd4KHyGaIfTRCwGQdU5DEEd/shtrHIvcECghwSUFJaupJTkFOV+uEV4scTwGXpAXaaPKS7qysDC+yolUs0JSdW798oP8v7+/RDP4m/ahXqivT6wXRl40IZgVx+yFerzGVX44c3FEX8JvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xAh/3Uif; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HyFLvMt2; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xAh/3Uif";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HyFLvMt2"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gN1hn30TDzB0JR;
	Sat, 23 May 2026 14:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27WfgvEAT92suDnxQcNVLQiwNU24NPoTSfmCsGd1dXk=;
	b=xAh/3UifvL/N+Y7w0qhe7F7IJRm8u8EX38BVfhl3Fw3/Xcr8+dxWWFzW3xs77XKk6IObiC
	C2qx17Q2Lhqj13PhrD/9NdahOlBoe7D25FbTD2lnD4p21hHsoerZVbUpagr8XLU76jaXLC
	Ak/31crE6+UQGgNnAXuhQiTTmpcZ0oZYaxd3l7obTzayKv6PR4hrqBZvUekMARfZGKSJvH
	jwnaCfA5Q+XvTJ1+tHEw/Bjd4AzzIkym18RR1jcv2d2QKuOZtEI+gfHBM8OiPVbiajzjCI
	TehUTE8v5wT5h2bqjZMMe2OvqQOBGZp0yEOzztYbzemmyCOPHVAuT9UX10Q0vw==
From: Oliwier Iwan <oliwieriwan@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27WfgvEAT92suDnxQcNVLQiwNU24NPoTSfmCsGd1dXk=;
	b=HyFLvMt2fSu62QyISIj+Ym//SZu6KmNvuPLBxUpbL1HPSdGSBdFXTwNA/o5NM9bdZcTD3n
	OpS5V66DvFZN4ks/r9WtxMACZiW0jXKXILLEauYYUfPSexIYBUisYAhwpWXXPOnU/rG+/T
	4HxNhyy7mI11/9HF36t1ICEA3OlYc+C6u9CQTJDQBJRTBoCoSSIGV98P1WXHH/Y5N3K553
	7ONXIjj2yIKyO+01Q+fb0LSyPO3Q9kMobAJezoo/Ab3i9WUaynLTxM3NsJdNminY6Tznjr
	deWN6pQhl0broKUB06qOLaRKe9/lXW4uSwrNHwqzwdT/JPUQVeR6x7wJqzoICg==
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Oliwier Iwan <oliwieriwan@mailbox.org>
Subject: [PATCH 2/4] staging: rtl8723bs: remove space before tab in block comments
Date: Sat, 23 May 2026 13:30:41 +0100
Message-ID: <20260523123043.22907-2-oliwieriwan@mailbox.org>
In-Reply-To: <20260523123043.22907-1-oliwieriwan@mailbox.org>
References: <20260523123043.22907-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: o53apuqg83mwnzao64ukkeo1pqyyhb8o
X-MBO-RS-ID: 5fa30b2c336bf6b3a7c

Remove the extra space before tab in the BK/BE/VI/VO queue
mapping comments to fix checkpatch warnings.

Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 5473dca13695..1130511859ab 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -362,7 +362,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -403,7 +403,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -420,7 +420,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-- 
2.54.0

