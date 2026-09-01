Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B12D4A0F0B
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289513; cv=none; b=ZSJcug7wt9Cw6YNit1OAkOjs2+1fqFHAsKYoIsAnQLswjJ41R6Tw6y0y+RgWirECXd6O0nBYhtWTIPVWHlN7djtAfN3+2FilIEuJjI6D/xawTCvGk1jhWGgnlB+odalnL/AMLE+CDV/0IkWRUcaaJgVu3C6cUhyMwz/KERLd3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289513; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDbzSCePdDEsTWAh4Y9GgigvFNz8UbeGgED4UjL/5BEed3yZ7yYDRuAlGR0nGgLRyscYcRkAKLDwZvSYQdHuXSL3gy0spsIR8Q7zk4cfYNWPelLNrjok3TJXpM6Zbr2b4O9lZYEBawr1hEORhpqopnoPOUeVzwQHtUiTqeHDDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpjUz1fO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpjUz1fO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so1334625e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289505; x=1788894305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=JpjUz1fO0nYvzASUQy2zdOuRNw0kYi+JZq9PSQs9pFR+ciPkMQsoo2+0RvQLMqIvyT
         xna7Jv4KWc62TAF63Kk7MxeHfxhrI+E7TyQZ/WgPydJqSC4g9CgsMKVAE0pSxrbL6qs8
         7HijDmuQFb5v3CPdUQKQetb1ktmgAlWe+TTeALPRpFmEmkZZTxZSDQnXwZGD7S3XReNo
         de9dUE2I2VO/V60Ecn89IA13Ads++U0PgaI3vy4zfgkYQS2f0Rtn+mCxXSCHVvJZEffR
         xDHGiw28zv34+VCEUby8EvRrvpBcAxnqb/Mm6k9SETncgrZCCpaVcQF5g/FNpqWOAzgl
         DDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289505; x=1788894305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=mSM9ht0EnzYBl7ZfGfeIRmfi6Hs9U0Jyn+1sH7R86Z3rF1GMwIOr0Xl2DzQleiZLfj
         cwmOaSMAtMX+xRsPPEghD59rk9N3CHvpNagBO9kaxQr9Xiz7qhfOt48QhPh4H4HbKLBV
         Vsn+6bt1GCqjlsWUF8cSIXFvs28umxzRDnnIbr8h2uPxAKLRVrYLIEzQ6KQ26RXEBGc6
         Wmz/PvFkEB7FQ63a9GfluVQka52hrqeSFCb1U9jYvpbbqa215DzbNtRyzk7jKB+WNYnR
         +QgKYrMrjDIUQZTZNnc5b8VhD+pqloYH3n2d3tswiDaIFDDSf4IckZEFPokYYGzTQJVa
         os9w==
X-Forwarded-Encrypted: i=1; AHgh+Ro48FZFCixLeE8PM8RUEwZ08G7O+vf2n4fB17YYA7vcvygpf8TRGPByIVNnlD1x4C/GnP49yKjKDQO93XCY@lists.linux.dev
X-Gm-Message-State: AFuF++lTAYagm/CzWhS02LOGuMgqt+yi7eaJ9wcECl2jTnw9oZk3ZT9W
	52SimyUeJXGsU/ytdYDjncgDv3ABEgqpZHBpptRM1IAQNeloMMgj5sEk
X-Gm-Gg: AR+sD10aO7hFxkh9GVelSlrE8FFMa3/1RDq2FNlCooxDSi55fhXkB24asr3aw2iEXAf
	gd6d7DizCAk1B3CMx3qxBI+mUWMZVa57I8tmCoQ2QIitfxr1YlIzfgG/fgzayIajos5sCnYCnZk
	hGGOsSMPFuu2dVUp3VMFHRcFNLDny2PhoUuzYA0j97/86Ar4MVGoGs3YG4KxuoOlSzax0nRBxMa
	IC1a5WNaczaPlqGd6zKiRY/Nad3aLLC/8Tef4i2mvYnpRqbMHD+BlyEFxaYtbqj3H5JAY8/yGly
	0ssg6Q2YX01+61q7T1wtI8QdGkCjR4gDqR7jehIXeOQkYChuE1IA9Etugc67OQ8vT1z2TRJ26Wu
	u9Aa/30YGeuJ+8abWCpeLDJk9egKAVjUfo5s3UfyfuGSTxDJ9IgsT63hF4Y1aN6EkgcjvX7sDH7
	k7aEGOJHFzt0JhwXCrXKv26Nhbu3e3WrhrJ2dZbkqPrQnIl3ESHrw7erpuUgy1jPrC4/T3VNvSE
	Xdlbvr83bznnW3KCseopC+6dao0qj93uFk01h78ig==
X-Received: by 2002:a05:600c:3584:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cdada30e1mr187530855e9.2.1788289505444;
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/16] media: ov2740: release group hold after gain write errors
Date: Tue,  1 Sep 2026 21:04:34 +0200
Message-ID: <21c199748bf5b5b0c9eabfbe9bdd17ee665b39a7.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0

