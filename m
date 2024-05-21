Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA76CDC0
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261457; cv=none; b=MxU7PGvqp8EW1T/N9YvD19xdnuj2yJReTqgLzN4zZLy1zwnoSka3g8JYNt63ceQhV8T4Ruf1ysox+3Pa6wmTyvOgdQ7myd46Fy9+n5Cd2rxWpHjmjP8Ic6QwsjfTkp5Kh295VQSm59xM0ZtF2INWLio1i8yqFqlUCTE2hOKTO7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261457; c=relaxed/simple;
	bh=IB7CNwmjlf8uC05nV8aD8Ur48AzeMJj/pCJgovi46II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gSzKY/BXVknIp0SLEysdXqfgCXaIZqJe78owXuXqwiThlBfahy39O1hiRrI8h9OOsKyjBfqgzUo64b1lveCjipkMWYRgZKHTchkpMgCgNYNm1oWS9GyTtD9z/DHg6uCnCSFUWeLAb87gBByjddJz4yegfTIViGc3wiwHOKJfVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=aeyCNpN1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="aeyCNpN1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ed012c1afbso27113985ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261455; x=1716866255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3Pa7O0YRALgZWigoHd2+NZIFF5xk9ptOqEgWjtZxvY=;
        b=aeyCNpN1zkRMUA5fl7gb+M5yHkJDE084wlMWAsh43Ey/ct5Cctrem7EB0kVkWO76Xe
         sJp5xj/4du+djwspL8ptciRpCq+UUh5ELBRNyR5bB9kl1ysR+B71e1zLhP23Abu9B2Gz
         /ev1tB8b8+YMMuXj2ZvvFHMwMSQbXzFTEmJxH8bDsoh39DePE9oTtFuK70Xoxr7LmaXr
         xNjkcdnxWufvIkn6CoAFRtRc8+Nlo3y81H8EL3NIgyD2SHPTVCvheFexCLC5KVWM1pIs
         dXpr+Dh4gRiPKurcNmIt4p1XkaC1L1qtE9wfooFanBeYoeYa09W9bzg4UWwvmz8RwZz/
         vAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261455; x=1716866255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3Pa7O0YRALgZWigoHd2+NZIFF5xk9ptOqEgWjtZxvY=;
        b=TGdSVWFO+kGkEjZqbUYW98NAr/0F4Eb8sgsEGi//tH/RhGPH54IRYhN5dre1T8QdBe
         nPvybz1xLhKT4q3uHg9/2fCf2Wbulw/a6JjHwahWHHlVz83sEP9i/4k2t3TZUyFeTRwr
         wfRY0MNbi95Bie4lGDKieYnOKGljr5aCWjWE0OEB4Z6m5sMwgEOuyKzUhwWS1Fi38SMR
         caiDuCdD6urY89JTXGa7dVlhubaNI2NUbwzGK+OyoaEstQkP9PmOdsTWrrC5ypecm6ln
         VWfxfPQPVeLuPwoVxOfAkpKB4jTqszso6DmEsrccqwG15N5m6NRvuaKOc9jLTT4Vpr36
         Tdlw==
X-Forwarded-Encrypted: i=1; AJvYcCWfm8Xh+6tOFKxy/CmRvoQcJz9hY7E0a1yxuK3IZ5QxeleYwKRFt5yqJP0kzMbX+G7FBOk+GZIaXsNyp1jj0CMZ20oMlC6vYDhc7UzI1g==
X-Gm-Message-State: AOJu0Yyuzw+vkm4kg4iLVanVVw7Cej/R1x5LM61GC2tofFotkNK9p5ZJ
	QprqRxsn2Wt63Q1pRlkag3tuI1SvfIXen1fYakubz/MmSPXHZdOSorIDgZYo3nc=
X-Google-Smtp-Source: AGHT+IH9SJOgsXhyxaZR2SprumkcnN3Ec5Me2r3sN0mzjmJEBaExV2E/4vuApVw9qjYvznRUmtZ/rw==
X-Received: by 2002:a17:902:c946:b0:1f3:900:e7ed with SMTP id d9443c01a7336-1f30900eff2mr38837155ad.20.1716261455483;
        Mon, 20 May 2024 20:17:35 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:35 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 18/31] Staging: rtl8192e: Rename variable LLCOffset
Date: Mon, 20 May 2024 20:17:05 -0700
Message-Id: <20240521031718.17852-19-tdavies@darkphysics.net>
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

Rename variable LLCOffset to llc_offset
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c32eec733373..52fbbbaf30b0 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -728,7 +728,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	struct ieee80211_hdr_3addr  *hdr = (struct ieee80211_hdr_3addr *)skb->data;
 	u16		fc = le16_to_cpu(hdr->frame_control);
 
-	u16		LLCOffset = sizeof(struct ieee80211_hdr_3addr);
+	u16		llc_offset = sizeof(struct ieee80211_hdr_3addr);
 	u16		ChkLength;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
@@ -742,16 +742,16 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		is_aggregate_frame = true;
 
 	if (RTLLIB_QOS_HAS_SEQ(fc))
-		LLCOffset += 2;
+		llc_offset += 2;
 	if (rx_stats->contain_htc)
-		LLCOffset += sHTCLng;
+		llc_offset += sHTCLng;
 
-	ChkLength = LLCOffset;
+	ChkLength = llc_offset;
 
 	if (skb->len <= ChkLength)
 		return 0;
 
-	skb_pull(skb, LLCOffset);
+	skb_pull(skb, llc_offset);
 	ieee->is_aggregate_frame = is_aggregate_frame;
 	if (!is_aggregate_frame) {
 		rxb->nr_subframes = 1;
-- 
2.30.2

