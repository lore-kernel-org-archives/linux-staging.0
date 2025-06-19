Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E92147E6
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322739; cv=none; b=Ae0+K8H413GloilGXPz7VVmJbNqT+7KHzYeXbCBHQJwrwty7tPx5oCHCb89UOpwudSkDw3wLyidlcQa7l6187LbaXxI1m+gvMWwi3Mr8VTUP+u+ltxEJ0K8EjCuxPMh1B35m0GrZBDC720yaP0U6GaQtpOk8slOweyVk6WFiMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322739; c=relaxed/simple;
	bh=dc8b4SqFbL7GbH4/AI1p/bawh7QOopzOKjzeIjY3oEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rO4mA4mJETAcv1OcnwxrJC18BJ/kq9CHr6M1haO2cXjZvH1/Ke+UAJo6xX8gD4RoW/CzG+4jiN0eEZROtKmPda+WA9pHzZ8Ms8dnzetPrZKEpFt4snJa8C26rsep/tx2TRAR+jnOpre2XSE/dj6o7OQlADrSq2CJSq2TjSptgj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc+fPdTk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc+fPdTk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso628212a12.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322734; x=1750927534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0wtSbUxRYclW9mGhcArPsdL1jf7GZkXd48YFnMEvgU=;
        b=kc+fPdTkfsijWLSOLhNw7H8lpmOxslccIVwtnKeYC7kTenLsSA756e38kQjfmxQrb7
         A16kUNNnLaKXQ2XJ8FMH/M0ze2RsxBmJ+yWB1jn+sQWd1IZSpER+wVqdC99ctsL9+c7s
         y81js0rqZAxlByLQrtA77OqjnZh1lmvwX+GxEZr9IETStnH9wF43IHKoFAyPE3/j72eM
         CTkr+mvpY0vKDfhXSewQ7z+0WIplVDJ2XKZg1PrKXYPwdGhFvU6hW/v0s6o8mcxr3DgV
         qaI2CG9mxJ377QrAQpGDZf0aK3ElPRPgFe1sKWs/qjehvr3koAxz7aiY8mqGRZz2ok7Q
         xWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322734; x=1750927534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0wtSbUxRYclW9mGhcArPsdL1jf7GZkXd48YFnMEvgU=;
        b=wtELQvh9cloOz7qjUvgINbG79SjzZtOgt459fqn+qx4KFnhH2fXE0CzXvl+R29U8t7
         nJl10Qa9JutXkqouGKYtOAvei8qRHGPRQHGDu7bNiI0MOF5dbHwa/WROfZc1GMxErLWO
         HOjK/vaTlr5oBsqWPxCsh79Ey2897rcJViq+2JlGIb5fOYr3fX/CQMwfHvgXztiXx3RT
         xCPbMrsFreHSGqZoYMuR/7wDyVwin89zdLCYnc2DIcJ09pifgpSuOxVmhkTeTEvQwY8N
         LoK0UxgIfWjGOOKdrt6dapyxjxNI7zc1pD+dCHKLg9VLBWNzR7dHtyCmCUoYdhp6rNDH
         lolw==
X-Forwarded-Encrypted: i=1; AJvYcCVa06dRen7VtKCwmypva8aKtAupgfti8MEY1WijEbbiIWyU1Gm+NGZyYaieCB9CSyJ1InVPU52ov5iaEhyv@lists.linux.dev
X-Gm-Message-State: AOJu0YyQvjVL/ca2Z9FfFLBpCwz1KYA4cgWcRHNOCHKx1nf6inAkPFSd
	z7Tfxhnp6Ry1+2SLGPkMFUuxSLLQRWOSEqa6I5KxmG7B7JXLm5oQIPteUQI+kTqlsFLAmu1J
X-Gm-Gg: ASbGncvVOIWxA0bVWM/jxtYYV/BPjuX/OLBKZ7LjU6cQ+Gp9rhQCNf9HIKgoc61IW0x
	M9zsV0VQPjg0Q+F4IzPtD3vmBizIbCorke9+Uzrgio6TTeCD7IRbB6JJMUa/35MoqWR0G8q9FGZ
	FPdjrPBpZ1LDdS9FBSEZ7CohJUTfHbdaBw2IbbxPOrxMwMXtKZXUrhuV7bppVWrFwIbe3K7Wxpl
	ZMIpQ4EQweJWaNuiqqD0eMa6qSBKgITSNIPeRSPfclTpvjBR7Uc4CEJbbDIAMAmBzXHoEcBFoj5
	GwAGUGCUZBYBMoYHx5AB/3+/FqG62FqzvhvYkpmTcKWv1GJzBZkPdVKozmMPtnUVNpItrgdjlMy
	1tzIngy5TcOlNhc6F
X-Google-Smtp-Source: AGHT+IGwj1vYRM34MvLwuBy+TO7NC2p5Qze5GzXzAOBX4XqB3oeg9resaDD7r2lfy412opi9HxS22w==
X-Received: by 2002:a05:6402:214d:b0:609:b263:41c9 with SMTP id 4fb4d7f45d1cf-609b26351cbmr5554526a12.32.1750322734545;
        Thu, 19 Jun 2025 01:45:34 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:34 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 3/4 V2] Staging: media: atomisp: i2c: struct definition style
Date: Thu, 19 Jun 2025 10:44:22 +0200
Message-Id: <20250619084420.146151-3-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder const qualifier in array declaration

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

