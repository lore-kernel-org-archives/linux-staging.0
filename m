Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2C80031
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162572; cv=none; b=VK/3J9MYUmZuWQwRb9eG/CvWKBZY4VRCgQFtysCGuu8LaoMO466zj1DYPy0rH4wdi9Go9+nuHCQ4DwH/X8qP4FwIjNzzfI00jiunAqnL8mjnYw4IJYHFL+LsLXYZ/LGu9RPcmZgx0xpq719tT1Uynq/ACMZvFhRSurte9RT1xDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162572; c=relaxed/simple;
	bh=mipjevFOZ2dmGJOw6Kz0lN3TbrBvmglYVOnhL96glEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dxxrjUpjzICja9YrOS5ZFayE0JDG9e0UowteKQ3yl8E3yTVO3SVDZw+L63zdXSYUKQPNa+FBF3LsYv5J4D1/xgqlguTYhT3hO+A+MH4W/2ESu7d58XkrCUXHIDz5XB8BUpZkWQEs755upVVFLV4j0ofRgFEuezofmjk/w9qcOTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=freNZ6KW; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="freNZ6KW"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5bb36de2171so322585eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162569; x=1718767369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mN2Oo5HuRfYFaYNQRaLC/1WniMLC8Zh3ZlO0PShWS0=;
        b=freNZ6KWqhgCczip/yvvVsBKQjU1vSyIy8tA1Nyhx8KGHiFHAhuDV6AObWlqMRBnuT
         yJuUALO+Lh5zDMEZqaKYMGbOreprSSqtdlC9jK8RGmBI004gI2uTawtS/HScZNs/swUO
         dYGARcf7Nef/CvZ3UzjXENBiwoCdCatS4BrSvVcyL5j2+Tz/AgukLVo+/BHLHDOvW+g7
         8414++JIRPc6FX0ENmeTfYr4ACa5QMWgpJG/MesT6aPfqBFuKMO2lkf0oIHRKK25ORwe
         ddyQyszZq9StByspMFH4++WgCkutJ73uSKu++PTebTqBwubbKlTuxpcbdM99heJTSDxq
         Ey8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162569; x=1718767369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mN2Oo5HuRfYFaYNQRaLC/1WniMLC8Zh3ZlO0PShWS0=;
        b=kmHLQzixZL3tB1PN+yhZcFvGVEbE/n0PrdH6jveO1nvcb91YqedpEFhrlWTfJ6C8rU
         Tv+hnCkRRjH1Psip22b3C1G1KITXxnW+z6SP/4TZcezh0pBH17niqYevqvRsKP4S5T1I
         asHgSZoyU7Asm6DwFQ65fzUaLepYK3vGfmNABSxxw2PjeswK1KIx+uKLm+nu5oVuh30Q
         S55WAclVhmkZ+2DFPrEIpgSyvNtNIjp28jbY10C9HRBRxWwHQZ2A0ER+Y5hptSklySJs
         YyZ3y5kYsHDHXAZs6CNBz5TCRRpJ6d26BEKCjx9EH3tyqgIV9PxwJSn6lTPQaqi5qG+I
         umIw==
X-Gm-Message-State: AOJu0YwrWPsAOLGEm6QPFIOul4EgEhe3S/NrtYD83EnIEfqlgMGfaGCN
	Y029VsFARS/o4C3gmwsNLK2rEp2MTWQ+C/uO9OQwcCsCBnvd1tZn7eeltp1V4Rw=
X-Google-Smtp-Source: AGHT+IHHrQEiUTsBKjWQW8t2x2dF0rfY+q0Yk+bIn3X2BUvy8WXZn5NIHh+HdzxMfQcp2PFaUBVHlA==
X-Received: by 2002:a05:6358:9106:b0:19f:4d5a:c688 with SMTP id e5c5f4694b2df-19f69d2ca8fmr72735855d.15.1718162568669;
        Tue, 11 Jun 2024 20:22:48 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:48 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 18/24] Staging: rtl8192e: Rename function rtllib_query_HTCapShortGI
Date: Tue, 11 Jun 2024 20:22:24 -0700
Message-Id: <20240612032230.9738-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_query_HTCapShortGI to
rtllib_query_ht_cap_short_gi to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 93b9f0609428..6a979151d1d0 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -330,7 +330,7 @@ static void rtllib_query_short_preamble_mode(struct rtllib_device *ieee,
 		tcb_desc->bUseShortPreamble = true;
 }
 
-static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
+static void rtllib_query_ht_cap_short_gi(struct rtllib_device *ieee,
 				      struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
@@ -871,7 +871,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			rtllib_query_short_preamble_mode(ieee, tcb_desc);
 			rtllib_tx_query_agg_cap(ieee, txb->fragments[0],
 						tcb_desc);
-			rtllib_query_HTCapShortGI(ieee, tcb_desc);
+			rtllib_query_ht_cap_short_gi(ieee, tcb_desc);
 			rtllib_query_bandwidth_mode(ieee, tcb_desc);
 			rtllib_query_protectionmode(ieee, tcb_desc,
 						    txb->fragments[0]);
-- 
2.30.2

