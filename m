Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A503059B71
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748770; cv=none; b=l3uvJbCUhv8BA5Dn6I6IIguaW0y3hfG5WhVbG8B7UR2IujXo4io6Vgk3gjdvj4uB0gx7eO5UHrhdtgxLXhEcn6/0OlIx69ipi90nIZ2/18di3vjj271JlDSJGTWqgNpML5wPZJ5MrboKfyxjbLIOpMB5mURHQ8V0DNRIYll0DUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748770; c=relaxed/simple;
	bh=TeaeQ2JMBXMEzm1Q8X46tzEmnkViYGm+ie4q5eQCeJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vjf5gpPpz3IpUiKXNXDP1mM5S6uRtg0Kq74agSk7ogXCxbPzOGF8MFTpyATe2sNAywx1CrV6oM5hqhPBaNZamkPq7ksa8RKJ7zUbLfymqzGHlwnWS7OXWiAvTRc7N4qIa7b8ytKPJZL4stTotqVCurgXyHZfiGuf1xiM5AhBPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=klO7Eh8E; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="klO7Eh8E"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b273b9f1deso3482414eaf.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748768; x=1716353568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4y6QZitAeyvzhHgT1YfCyDaEWg7ZCeKCXSVd34YhUs=;
        b=klO7Eh8EbDukZqk1Mr4dmfrikrOYH/hoLfBFyiyBu9+Z8s69YDukCoJQrV+/Sq3uyr
         VteUlAsaFemOmgEHCV/YUaotec16x4BRaJ00bURGQVZ6zNQuDebOa1k/4W4RYGWrjud+
         imFIgjpcU+Ick9CMjBHFtCiHxRvLM2nsRyyljUr/psXomXBb628i17HYh6l1Gl14MctI
         dOhqnP1v9nEHcty45kAQMS/rHgIFVO1xEFRKx8vvRo+Rn/zin8U95sIAk57sk6BQAXLe
         eD3Xx4+qOh9qnyW24a4MASLOHg8szg8gC1Em8UtT5Wi2e0KsRzvsYs1BWjFKLaeAH/Jv
         qbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748768; x=1716353568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4y6QZitAeyvzhHgT1YfCyDaEWg7ZCeKCXSVd34YhUs=;
        b=s7XlE8cSeIO/+7sv53LEqmFuaPCEWT5BUiFdZnXKgz8bJ8NnXH+YSoTIS1vmUbwrxl
         nY4kF7rAdDZftUbDnexhoppmB8ZK4L+T/gNn6SuUfN6aD3yHV5ZI9nJOLs3ekOBzMTmX
         GzB9dTe6YuFeJVULcRtiCwdRaWJ+E9yFZ1g2UGJ3aTGbOB50ZU/t5XZZ3ON/dNpKqkTH
         AJJUpNBG916icNIwFp+qwx+b90N5XJ8XSi19HxZnOjtWS5Vnjnv2qveoJCp/XpwlPInE
         ogujX/1fg1Mh+Z5xy+lTpwgDWbP/CQw7pxrelAcaBE9PRnrdlsldit2QrJntLQJyQhVk
         BcUg==
X-Gm-Message-State: AOJu0YwV8ePh3sLtlcNtNRYf/oBeUIOotC6ryODXmFpL9wJBmDS20vx+
	AzYg7IW7T63aS9vOuSpN7cUAQLpIhHynKcib8DMCA/FBdL4kFt7N0bjzA5ZxCbk=
X-Google-Smtp-Source: AGHT+IHwI3T9Ka/ogTdJIsEKZasEKHJCBAT9lgmF8R2aLZoeD3n2CGajodQ34tSMagASSiTKm8+B5A==
X-Received: by 2002:a05:6870:8dc9:b0:23b:ed9:1f53 with SMTP id 586e51a60fabf-24172fd265fmr20986165fac.53.1715748767884;
        Tue, 14 May 2024 21:52:47 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:47 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 19/31] Staging: rtl8192e: Rename variable ChkLength
Date: Tue, 14 May 2024 21:52:16 -0700
Message-Id: <20240515045228.35928-20-tdavies@darkphysics.net>
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

Rename variable ChkLength to chk_length
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 3223619f8cd9..ca1c748ac40c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -729,7 +729,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	u16		fc = le16_to_cpu(hdr->frame_control);
 
 	u16		llc_offset = sizeof(struct ieee80211_hdr_3addr);
-	u16		ChkLength;
+	u16		chk_length;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
 	u8		npadding_length = 0;
@@ -746,9 +746,9 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	if (rx_stats->contain_htc)
 		llc_offset += sHTCLng;
 
-	ChkLength = llc_offset;
+	chk_length = llc_offset;
 
-	if (skb->len <= ChkLength)
+	if (skb->len <= chk_length)
 		return 0;
 
 	skb_pull(skb, llc_offset);
-- 
2.30.2

