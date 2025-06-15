Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9193527FB2F
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 23:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029109; cv=none; b=gWAhT8F3+SBdX4owJ+2i7Bh2j/arY77HPpQJDEfXVUG+ImYdKAgQclO6ZFH7CSEBadaDurmDqRGVrg+hziFRVJZqXxgT3XbchoRyJg3Re12xUUSXlKeTjw//dfb5E+U7W6nfXp/2bqgpXdLL5DwJWoe5r2tHj2q5v1sws6UwWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029109; c=relaxed/simple;
	bh=LYBDuXGYSa+VQ0bxsoN/3xpxcgAzHB3e43Ofpm5DSzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XVhAVY+tuqLk29u5wv3S4TMuusK/v9WJJeONCCARDkV2++Icx/JOmK/hiI26oBfRQ6ohniOdctSc5MpyXg73XEK4hGc7zlmKUq/CNlz91OjAP/cF+r10PWkPOnt+4kS5c9FCYyC1pDf+YESe9+fphYiYHvwSF9nKcn23Sp+4JxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QONyZ6K4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QONyZ6K4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade750971f2so497930066b.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 16:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029106; x=1750633906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISZu+sAha8VYmQFhk8BBVM0M8O1KkyUnkHBc0tGOjKo=;
        b=QONyZ6K4GWt1HqUpOBvMrdulDtBF6R9zl6w1fVQQJsit2GfX/zwIy4h/Gjhojf6z0O
         LLu95fAt2/RMaVHhlybU7I2UKlZ1OgQi2w6QCl8WjmLPaSsecuHlHpJ8fs6G109Np2Cy
         yHKlqgQ/oOkgkTT4u0ILUU0pzFS2EqOZZD/mHoPlakAH5gCUAsOUxUWzp/630LPxLrSQ
         Ya/ByRgCZSKKj4rE3d0JHwfIwh4SjZgPAOyQwYpJnho3e7jjTqp0nwLMHFF9q/0uPlL5
         kWte6ZRKQIVo1pDuUkYbU3V6U90oTFRS0GM2L1gFM/IUf/3NcZ9FnZVGhzie0dQDGg77
         gWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029106; x=1750633906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISZu+sAha8VYmQFhk8BBVM0M8O1KkyUnkHBc0tGOjKo=;
        b=jL6mjGp3tnAaVv7U4g6u0zOimOk/dqDkK0wpxtWjjL6dWmJvfAxo06J7BZWpiXNMGz
         lBrTY3KxJXGVrXJF7k13JP7+sj7uzJRLiUP5vHYq508LT8hNNObHZlAF5onsh7fAl2Qz
         ZIFsg8v8RK8oQE4oIqVI7AKhzMCkqh0MZCdTVqYaUiQx1uSF/qh2KdR/9CVHu9y9FNX0
         wJ3PogxlqBU9tN6Y0rzmBw9HfRgn+JOjcPbOP70Z6Z4/3bUCxFcxaxuDy1rh86ORv3s5
         kv0eHAUr3dHApkccP3zGj/dHaiQxqv3YEN7LzQkYx8yUExPSmZDECULV27RrOt+Hpngz
         YcUw==
X-Forwarded-Encrypted: i=1; AJvYcCV5jLSizoXwGARyyK7QislTHGIJgVpuLg/yH4oIWdgu8jfln7JIOm/ifHoW0g8MUirT738pNirtRqmRb2K1@lists.linux.dev
X-Gm-Message-State: AOJu0YxXCWfqWFjsn7e6s6BiGbyKJVbZwdHgbiQANYR6m5ARsJGSZ7SG
	O32Ez92hPnJVeSey6qbY/D28+rdR3mhnt9DRGnJzbJtL57lbweBArLdRu24a6HunymsmMMWf
