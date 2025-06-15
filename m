Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA15280CE0
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029110; cv=none; b=HxAapohO962+19u0Pvq54pzG8jwvWnNQZ1PLjSsGVbPqu55HIK3fFPov57se0vQOdXhS1nOonuR5ZRHQ0LrUOh7C4rOhiyQYcaSRT85R6zTRQKPtlDrZWVRWO2N+PVPOpC5EWmfG7FCcTl0xA2UrbgB5dqMBywVa4eoTbIFzZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029110; c=relaxed/simple;
	bh=Kud0ZDKv36NQTtHqZ3XaKVGMQgCLh9H9LuMDKSluAH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gr2urKO6DhNzaII3W9lROs1R1hhOzxUBgl50PX4uQuvv5UzhK9iVYQ4AjC+oEPqOQJTzFM3ZKx3ogtnanxVcIZL2NzywfCo2hPylDWTfV898wrghUa8s3T3wjoVrty7Z279yeIfWEFhhrRdGcLvfZOCObxYuSB/tIta5mmIIWug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT4qWx0I; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT4qWx0I"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so7626384a12.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029106; x=1750633906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxWN1gA+Bf6LWP1jGHLt8GUhEzDBQFmcviL2/3QVjeI=;
        b=YT4qWx0IgH477oHmzfWM6d2G9aF4YLqSk/zF/qnYa18wvgsvDkYVMtSM1CNepVAbTB
         10yI+8oQHFkgZLLlcYI8jLPT9o2zto/T4Z8D1c8bDtsbZAInRZHANsiGmt5D/BSPXWdR
         Se0zkHUlsDOkpq6V6XtrehWDmHqfqMu2SCoq2tg0b3Y1ZvO0S36yJRXzBNpyPLfXiOT3
         0HymxfLFmo/rObwnChLtKqpFbxMdr8Fnm/NBNdnxKf8tkfJo/MkZc9nInZmWAXicMUsG
         GnErula5vi+F/4ac8iMDZLICoS6ykE6bqMmX+lwAVhFJtRcjLAWguhuTZNY0Zt0Xq5kq
         ayzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029106; x=1750633906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxWN1gA+Bf6LWP1jGHLt8GUhEzDBQFmcviL2/3QVjeI=;
        b=WByKi+jUMyx1dRJWokf05qhTshN+dmlwhrYLxH4/CV2ODOrkny1UvKpsKhJQvy2DWS
         r8VRaMnUibhlgWWK6wAVffjV5fFHoyaSaXC4zX/oz7cAYvvAcmtG5SHCPUwIWm9xTdxT
         6EoQ8BVlHpIehV2MZ/+Jnc5KJpiytTk9RQQI36PQvB/b3wEwgeSRMbru92nT2RHl4FZv
         p/Wy1O0ArdS/nJwbdOhCTkYxpOc8NN0XCXtwvpVBCS6h8dsIQxZFVPExyqIWzlXzCF9h
         9a4RYmvuAb7iVqEMUL0C78KfVQa5qCjNxCzoIMQiP+ZpTEVyzOVua4MX2/qtkSf6qjfz
         1Iog==
X-Forwarded-Encrypted: i=1; AJvYcCUzZMjj76tV3IRmnTHTtz/bcPV6eUs+xtEdc+P/wmDM90MiTavjaG1IPSO4d8JhbHBeHjOP56PPDoFll4df@lists.linux.dev
X-Gm-Message-State: AOJu0YzvKgnbgsveEcrXvrud4LJVc1Titk07iISNLhx4DjspqNAyChSh
	qvuvEwLKKKq8NoOQs12bSHBoEPnDe8ARLUYLyDVQw4i+JahgDLv/gquD
