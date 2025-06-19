Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1E7263C8F
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322747; cv=none; b=jQVWfZougK7MZpMsFJogUvEg+8U3T9abg3H28toU1hCudtUGJJPy9vOFitlpjp1mjtxG8ufLnZo83wUV41QH8tkaek5124u0Tl6I+0/hix/OkN333hVyiva9ha7XCxDmA+dQg00yN0hshNZYOn7/ewNUTykodbvMtPWgb0keHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322747; c=relaxed/simple;
	bh=pZCCuJtMXW+Sk5A05vG608WxmNHl7vWyCGkPb08W+4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5FgVyMB6IrGMC7nqQCuTFju3cqVDUWxRgce9KJco9vqm+461end2+iD/bkpUy2uXkCmh0T9/8wciQpKg9evlUVBn2VXXH9lgArgi0NMqsF96kOfxhCLhi/7r3ySPjDy/0wTbRYemH9FqCxIFlwVcjyR94VeFwPwuCok4OwVOrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5h2mBf4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5h2mBf4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso1041032a12.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 01:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750322743; x=1750927543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvaERkbwLq6kAlzor3nDw/43C+87Vnd9ZfjPg7pUV1M=;
        b=g5h2mBf4e4G6GZ4jjMOeOH0im81J5DqohY4d5K7XGStn4TKxtn/H7qiLoxJjVb6lVB
         5xF5M+1RGBzIOPAkfp6mDQyNx0dBc+bfT1j4LHQ3PluwF6RrMusu59gLp/1Smyx1lV/s
         9UN5vfSOPMluMY0yMy5sDZF+gLY0Xo4U5axFcPPuJ4aMe892tUemtkxiApIkiTr38DCJ
         7MHHF3N89CgiR2Q9rwTcnwQhxdxGDjqCnAyIb2H+AthOxsnBTrNSHP0XPsZom37JazOo
         oRPTckT+c1jXDicNwWHuo1b8c/pnkM65AogGuB8y3jjBKHzh90ftRuCtwvGngApShIkE
         Z1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322743; x=1750927543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvaERkbwLq6kAlzor3nDw/43C+87Vnd9ZfjPg7pUV1M=;
        b=RiZVphcvpPcaToszKg28K/9QXPJydT05a0EWQqUzb2anSlSJXQsXhK2asdHZYjdGou
         ZG9FS6yd1pctbpyrt8tGJzaj745pOhlxvRBQJsYvWThUsq0R0eyh3mGO9BDclNH+0HvQ
         eMvDkCY3yNmNld++7bu/PkUoVou92QqOPRojApFjdqV3Hl64S8TPcHoXoavssLHrt1Zo
         zLxjAwEDu2vJDFNcGQeB0slvNd+TetMuOWGt5UhLhdPenB8IoNH7D1m1GOdvNCjeM/jx
         hd/BmKrrAUTvI0l8D8IwEYLLMtEGmpj0dLT8O++KAp3kTAPQuJNTO7scmg9t1Kiy2TeX
         39Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWqL1P4CKLNITTQlUskF5BuUzUWWNj6ZoDhMWTYG/GRMIXwadued0Wag3mWIpa3zOEQgQPKv0A7DddUsuwZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp9JiGrd52HLGjuZgUMQFggdBbWNqsPqrSH7LgKd8fnfcXPw42
	VmrEyKVv7kUurkCdIUtm094bPVJJrcUHPAedP/VvelYXrrHZ3sde1R5j
X-Gm-Gg: ASbGncssbyrPsssmq7Nu39GpXKoECzPWWe8DEvyP+tVRX2UNsQSwFQGQanxTNm7l+hp
	E68dWPus9cc6/l40knkN0M3p+My48gu6Ak+L7++ZiD34FuKfsFLYsYoshS/ubEdUTWt4KYJ0usF
	rP1GI2T0CBWkj7dzigx9h7wxtndTQaCOqgxuH5hxpMV40lXQz1q1LtFhtnypCZi/Un5n0osWcnf
	NeyuchWBjcA9OnVi8LbsI2ImP6EnzluEzBFpvBkHFAyLizcBEzkK23mqu58+dBWbacXPtbhuEUZ
	UPtw91T1m2lWm5SFjqwWPl2RlEvGTLIiWv62WYBdPARFOavMQo8XWkEya2PLNGghvnUKtLN29BG
	YJ0Ooew==
X-Google-Smtp-Source: AGHT+IHYZLTg9XnpvbLDURUjKOGqQXoCtaLlfY7KFUrdYfthg5IaAU0Z6abNvqwzCraWQ6H6oY93ZA==
X-Received: by 2002:a05:6402:d08:b0:607:f257:ad1e with SMTP id 4fb4d7f45d1cf-608d094bfdbmr20431777a12.22.1750322742884;
        Thu, 19 Jun 2025 01:45:42 -0700 (PDT)
Received: from chimera.vu.local ([145.108.90.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e6f0sm11276831a12.42.2025.06.19.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:45:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 4/4 V2] Staging: media: atomisp: i2c: struct definition style
Date: Thu, 19 Jun 2025 10:44:24 +0200
Message-Id: <20250619084420.146151-4-thomas.andreatta2000@gmail.com>
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

