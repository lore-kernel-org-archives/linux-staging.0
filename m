Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DCD3DE456
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904921; cv=none; b=Ri1QhWkAPko4KRe6NL4vy9vJyEsj0+GSTrqQXJMx12tRM7nLwhM2OqYip8/RXT9wuABXNH0ckgrQe0AHOJ+T3vp4niOJH5UtmhA2qya7mq7RQ6qguC55t8VyPPrNeiUvg8h/m10ml8Fl7YtcxkHfiFnAcL697nmNaEn4hnqoHK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904921; c=relaxed/simple;
	bh=ceu1zpfrJ38C2QAx4+Wg85BfLHPc+PRKCzp4Wk3+5Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IWuCVh2VWc7VQaJt3BgcNrcelpAVDMhjSlruAtE5Q/exk0oC+O895DwELRZQ+/aZ3oZjqEn7S+YuQ/G7h4hMZhV1cNZnyM3HN+fvJC8Dn1e+zdMsRuzFGA6BRRGeKa70EauiPGrUhW1W/g3gV7zOYrNgDHqPx0rTXSXEsK4HPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oex/ik1e; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oex/ik1e"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9a9be502so23220705ad.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904920; x=1778509720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVbnO9PPIDm/KveEgIOn9euwUyrM/Z0/hplwVPCeWOs=;
        b=Oex/ik1eTn7Rip9jjwPYvyCrQhyMMsnkRk1pqWTPXehcR9P+9YxSzIIYrrPRq4v2FI
         avQZoRmqERVld/ZTslKxZ+UZLLFWcvqZYFLbTjtn83NzkVUCSJ+pjKagbraMedA4KKpN
         kihIflYQ50xGCObo/mc5hERfoW1QztkhhGUxDhlnL54v4P1OWiOseNQCMNmzedR65cyp
         l7NwlsplFBa6pmg8h6Mys5Th4VZ3Yi105SpPK5xhyFhwGQiPj10RmhofJ669PN7wlg/c
         feebps7pTyBw3yia3ZwRtAoyUKQi2yi2RFtvRi9Fjs3gdnsJPqTpVN9Lu1Nv7qMrIK/4
         avoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904920; x=1778509720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVbnO9PPIDm/KveEgIOn9euwUyrM/Z0/hplwVPCeWOs=;
        b=lTysMVQHrlEzIQ1FlaKwu4frxDXCs7Aiz7qdaEz00Pyl6h2FthHIQzMUgx8Jl634u2
         B4LqL6a0JddAgpu7eSQTTAIeLKM9WAkpSObRtokdua/DiMkCzYX75MaPZdDKFJMlHdS+
         zH9NDJCYG0Z1JQzn/gUyA6wt7/64RDCNYpaG7WA2lYP4EorfFfZt8nO/tT+Hd/Tw9RJy
         ux47wdik6d4Kz7Oov0p+9+MOhM5AjrFd+sjLkhwt+1de1miVlFlZwdIu70qCGrBXMO2Z
         ViBeGPWACwiN5jxtJyH8oEKPitVqIYD6Knc7s12AIZtq36sGhfkHbHjcAN34PipKB/5Q
         Ir3A==
X-Gm-Message-State: AOJu0YyU97EcbVDuUe7fnzO+L4Tdh+2oiEl0pTC/t02BfXtPyZY0N4Tv
	BMUUCpEUZxbOBb1xCXM2dkPtnsAi3/iLkXTSZmYnch+mWQsKGeLPp+/l
X-Gm-Gg: AeBDiesLYXOwXwdipbsGFuNm64TkmHJVYZW/s3JnODMPUo7aLy/4jgbCT7rBIn0I3qG
	pWG9XcobKbyaXQS+XhshrlfhDt7H13TT0juWL+TlqjuxKks77CdkwKWdUWSA9sDa0aa2FaocP+C
	JlxqkFkTIOA3KzEjSDDZJbdISnwZMIDkdUc10RUwCUha1j9vunALbm22aEOb5lpkkBGkottWgUt
	aCY5Y+u+J4g6xv4/mj2s2TfHCfSTNuGCj4HpjSZig9YjjBjbPohbqYPm8Nt4nrtv5r3qzXIB3MT
	5HMyd+pOINe9inPmQBqlJxjAEi4bXgxzdW1W9oS6mIeGqMoe9q61eysMEgo8X4fZXD6FPbAXXDq
	rF4llL38ZCLx7QjdKFP2bsxMLnF31BUAtU31uXk3FuixgfgVDkdobner5xtqdOaJmoSDGAwkrdh
	HDkkGEq7Nt3j2gxo/x6QBPgeHiZyEuTjwe6mXH8edvJ+gkTlmBGYunGQ==
X-Received: by 2002:a17:902:bd8c:b0:2b2:4310:8d1a with SMTP id d9443c01a7336-2b9f28303d2mr68787945ad.38.1777904920215;
        Mon, 04 May 2026 07:28:40 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([202.148.63.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f57sm105468605ad.77.2026.05.04.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:28:39 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 3/3] staging: rtl8723bs: remove blank line after open brace in hal_com.c
Date: Mon,  4 May 2026 14:28:12 +0000
Message-Id: <20260504142812.21964-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
References: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line after the opening brace of a for loop.
This fixes the following checkpatch.pl warning:

CHECK: Blank lines aren't necessary after an open brace '{'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index b4b135a9ca22..3c85e96ec57d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -252,7 +252,6 @@ void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
 	u8 i, is_brate, brate;
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
-
 		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
 		brate = mBratesOS[i] & 0x7f;
 
-- 
2.34.1

