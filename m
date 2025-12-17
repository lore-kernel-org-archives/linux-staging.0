Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA59358D1E
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987212; cv=none; b=qUQVBCQhkkzqmIPcF6x8X46DL/zZKRM+ZM99+vr0mL+QRATt3tMMNFhnVGNLWFPcmkHErkhFimlPmz9zm58nQ98ISCW21qTSnfPwb7eU77KLJkZ/SA0Q83RvKuFDAVXgq5wIMVTGvETbwY6RHoi4PELb89PegJ6sm/tG+jKp+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987212; c=relaxed/simple;
	bh=qo6Su76KF6RBKyoix2E2RDK/JywRXHqupIsVexf9oxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6cw+a9CDNGvoCSGzcdz4WOmfQoObVl8wOaZeAxbG0nS4AK9rBCY5xKENILZqaJZQwIo6xYAwMoWdKUQWRkGB5FZdN47rw0UtBWgKzXn2dTPblFGG+nWZCSPsP9tOEiL4L1IkgHThg5MOr7yhR+vvSyIurziFkRSKl+Q9nfX6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNJmmwJV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNJmmwJV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so1704215b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 08:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765987210; x=1766592010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4990UMYfP5m0Pd8lQSzep58XLVK/86AzrKVZXcIZzc=;
        b=nNJmmwJVOqS50/QTYnGL5Mp1hSLXHhFQWc1lk1rN7Nskb9SjRoqfXparaPjCCAH/5N
         CN7lfcFEVrl/Y81vigdNl0Y676UuwtLK51anIMNsJMvxF6JmnvL8F/YfmuJScRo6jac0
         Ev8hOAdP9Cf+k60NK5nvAyzfS99BFwjzNeuoN72YLN5j+PNuJgbhkg6yUkdZlnuJ0STc
         Jumq/hOxhg7tCSO+QAK0sdi83nek5Tfvjj+vnfbWdJN3k5ro9hKnblYKSS3ofbLQ2dt4
         DTzyUME8hSj3wCPeub6RIxtMkg4ymNl0sQoQi4NC/WzcyrIwMDiUV0VLDdGZdGvbYYNf
         IMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987210; x=1766592010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4990UMYfP5m0Pd8lQSzep58XLVK/86AzrKVZXcIZzc=;
        b=MLuVks9Kpd9bHpFnT1etretNOD8XC3+zXK+C0nWtzr84CfllIDFplBBCbTh4ZqtghR
         2mhH2NX+nIdboGH3jq/dh7KwcxaztdjpLQHA+Ls0ANbjUxl66PqudmEGrZA7t8jtoO8b
         vg77GIQc+4mEuvsFwfxrYXHwxYj5UAIq3jyFw8hGBx8iWiMzWiiXuSM7/FmJ8GdDnjO3
         7INgrdkdjUWMZn7YNwPoZzgxES74W66pYaH8UwkVxkRvYzHi9XJFdLbR1PmQPT5APBgQ
         5M36PeFuaCDW98fkLrBEJQdJF+4oTjvrsDUA8/KHFp49FPEngsXwir71EzFsIMi7O1W8
         Ah9A==
X-Gm-Message-State: AOJu0YwKpxEaRCbq2FpOfhkZ48r9U2dY4eCQ9lzcWCI3xHhuIdoO4Gxh
	h7NtHRys8H/WpxavYwczlNhBScCWW9wgjQkhyYdywdYvnr1r61TtPkO7
X-Gm-Gg: AY/fxX6QZhPPyTW/YHhCRjOhmBp+Z1lM35rCGRFe4hCdynU9KkZEbI+9Iepswan6Z1R
	8iIi2Jr/d0zLLVYJQsy4+ecFhmTttJwJR9mhu7n+WPAGRhdt2Q4tjyZNmYlDuzYLvLsqZRxDS6X
	V+RntcQcMVwVFgdbIA3rsLcARdilbuIhkKsB5Xb5FzJpLB6lh1LwIwyv7y2/63jjsJxg8vpaORV
	lxWd1qOMp3DdWc/AByOSpli/35I2Z1mz4FrGttadZSvzvcA3Gnylc1o0qsKoCtfNJIM7nXlq0HR
	QsY89VEcIqoBkfEw86jNBTFBER1X94VlvffLISGKdjzIENYcUhNaCyMDyioKWmm3RBKYtGrrrEl
	rnuyGs/v+qxTTLxz8pTnMhUyrEmmLXgmmoQ+Smm/axZBFFl95GjglUk2YAf0yAMhmFAt3UGIEUZ
	gIyHxspnDx
X-Google-Smtp-Source: AGHT+IGZbpc+T8duwhulBL8v4RX3LRfo/wX8Jmr0D0U0LuO8nvwvEaog6QJq4XHi+bMijsRovBQOqA==
X-Received: by 2002:a05:6a20:3949:b0:366:14ac:e208 with SMTP id adf61e73a8af0-369b758ac50mr18942513637.70.1765987209862;
        Wed, 17 Dec 2025 08:00:09 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5663dsm19493289a12.17.2025.12.17.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:00:09 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: remove unnecessary braces
Date: Wed, 17 Dec 2025 15:59:43 +0000
Message-ID: <20251217155944.9000-2-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217155944.9000-1-sanghae778@gmail.com>
References: <20251217155944.9000-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from single-line conditional statements in
odm_CfoTracking.c to fix a checkpatch warning.

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 666a9f44012d..0b70509f553b 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -100,9 +100,8 @@ void ODM_CfoTracking(void *pDM_VOID)
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)) {
+	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING))
 		return;
-	}
 
 	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
 		/* 4 No link or more than one entry */
@@ -110,9 +109,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 	} else {
 		/* 3 1. CFO Tracking */
 		/* 4 1.1 No new packet */
-		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre) {
+		if (pCfoTrack->packetCount == pCfoTrack->packetCount_pre)
 			return;
-		}
+
 		pCfoTrack->packetCount_pre = pCfoTrack->packetCount;
 
 		/* 4 1.2 Calculate CFO */
@@ -176,11 +175,10 @@ void ODM_CfoTracking(void *pDM_VOID)
 		}
 
 		/* 3 2. Dynamic ATC switch */
-		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC) {
+		if (CFO_ave < CFO_TH_ATC && CFO_ave > -CFO_TH_ATC)
 			odm_SetATCStatus(pDM_Odm, false);
-		} else {
+		else
 			odm_SetATCStatus(pDM_Odm, true);
-		}
 	}
 }
 
-- 
2.43.0

