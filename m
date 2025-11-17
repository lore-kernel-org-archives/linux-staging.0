Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A03016F7
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403618; cv=none; b=bSnulUNxyGkreH8tMV2nOZFMyQhdQ6gr4cgbRzQ3jfiq13CM6NUtYSMcxEOeppmlXrvGXaDySYXWSNd6lHK+q0UrLNCTRt2WshuG24adxL770igj25noTNcA/5PSPI3m+kLjfkFXvdZxNy1Zy7uwu4kCfnGvZS8k/d35azCAevA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403618; c=relaxed/simple;
	bh=0+ctduUDqwhCNGUV5Xl/PxhvvQCZm/bfrWqqsJ7OwH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obsypOqmKJYozLQieRtqNp1zBGJw2a1SmrkOYyME+dlesbn53/WnzEGgkYWedFc1E7EeJhMNLugdmhGxwsIY4+KGL9YGYahGIGT2yqUNXvjZ4LRgSXckrVpB0tgnYmotri6GEdOmmxfRNqRYaK6Bnt4tGa9T5HLTihRcLq6DdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW/C7hQ7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW/C7hQ7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29845b06dd2so52721015ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403613; x=1764008413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bucROtgn/STqT4bhqnTMY3oezQn9xyysx1+bUbZKY+4=;
        b=NW/C7hQ75TrZf3GTSBZGxV5LPwETlRaudipmpr2jOt5TqGHH3o/EeFIn+OUuujM0TV
         YyGkzBqJriK4PSGgu1YI167VfZuNVPvFOOZVffmW/PcOl1MDRxQNWKvb4xnpX1GS/ne6
         6s8pqmgqODWT9meg+odSSFpH6K+aMI6YB345p1QLa+vmgg9T0PSS/DIirfsi6UYqwS/c
         a2ZHqAE4s/w332TW+XgJaQtoIXzP1lhJIMqFShE2y/6ihwBdmk4dws5U6WgVwVJ7HvJG
         FKMi584gzbNZaXeNpPjM2+yIe5pMbq2ERxquLOfrvqgb3CCJ74Mq9aQI023lMja08X2h
         Gk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403613; x=1764008413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bucROtgn/STqT4bhqnTMY3oezQn9xyysx1+bUbZKY+4=;
        b=gJQuDJOFwc6NgW74jmbQ//dUO1YBAGScmy0fwA0gQzy4ZHS0mPwiyrkZyl9//RaRos
         tLpB7DWPb8VluH1+w+29s2EShqGDy0XMOtQyHvO6tnqInRBRt9Gn2P/BsQChMiyCn0Gk
         kaYqCAyjG9qkXH9veLnkfxNLMi7TzzTzQOvIq4oDQqp+0unkXEvr+1YkMTaRF7MjQh+2
         L/7cgsOJxeWOC+9hVK5xeMJHfcP1QN3AmqaGcE9SJh88kvVZ80+kKMHTnNZGBeNsWMs1
         vXDpyffMxWU3I2lMcyJ7scGfeJnAEBqwF01WUOUbtQ1wlbUX5KU+6pE9bUSgm2YJOVLa
         eNJA==
X-Forwarded-Encrypted: i=1; AJvYcCWdzHjrxVJzISc/GWTMhccSvuQ3nn5taKNw+v5+DSHmOM7mwMVnbdaEUiK/9OWQOy4Bh6UU+GXgrbU8ksdD@lists.linux.dev
X-Gm-Message-State: AOJu0YzH2+E29RhoVlXb2xXumzA+9j8T7vBAzGuidBFU/V9zRusEXHvP
	vSqlOtyqGQJlL4U+FNe8X2I8Shl7RH1ea9lICsVH9KegIrTxFsLz3jXVVW++yA==
X-Gm-Gg: ASbGncvc7Ix08LFkh8gPYYSe9E2G2mO05SGAag991FwYz5ts3oG3y2AVIVVXQ2OPSNY
	HbTlJ5l2wssp5xfcYoxiiB/HhHt+Ol7gpS8HdpZWR8C+laxExDq5x+KnjV6YHsaJVUbR5H1qyaW
	/JX+zLY76ujUZe7PY8RBw5tggcsaQKjDEEE2HLs4zS3u0uMIR31uAtPGCtEYxSz7cK+l2GLuxJv
	fn+zm/lAcjNQgMCCnyd5mMN0SOKQF9G1KREgoPGfKR0wcZHnBNwwpqKWBmrBgNj1a+8UtLx3dS5
	Z5jiH4nPdHrmxv/MWqdmNlt/luHDD6/hmUjSXPEcl4axw7Q9SjbXt9nKmG3k4x24bXXLkBnoLlE
	D02qo42ai46/Iab81PVv1Rj06SzEIWFm9B6a0fjPslgR57bECTjwIlGPJU7HS0m+dG9CtufCfV1
	FfqmXylChb/1U4TvVlWmblHiTHleBYQv5bwOaI
X-Google-Smtp-Source: AGHT+IHCG1I57PhkXgVunbfVpDgug6nMnuPc8ABXjNBzSPuu6XEewphO4qTiO29/jfl/HZzvxfMptg==
X-Received: by 2002:a17:903:3c47:b0:295:6d30:e268 with SMTP id d9443c01a7336-2986a755dfemr152593225ad.59.1763403613432;
        Mon, 17 Nov 2025 10:20:13 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:13 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 06/13] staging: greybus: bootrom: remove obsolete FIXME about SVC parallel event handling
Date: Mon, 17 Nov 2025 23:48:11 +0530
Message-ID: <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>
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

The MODE_SWITCH_TIMEOUT_MS constant included a FIXME suggesting the timeout
could be reduced once the SVC core supported parallel event processing.
Greybus SVC logic is stable today and no such change is planned, and the
existing timeout has been used reliably for years. Remove the 
obsolete FIXME and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index d4d86b3898de..156212301d58 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -17,10 +17,7 @@
 /* Timeout, in jiffies, within which the next request must be received */
 #define NEXT_REQ_TIMEOUT_MS	1000
 
-/*
- * FIXME: Reduce this timeout once svc core handles parallel processing of
- * events from the SVC, which are handled sequentially today.
- */
+/* Timeout for mode switching operations, based on current SVC behaviour */
 #define MODE_SWITCH_TIMEOUT_MS	10000
 
 enum next_request_type {
-- 
2.51.0

