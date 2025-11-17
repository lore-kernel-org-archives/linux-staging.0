Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9799D30AD00
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403624; cv=none; b=HAx5ZwxerVNMbvuOJX4dubx+u1wMl84Eovo3plLs3SxM2KIVYFkYlaXSt0pLljwvq1PAyx1p2ZOrCTDhTzprQPZ8HRidoiyIQJCHKgdVnumalOn1UYyxzwkg5SZgF4w/t3jiCNhiPPSrB1zy7PQRicroB4Ja2koS5jjxqsD/ovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403624; c=relaxed/simple;
	bh=PipdJdjhDEEIDX+6+clLfBtUZy0pKcw9qSB4AaLk248=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd4FqQ2z8vtw4TESBuzJka77WcgPy7VO/5EQ1LH5970sezptVnsdrHMbPYBEI5/kv7VspnJ9ZKxQdoSvDEVsOiYIfiA7ZrSsDP1VDutM3WEwRJ6ArowpgODLO0c/ihTfgxEq6Lijpez/m0Z4QjAO0I2VbJRHlF3ko9RhaBtH0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve9GvZDl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve9GvZDl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295548467c7so54292625ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403622; x=1764008422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neAc1fzEywgbonmaIJCf4t+yzsh2psg4rz9WiqXqPHw=;
        b=Ve9GvZDlgbr07k2oKmQBp8ZADkKi57TA3QM54hnY1rHxPuYnwNiVSlZ7CIdkhCuhzY
         eRtwrbN8IrralFERcnWdCNAuxamsHw6L7yBaelLFq5dptWkVpz+w5mo0mUGhSy4XTXXg
         gIHretxjQKmESke0A+4XuehsKOSJNm7gPXucFMnThPhLhYJujwEuX+4gW2IUmkhGKfxX
         RxaRSdmpMT5TBWzxNx/OOBphPkEqy1DTZZvzkSEcAf1OwD+ZwXTJlIaP1VtqxTcnNuB8
         nWtqkH8+GGmB0wq1zYqPW50iLDDBU0l+wc9MfEYsxros6+BsinNXeL/dDyELt36jU7+v
         WwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403622; x=1764008422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neAc1fzEywgbonmaIJCf4t+yzsh2psg4rz9WiqXqPHw=;
        b=sQsLvTzE39tvR37YndBSL+dFTFkOZWNWEQbWCtlLJechFqU2qjOX9VMfExWt3BhIxX
         9Ywt44AGpVmnT6GKvJTCWS5pnzpRK/BWjxqEYJxbIti+qq4d9X9Bcb6KpqDcqL8RihE6
         IaRs1JTKAU+LlhdTxoA8o9RNZkbbe0LhlrOeC1YgxKlzxLHZ4XpqSTJrZs8w92tStP5+
         +4wZg1btSr8fgXHYFYOguqkx7ANoDFLkTcvdY8hKYMX6I8ssg8/x8iOi4IWm4PhzwaWd
         dkYkohC3V2QMjfpGlc8m9tCNs0dg/kqpFFI+vAAhE+jd9KnMLGlGnUIxHt+eLAOaa2Zt
         pRTg==
X-Forwarded-Encrypted: i=1; AJvYcCWlzjHbyNZaM1AmTch3p/xk/AVUT+gslW0wPuSj7bHFUs2MYODzFdqEWY8jaBilqSaBdXlANm8uKOXIJZLN@lists.linux.dev
X-Gm-Message-State: AOJu0YxIGsmompfeY5cZfixLwDwCDz0w8cSUa4SMCCTeuQ4cGZxavPjr
	rqdeVZQ4SwH984N0fWbqxappg5Xdobi3iKT/kGAWxkHR4+HXV60k8t1w
X-Gm-Gg: ASbGncuN9AAavnasAoXSPbt09UsMX+1FN1O3ilBAvCEtxxvFA0YG6/oOEdBvPLXDIZo
	H4xVckZwNIcw+21jEfWbIqitP9GB20lkVIEDDQdSsZx0cEpc7M3VKjf5URZSjk7jRFg19wmDAhj
	EAjj1Losi6Hu9lLOolWtUjkp5HaVKgyE/4aopoA2hd2zv3Hh1R3jlusxr+Vi5IP41gRzrmG8QQr
	v2rGyVJvk6arQtl7CSLUA79L0HVdIuuT5MSG9jvYzBUgVcQ26OFTBREQhecrkdTaRCSCygQ6jmU
	y42rdMds0uX3ieAPiYDsYzTMzT2YbD946dQCBvXBxjeGPHDzvFSuerwzRBWwpHwFsvCB31DY9Oa
	XMbJOiOTrkF5fJ8gBKg7PXbSYsBlrBob31d/631ZPOcE38/dij6eOxK4PMZkHmrOtMADuFZbP5u
	Mz0Ct/4PihAr+V8HbXnlyPtjJHC94wwlIJArnX1wfGUQY9EXU=
X-Google-Smtp-Source: AGHT+IHvlrw9H7LOPt7/x1QP7pbZWINFKvZSD2bl+TGs70GnuxLQ8m0Evz2VyuGAaA8HOQe3/n8img==
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr172152565ad.48.1763403621825;
        Mon, 17 Nov 2025 10:20:21 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:21 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 09/13] staging: greybus: loopback: remove incorrect FIXME about async wait
Date: Mon, 17 Nov 2025 23:48:14 +0530
Message-ID: <20251117181818.118139-10-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment suggested that gb_loopback_async_wait_all() was redundant
because the connection is disabled earlier. Disabling a Greybus
connection prevents new requests but does not guarantee that previously
submitted asynchronous operations have completed. The wait is still
required for safe teardown.

Remove the incorrect FIXME and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/loopback.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..0a5827e1a8c7 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1110,11 +1110,7 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	gb_connection_latency_tag_disable(gb->connection);
 	debugfs_remove(gb->file);
 
-	/*
-	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
-	 * is disabled at the beginning and so we can't have any more
-	 * incoming/outgoing requests.
-	 */
+	/* Ensure all outstanding async loopback requests have completed */
 	gb_loopback_async_wait_all(gb);
 
 	spin_lock_irqsave(&gb_dev.lock, flags);
-- 
2.51.0

