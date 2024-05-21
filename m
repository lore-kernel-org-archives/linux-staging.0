Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA936D1D2
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261458; cv=none; b=gcgLalWc1pmOiOtB4kMsnZCrr9IaVlST3O2eq6UBBE+fAGgiZdqVtk1BCm6kHc6LKwpV63UVdmoew5SFN+LNGiUJhifOGK+J75hB2Bs2z230gf+WtCzCm/v435GnH4wn6Ab9Q4REBRxx3ogwW2oY7eHd8uvMJLrsOaP4VWRnKdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261458; c=relaxed/simple;
	bh=vOlhyRJiwMlcqMkjgh8ZqeWXUxY6D61pDutdGqwl5CY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6wo2FzmGAexU3ITN9h1vzomREA5Ofjcx2iH/c97AIBwD/p74ZF3lbwlMuyrLnP8QN5CjhpMAgGk4FHo61VO7ej7lcztOVojgSEX4MKYR+r0Sk0q9l+hJ7P5cCM9/0YuqoDwshjERZaM/6tE6Wy4lh1K84LsJkBcoZs25e8rMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=dNdjUSgo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="dNdjUSgo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ed0abbf706so26888475ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261456; x=1716866256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIGSQ3C/BdvZT98agea7mQnapaDbDhw1o6G8ocniTTE=;
        b=dNdjUSgoVwwJpuY0b0LgSm7uiEz3fpN1fe+/8KibZ9FV/xhJsJSQXhu5BYrh87xuuq
         KoJ8eAplsW8w3heB9b4WFF+r5bZJ5NUzCLwbduUX3M5DLcWb1v2dk/shRLHaMGKem0SU
         2PzIOgfnyPKVcaCpSeQ0nKEmHq1PptPi1gbO1YzW+jejkiOA3ftb3M1zur90VwN4pavg
         Wr1JBM/lqEN+5ZgeOhGslN/QnG+zOZVmrzlz4sgfPEj7UGlIVNzXRyVunxLDU6Ybjnr6
         LjrIxlCAEBo3vpSp7HOaU8AUM09WjiImnoIWOHNc+fXPQnRAul8Wl6lNsgDga0yV88Zb
         pPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261456; x=1716866256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIGSQ3C/BdvZT98agea7mQnapaDbDhw1o6G8ocniTTE=;
        b=RHSuEq7IGxViJUgtyZrFnFynXRflzr37tVnK6wB0AHDR4EpVVmc2ZcWm7dftiE6jlb
         Id9zPMz9BSU5Ew23J7FtV/SPOtCwqN9nzpG/KzjFck8D3KuViF2AxLI63QRoxA1dycAX
         FBU74r5HuSX/1jPY17VALwWPs7RSSXLhiO9mruz6e0QhqRJ4uIwmEj6qF0hmfM2TpWVx
         p5FP58wgLmJdTmvoF3mVggszMH2isKLeNPPHTWm4ZdI25nH1PG9o9S2t9Gwo8m1wdf58
         4fA2sMAuvhqFD9bI9Q8rJh6YOoDzjFQRxd6OB4YZGQMz5VdBx6xQzMdL/c7wwCgfbuZp
         KJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsQxmwPB2mxN1mA2sG2E5zwkuN4CIN9/pPjXwnP2plyT/m/Xl3Dv6JZegnOBxfKinDetYWmKn7vybNOblCLV/JVwPhLeJbpYzVbwbkqw==
X-Gm-Message-State: AOJu0YwJ+mwwVuUIZisf0CSUiexQ9KIVYl1i7VNbp3/rrjUGGxpvCIId
	yvs1ilcjRq33qE49PUow3rYo75qF5mVX+wwU8U8FJ4bHTLRvo+4ykos4aGicKds=
X-Google-Smtp-Source: AGHT+IHCEk90C+Vq4CiPohjEvBRo0vWIF3yzHeFHSZPkzH/iMjxz0YZfmHGO49DF9SNeggUgvFn79A==
X-Received: by 2002:a17:902:6b82:b0:1e3:dfdc:6972 with SMTP id d9443c01a7336-1ef43d15755mr316580525ad.9.1716261456179;
        Mon, 20 May 2024 20:17:36 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:35 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 19/31] Staging: rtl8192e: Remove variable ChkLength
Date: Mon, 20 May 2024 20:17:06 -0700
Message-Id: <20240521031718.17852-20-tdavies@darkphysics.net>
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

Remove variable ChkLength which fixes warning Avoid CamelCase,
and use llc_offset in its place.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: Delete ChkLength, and use llc_offset instead.
 drivers/staging/rtl8192e/rtllib_rx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 52fbbbaf30b0..3a637731506c 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -729,7 +729,6 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	u16		fc = le16_to_cpu(hdr->frame_control);
 
 	u16		llc_offset = sizeof(struct ieee80211_hdr_3addr);
-	u16		ChkLength;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
 	u8		pad_len = 0;
@@ -746,9 +745,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	if (rx_stats->contain_htc)
 		llc_offset += sHTCLng;
 
-	ChkLength = llc_offset;
-
-	if (skb->len <= ChkLength)
+	if (skb->len <= llc_offset)
 		return 0;
 
 	skb_pull(skb, llc_offset);
-- 
2.30.2

