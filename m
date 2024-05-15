Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9FF54BFE
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748769; cv=none; b=etPtVEz8ujMTZONFKPHhEsEjthygQdGMPkjfCYzSmSKXtPAiYSQShRdqbz/LGfUOygpBooW8kDdqe8702D+895EjDGoGHldaVzdSP6c3zfBrqKHu/MZjZ2xRv6SQNfyFjLZRo1ccWyBAKGbO7IkkojM09cAyrRXatoINHs0Zo+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748769; c=relaxed/simple;
	bh=kmfTsVVKKi0K3wI96U4qSEQ5mx4UjunkStIgtro1AxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GgSx1BssmvJyL/EtQUy38tv4QM70/MR6fg0ziPa6ADgB+/7W5ViWTZdL6n1HKlS/iW/83Q0JS+92iW+CNd8e2LfhFaXGYiFGJ7v9eR6hEQfdYIkg4NgpiLaR34JTzrliX2I3dXabyBoZxPhVRq5wrxQ6qw46EBY/rP9xk0EFsU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=NwMBgSV3; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="NwMBgSV3"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c996526c69so3268511b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748766; x=1716353566; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO1LlzefJj0jEx0cVt/CtzEv69TIbxurb5KVwdnmKgs=;
        b=NwMBgSV3GpRLow2Vxn+cS4+RfZOc7OvMEfSXNXyS26q8DfMcxOgQdg9QZxJ2+oVnHd
         9dJaUlz1A+FhygR52803p9PW134O/fMJja3R9o8rKo02kDY161TkFJmWXUEO9kf5V122
         1JFWiCPzhWlaz2qjTqFzXVqRrbs+/m+56dKPaT6MXFLCdvgdeN8Q13/qceIcKwkyltTr
         dO+RDaoH6TooENgdPrWB6twT5Z4Fy5xo9MPRmSpZ98aikJJz1Mju+AYFH3/O+DtqyTSf
         y/w2HfbLiswVkliJBwp1YHn/n+w82XcH6UrU0CnZ5QKnSmNhgdbdXx2xrPLeyBsnYZTc
         Rs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748766; x=1716353566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SO1LlzefJj0jEx0cVt/CtzEv69TIbxurb5KVwdnmKgs=;
        b=I/zJo10nbYAVSiKKyWsHAzlM9SMP03bpNdO91pikYkiVEAv/OMYGlQQg8mr6Y47SF9
         HD7XZVF5kdLtHSHrwmCFkzgWwUf7pFbCHiFOC60eCbQqI/4deOiz0yBWnV+E7tSfMsRe
         kymZOIdyEuUH2OHfsyfRbiFlWat/I4tw6tlHdnmiSWSAl5V0y0LfFnzyfPCgORRd6eN4
         3t2l9JkR7ciTWIC0Pu4OyUEDy7WsXxeymucLqNh6OKmH0ZuUO//U+1Nk2gwxkXdx/Yqo
         FFb7QMH+/TU1hHDYc8aerWs3TWNhh2loW0c1cmpF6yk6MfTGFUfLqEhKHlz2YjElhKV1
         w0Lg==
X-Gm-Message-State: AOJu0YxdyKR8vK415cRcT/NVau0IW+On2Ge/hUSkf7VcvpjiFdgwgLIw
	jeLNwcbPNUcozWmKuZLxV1yZolwI75AnCLeoX2Hg5z61WvZ5fUFfsfHO2lnkUMg=
X-Google-Smtp-Source: AGHT+IErgHwGe3H39DkA2kst51IXK2X5EEwrOaq4xszCJiJUnT99jfyGTZo7CdqMZ0jgaBlobKy3ig==
X-Received: by 2002:aca:111a:0:b0:3c9:950c:2227 with SMTP id 5614622812f47-3c9970cc742mr16098502b6e.45.1715748766601;
        Tue, 14 May 2024 21:52:46 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:46 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/31] Staging: rtl8192e: Rename variable nPadding_Length
Date: Tue, 14 May 2024 21:52:14 -0700
Message-Id: <20240515045228.35928-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable nPadding_Length to npadding_length
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index fb679229f173..0db75fa7da1e 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -732,7 +732,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	u16		ChkLength;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
-	u8		nPadding_Length = 0;
+	u8		npadding_length = 0;
 	u16		SeqNum = 0;
 	struct sk_buff *sub_skb;
 	/* just for debug purpose */
@@ -833,15 +833,15 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		skb_pull(skb, nSubframe_Length);
 
 		if (skb->len != 0) {
-			nPadding_Length = 4 - ((nSubframe_Length +
+			npadding_length = 4 - ((nSubframe_Length +
 					  ETHERNET_HEADER_SIZE) % 4);
-			if (nPadding_Length == 4)
-				nPadding_Length = 0;
+			if (npadding_length == 4)
+				npadding_length = 0;
 
-			if (skb->len < nPadding_Length)
+			if (skb->len < npadding_length)
 				return 0;
 
-			skb_pull(skb, nPadding_Length);
+			skb_pull(skb, npadding_length);
 		}
 	}
 
-- 
2.30.2