X-Gm-Gg: ASbGncuiWDPEbu9DfBXT6rmRH8z2P2n65uNoHCaIqzILbZjAyXRpBP5AAHBwt8yzzMB
	m8KZsaEgcYApzzjR08b4FjmG87PLcCIhElha7RMuQuulXPO2oZ/LjgRutGczZdzEKO6RxuEPzjv
	6TMT5inRhm7t98NL+vxa6hWVaRdl1FcD30pDJbmmSW9q19AHYBoS+XsXHomVKa+UcOwnG367tza
	i56OMx+HYzARehpW9QgNyDWfdfN4IstDod7nP/eYQgBXqgv6ii2cqraJ2DA9K9txnhNc1QTIwWf
	3lJdSOAefyTuhNloBj5Eo5fjMai+ZyoshXShm9xCWGKsOJiwH1lp18VkqcEEq8SpAjqjFk2Dcz6
	U7A0B+0qSonsgA5aR40t0XCuluCg+HHtrYsY+UaKHLRsr1GPZJaC+6MOYvN5+G6Z6VVMeWLnL2v
	vHBOJ67XxeHLzAXj2XZcowEns=
X-Google-Smtp-Source: AGHT+IGPV/AVh1BjHCMPYbXWbFxMjSjPBLnbi5VireXDHKGZ+zJX1aGiITRbtCZ2Nr31wAZKL4TnLg==
X-Received: by 2002:a17:907:97d4:b0:ad2:3fa9:7511 with SMTP id a640c23a62f3a-adfad4513e4mr717603466b.41.1750029106300;
        Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:46 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/5] Staging: media: atomisp: i2c: struct definition style
Date: Mon, 16 Jun 2025 01:11:43 +0200
Message-Id: <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>
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

From `static struct ov2722_reg const` to `static const struct ov2722_reg`

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/ov2722.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index bc36133f3722..00317d105305 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -236,7 +236,7 @@ struct ov2722_write_ctrl {
  * Register settings for various resolution
  */
 #if 0
-static struct ov2722_reg const ov2722_QVGA_30fps[] = {
+static const struct ov2722_reg ov2722_QVGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x0c},
 	{OV2722_8BIT, 0x373a, 0x1c},
@@ -346,7 +346,7 @@ static struct ov2722_reg const ov2722_QVGA_30fps[] = {
 
 };
 
-static struct ov2722_reg const ov2722_480P_30fps[] = {
+static const struct ov2722_reg ov2722_480P_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -455,7 +455,7 @@ static struct ov2722_reg const ov2722_480P_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0},
 };
 
-static struct ov2722_reg const ov2722_VGA_30fps[] = {
+static const struct ov2722_reg ov2722_VGA_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x18},
 	{OV2722_8BIT, 0x373a, 0x3c},
@@ -565,7 +565,7 @@ static struct ov2722_reg const ov2722_VGA_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1632_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -667,7 +667,7 @@ static struct ov2722_reg const ov2722_1632_1092_30fps[] = {
 	{OV2722_TOK_TERM, 0, 0}
 };
 
-static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
+static const struct ov2722_reg ov2722_1452_1092_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for
 				a whole frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -769,7 +769,7 @@ static struct ov2722_reg const ov2722_1452_1092_30fps[] = {
 };
 
 #if 0
-static struct ov2722_reg const ov2722_1M3_30fps[] = {
+static const struct ov2722_reg ov2722_1M3_30fps[] = {
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
 	{OV2722_8BIT, 0x373a, 0x60},
@@ -877,7 +877,7 @@ static struct ov2722_reg const ov2722_1M3_30fps[] = {
 };
 #endif
 
-static struct ov2722_reg const ov2722_1080p_30fps[] = {
+static const struct ov2722_reg ov2722_1080p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03}, /* For stand wait for a whole
 					frame complete.(vblank) */
 	{OV2722_8BIT, 0x3718, 0x10},
@@ -983,7 +983,7 @@ static struct ov2722_reg const ov2722_1080p_30fps[] = {
 };
 
 #if 0 /* Currently unused */
-static struct ov2722_reg const ov2722_720p_30fps[] = {
+static const struct ov2722_reg ov2722_720p_30fps[] = {
 	{OV2722_8BIT, 0x3021, 0x03},
 	{OV2722_8BIT, 0x3718, 0x10},
 	{OV2722_8BIT, 0x3702, 0x24},
-- 
2.34.1

