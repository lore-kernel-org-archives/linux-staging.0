Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE4A42317B
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229912; cv=none; b=j6VxHOGpNHJdXHRHgaHmMTHpS97MX6lzm7qkcFEBPj/i5mlOo7zMgKnw87c5pMTsmJhj27pwZdZJuhvtKyxReLtfDYDVO4H0ccIruIZu5WYw+YuL+OFflvm50/V4HgGV6wCPuq27yfba8OVSRd3WnZpwePKgcUZQFrKG9Ra39R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229912; c=relaxed/simple;
	bh=Cd/YOadTvtLSs73zO4+ovdHdcBWNDgZWZhpFONPuD5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8kBPjVvtuOyah6x/3GLImXiXC8mWbEOycA6WoClLxkGGZbge1sf3oLR0KI18vgHkWhPeZh8xXZoiV80gpifJOfI3ykfimCGqRrl/6OVK6mVbzBA6TkPOB7acZYG1+hT8W2VKOxlh3Rzh4HMuE1ok4iL2sHOYnwTWxdCxBdi2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1V+1cgb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1V+1cgb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so5646501a91.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 10:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229911; x=1770834711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=k1V+1cgbZbUVcKOkjBFeEfP0AbAWkW2rMBfhJSMov3ahzU7bJ8CvNw/7CWbuO78dDG
         lIZqcnHhU1+17mlGg4dMyc0CNbDxlEV8Wx0A38AtnZgy5DPYoBLOmSOns1cd0gy4QxJu
         3drXTAxRpatHdOFPalKZWjtP0kIBvNWwJqMS+l/cSco3LRlVJhn3Z0TWz478l6hJICX4
         DOoKKUDiDZps5TBTe+Pgf69LJeGDyJG4srVWO/0WQH+f2JRXyZ96pIHn+2GCTlFGVQAa
         5tutZ9/1iK79zKRZPSbmQ1w9q9tvVUBDTYZcQysLppI66AV0Oe0y/3O+j6uhcybeg8At
         xlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229911; x=1770834711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p46sF3aEqykhE3ThZZaR/iwrX+CzUiufVqNSIHlovws=;
        b=XAtLcTZahOZPplCe23K/i7RpfYPM4JT9BB5/LLDBxq8bm5VHGaVy7eQFqW8bBaQzl/
         7uGrV18ru72xnrUECvJ+S04KohFCfx6Ev3hNkGP40+lCKlhQAgAd9LFLjFplnuzC0BZQ
         HgQRYj9fbtLK4IbVIkjw4zVBe8FivrdGVRDArlr2EY7jwWUtrPdsNpJXwOhVVKMP1T8k
         HGJtBToyNwUuTBF3HaCTzfeTyi9zElfrbsJUVgJSKGpUuBvL9isMObR46dcA7hl5t05Y
         5hjd4kDyQnHGm5294THrWB5sukKyTYU+i1po0heGoqcI5/AW+rtLEYryRkCmKNvpllsB
         drQA==
X-Forwarded-Encrypted: i=1; AJvYcCVP39Ex0Xj6cQUZYLxjCy47YkWsMAJ4LyhliYB8Qs2zcWRi58JDNWQFoiZ0YholzjXT+H8dWZ/sa9VUPSqQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzVcNxM0TgbTKW/yQMOUX+s6C7/EVFZEywZL4rBUWnDREOPZCVE
	hALfqBnesxUmqJlwVQ6oQ0YkNdbPs6+B8/6ZWGoVo9R3oZRDR4eyxkBF
X-Gm-Gg: AZuq6aJ5vrZzUA72lFGpP2OF70LQdaJQykRxTiOZPZ2H8l0Co2yyCdsl44Aqlz9ES6w
	nmnFNf7Mpye+3LzykEWq1Iu+7tr4NwgxGdrN2y8jXeewqMgFIrwTaUqRDESYrP+bcJzZxb1hYyF
	TUNzJFTl1PvKXf9W8LNQ7JeWwDBs+I2rOOPZSqbpxot5GwOrJw2zwSl2p6rbtt70Yk3I5sR2OfW
	zF7W0C+9ezYQTme/EZ+A9+eSOT1LmodwQ2MhnIHNeG869Dz9NR3+CpaaJRLNz9cTgLuJoVjq1Pi
	3k6FrzEvJoBFTk75W+KmaijyG2qDmaLvjqtUzRzaCegsGPg4U6lTbwRq/oHRRVCv9QKFiE7EiyT
	5QAX7/ntH6wqmLTYLc7UVfGVHKQenaLFlBX6N3m3T+OFPwH4SWl9CpmpigAwZqNIfjj3y33C2ui
	l9xFBEnluSB/J59RUK1CRwnJvrEzcb
X-Received: by 2002:a17:90b:2707:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-354870ebb61mr2904549a91.13.1770229911367;
        Wed, 04 Feb 2026 10:31:51 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354894acb47sm1090041a91.10.2026.02.04.10.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:31:50 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH v3 4/4] staging: greybus: resolved checkpatch checks for light.c
Date: Wed,  4 Feb 2026 18:31:41 +0000
Message-ID: <20260204183142.182785-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comment to mutex declarations, to resolve checkpatch.pl checks.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..1f2faa6d545d 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -37,7 +37,7 @@ struct gb_channel {
 	bool				releasing;
 	bool				strobe_state;
 	bool				active;
-	struct mutex			lock;
+	struct mutex			lock; /* protects gb_channel->active */
 };
 
 struct gb_light {
@@ -59,7 +59,7 @@ struct gb_lights {
 	struct gb_connection	*connection;
 	u8			lights_count;
 	struct gb_light		*lights;
-	struct mutex		lights_lock;
+	struct mutex		lights_lock; /* protects gb_lights->lights */
 };
 
 static void gb_lights_channel_free(struct gb_channel *channel);
-- 
2.43.0

