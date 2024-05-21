Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7326A6BB5B
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261456; cv=none; b=c1qnMK9VbWKoIDlrK+K/rIn+QhC/Oo2vjK6w/CCtWgFO8BhV0+t67nRTCLEK9WYea9ioqcn705bOu8uvgPlMnmS6cU9PHJNMvZNdooSuMrAd2ecCjA5UZaqY8D/UGt+kPCC0ib3UhU7h+LG69g6H/CgPNP6nBHgnldCf1/481nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261456; c=relaxed/simple;
	bh=Qp9Q2ISvQlMozzVKsSzgcrAnhyylfHKJ2ip+J3JJmPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bVvPzagC9+CdTeB6wYgkQVGn7Z96qsGWPa0RhqGOHJFMT8CV+F/KMYvQPKP/hK1FTAata0r3xqvu5KdCrN4ZycCMHADW7mJLBuTF4pAC3yKe6kEo2iVdcrAdexR3Hr8o8JJbyXgY3Kn15vyfDNdVee4ANUejWwY1Hl1oytOvIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gC3kgpMj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gC3kgpMj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f2ecea41deso88490375ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261455; x=1716866255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htW5kSCHk6pUg/aASaEh06kykYiS1exLSGkKV91xbbE=;
        b=gC3kgpMjH4P9rFkJrfG4xJ/OAuCe2BV9FxfoiRaFaPhE68RpGTkYu017zYEekPYv5+
         1JWNo2e96SzVSMmq0CG2L4OIgEeeTIpI+Ce3KwVyu16Y3n2QLwiTiB4jo4KTaz8Y5Koy
         61p5gmo9nqCHdMYHymCbAC8UdbObCRux5bcVl8YsVXbevvoGGFoX8AJ6012KYkj+qRH/
         9Bo+sJ6bvBN1KKP6T0EkDBefcSo6NB+ecFmz+Y/kJjbdXMoG3rjQyf9/ni1KJ6zd2adR
         wNSbSV9hCrRTbvGeGqCWM4rpTFIl3TyG7xYPNEq/0eYqp4qGmKvcTsASs0YBmmjkFu8u
         Jydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261455; x=1716866255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htW5kSCHk6pUg/aASaEh06kykYiS1exLSGkKV91xbbE=;
        b=ogSk6BdCmlamSef8L8zD7+AT+om4WQP4mZEhJSbfjEMiwERbvPx56ku/aWUTmmmgUl
         7agzB4c/rY2sEgzg7g5KtdMINDsrQK+ao/9nfK+aI7Cz/oc7MjzN5CSNy9wb6+vuvuEU
         prROB1MmUXbI1gk4qlZUpTuiuddcSENbKEiOFdaj7gDh0FbE2+GI6q5mqvVZMCrSgg8e
         swdg9H2dQ6TbwKDG0pW1dJ9z4KfqF9lREuFwnIQTSt0I3i8kAy4itylIHXs+loK9BBOH
         pyk9yllo01gzJST5EBoC9gFz28IIhGfoZXZH7vL5NXHMQVOvvzGm6cmdA01OXoQP2VNH
         vVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV74Od4jEHDN2goarPXbadIaWIpOTG12e+q5oaKz7KtQOethXE3xYaj3W/PdgR+zwe23LqhbIZa9jIiNsGNEdIG+sTyMFCHEzWogR6SAw==
X-Gm-Message-State: AOJu0YyuUnttBuhfdR6fN6FrKVxbJIdt9ISMG0aAq4j4/aEa6bmphOch
	tJe4My8AyZkvrTySB/BCMq1UpHVmvHAA+wdl9tdJxMt75L7ZMwIYEtPEMGzZpHk=
X-Google-Smtp-Source: AGHT+IGDe74xf+ez6yX8mWjW+mXFftRFrHLChSip7NgL/qCcpWcipNqs9VMkv2lF5lXZTBDSviVZ5A==
X-Received: by 2002:a17:902:ec83:b0:1f2:f0d3:db30 with SMTP id d9443c01a7336-1f2f0d3e367mr91334535ad.64.1716261454829;
        Mon, 20 May 2024 20:17:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:34 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 17/31] Staging: rtl8192e: Rename variable nPadding_Length
Date: Mon, 20 May 2024 20:17:04 -0700
Message-Id: <20240521031718.17852-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable nPadding_Length to pad_len
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Rename npadding_length to pad_len
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index b1cb73c2177d..c32eec733373 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -732,7 +732,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	u16		ChkLength;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
-	u8		nPadding_Length = 0;
+	u8		pad_len = 0;
 	u16		SeqNum = 0;
 	struct sk_buff *sub_skb;
 	/* just for debug purpose */
@@ -833,15 +833,15 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		skb_pull(skb, nSubframe_Length);
 
 		if (skb->len != 0) {
-			nPadding_Length = 4 - ((nSubframe_Length +
+			pad_len = 4 - ((nSubframe_Length +
 					  ETHERNET_HEADER_SIZE) % 4);
-			if (nPadding_Length == 4)
-				nPadding_Length = 0;
+			if (pad_len == 4)
+				pad_len = 0;
 
-			if (skb->len < nPadding_Length)
+			if (skb->len < pad_len)
 				return 0;
 
-			skb_pull(skb, nPadding_Length);
+			skb_pull(skb, pad_len);
 		}
 	}
 
-- 
2.30.2