X-Gm-Gg: ASbGncuTGW13Jz7989G5//Ik35Ho3GjkZ8EYm92LJUWozVx3iGAufAvfdRRrgKhFTWI
	OvPdvt4ePsFb80l4tq7bpELPYR3vDd8bmo7RuYKoRpjtyozGrIi+Bd2CsBftNK04fr8brpIEz+5
	AMSv/wCgKGHN7FtW6epdZeLZw6Z0KCzvliql2r1V51cruqtiOMWIIge7tkFUwCdd4a7NRFumb8B
	TF9bIjL1EITYidDpA3SfHNusa7b7qpC9lO3k9R29GJvpsOw+gVvjPwp2xS5WIyRNQQmS3HMb+mp
	DK0o1UdbidYDokF4FjIloGjZ89QJU67XHiwof126UoCA9uz2dTR6cinSFvDbdlN7JD3zG3iU6uM
	fR4064Bu/nnL2vD77zN3K9XKRiF6TL/ecK0anI2y7J68CWGlb79fNZqb4FYeP5Yklq4HwlM+sVi
	PzBPib6RBxAJKBHtslm1n9ew0=
X-Google-Smtp-Source: AGHT+IG0Kz6Q1Ob6gvgrM7NRnGKrRc8RVD8msF5hGZhFBlofu3I6Yap+x6X4qw0u6niyEWHqt7g0MA==
X-Received: by 2002:a17:906:c145:b0:ad9:6350:c1e2 with SMTP id a640c23a62f3a-adfad46a356mr638917766b.49.1750029105825;
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/5] Staging: media: atomisp: i2c: struct definition style
Date: Mon, 16 Jun 2025 01:11:42 +0200
Message-Id: <20250615231143.1558392-4-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From `static struct gc2235_reg const` to `static const struct gc2235_reg`

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/gc2235.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
index 6c743a17f198..7dd9a676fb98 100644
--- a/drivers/staging/media/atomisp/i2c/gc2235.h
+++ b/drivers/staging/media/atomisp/i2c/gc2235.h
@@ -179,21 +179,21 @@ struct gc2235_write_ctrl {
 	struct gc2235_write_buffer buffer;
 };
 
-static struct gc2235_reg const gc2235_stream_on[] = {
+static const struct gc2235_reg gc2235_stream_on[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x91}, /* start mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_stream_off[] = {
+static const struct gc2235_reg gc2235_stream_off[] = {
 	{ GC2235_8BIT, 0xfe, 0x03}, /* switch to P3 */
 	{ GC2235_8BIT, 0x10, 0x01}, /* stop mipi */
 	{ GC2235_8BIT, 0xfe, 0x00}, /* switch to P0 */
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_init_settings[] = {
+static const struct gc2235_reg gc2235_init_settings[] = {
 	/* System */
 	{ GC2235_8BIT, 0xfe, 0x80 },
 	{ GC2235_8BIT, 0xfe, 0x80 },
@@ -268,7 +268,7 @@ static struct gc2235_reg const gc2235_init_settings[] = {
  * Register settings for various resolution
  */
 #if ENABLE_NON_PREVIEW
-static struct gc2235_reg const gc2235_1296_736_30fps[] = {
+static const struct gc2235_reg gc2235_1296_736_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -321,7 +321,7 @@ static struct gc2235_reg const gc2235_1296_736_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_960_640_30fps[] = {
+static const struct gc2235_reg gc2235_960_640_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -373,7 +373,7 @@ static struct gc2235_reg const gc2235_960_640_30fps[] = {
 };
 #endif
 
-static struct gc2235_reg const gc2235_1600_900_30fps[] = {
+static const struct gc2235_reg gc2235_1600_900_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -418,7 +418,7 @@ static struct gc2235_reg const gc2235_1600_900_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1082_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
@@ -463,7 +463,7 @@ static struct gc2235_reg const gc2235_1616_1082_30fps[] = {
 	{ GC2235_TOK_TERM, 0, 0 }
 };
 
-static struct gc2235_reg const gc2235_1616_1216_30fps[] = {
+static const struct gc2235_reg gc2235_1616_1216_30fps[] = {
 	{ GC2235_8BIT, 0x8b, 0xa0 },
 	{ GC2235_8BIT, 0x8c, 0x02 },
 
-- 
2.34.1

