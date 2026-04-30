Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6763FFADF
	for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571685; cv=none; b=EPu8G7XaxhLgFcW17j8fUA49JJn6k/2WmdXa2REHkEYNKFPVJVqP4qRXP6bDgLr8JJ2CziRpguSqYFZdcp5LsZsBh0SZjWmN+lMdbVPRch+8Nnfptwz0HCyrEkPGXKxuSM7Ky9i7Y76AN5m9GO4l7ulH42r4PMjiZxCaQ+PAarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571685; c=relaxed/simple;
	bh=lzOKV1O/Glw/MWZw3ivd9kB27DNT2OB+FZ9DhMAdVMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGZtJj5ARpnl1XKpaQZq/k8lmEY4cQ22cXMedCgA3619I00kdykVp+2p1bia4RKwBJwLKIMiIK2IWio5onMKuCkJtI5TjquRXfJEi6z/QSfST6EOZnlVfmpxj3KFgmMiEALKELlu5mt3Pml9zf/lZ8Zh67pSvZpbZcFKByH2qK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwkBcwLk; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwkBcwLk"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-79a535e7c00so13739257b3.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Apr 2026 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571684; x=1778176484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3dimdmnPw7p7h4vp2Fv8tAEKCuPapstxfNs8Fmggzg=;
        b=TwkBcwLk+RStLFuO6cPMgjgTNNY502RCqjzTg5p3GnfczSV0blactrabRIriac4AjS
         F5Wnnbq7tCVKj5B2POqP3Kem3r+XqkXp7+qKTp7/YCBiXa3nN3qONErC8S0L81yPLoR0
         SOCWqq8ythXWX9MKunIf/EAj/5Ux59uMbVv+8pVUio9ab6z08mP+HulUiURqZHdSqnca
         RqLpvqev3peMsZfJBiBZ2oOT07qmYdgD4+cbq0nWrreBFJ8xwgibnQamWeNl50N1W7XJ
         V0bFJGduU2NqR4+NXCLXiqCUbHJ4B/GPxrSzjp8/WngxZlDY23LeDCiNa6gXHgaZNL84
         4fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571684; x=1778176484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3dimdmnPw7p7h4vp2Fv8tAEKCuPapstxfNs8Fmggzg=;
        b=PIsOLDdE0m5kEAggwcXyqgs7Ry4TTweEr/C5R3h4kpAkeYNVuKorgLVu8Sw2ToDcH9
         Ne7gPq9KToYYpE5A6FVjpyWWbEj+2NKNA3dJAkUEn+P4cqS5F7ZuLEViaEI9vVCvogH/
         oekat+kGLPmjyIXI3VHBjpf1K5p4G2fakItJzuF4kzty9fbY1h8I2aDkSNv1tjtSGQQX
         q1GGN8nJto3gLd8pIJgirL4vzTUq7NVOZ+Xtso2jTO7u/GebX4zXKuShkKTKZQ/XN1Pc
         Wxq5lcvrdjzPbhu/S1Oqahi7OGE1CUHEh2NnvIemmRABzoRyGvimi4Pei8J16fafAG3Q
         g7yw==
X-Forwarded-Encrypted: i=1; AFNElJ+pzbJxspwZI4qRA4l8YVg5qV3O+7ICEv55x7inbuyhNUV3zm7UO3GiQ6EQKsV9vUEEkJSonB8J3k5QpmG8@lists.linux.dev
X-Gm-Message-State: AOJu0YzTAMlP4TGf1Q1F+1og5O05av3ihgoAEqQKtLas89Qq36njzqGD
	bOR4B07L5g6343kTfQXtK1rhqHNLL3DUGwsAmiH3yL+gNwQFLDPZQqRf
X-Gm-Gg: AeBDiescL78M1k5Zs4uH7yAx2+22LS1LXILANx5wqsFbMieWtdQ+KEx79D1p/fi0iHf
	f2HvZdYMoCLlRx6Z9SQpeU93qj3SwpBfREmwS5boXFkTqtw6/4OP15HxLJZcVOOlCmHYHAzblfa
	3o7UQk6K8gcKowAMUVyhejyGPRv1JI4fAb9bndX9H/rTTF+k2IgeweAOwQ8OkKUG/J5qgER0Ror
	7FfJB3nXkvIqItsi0A41Oh72DE9HRZzJ8ujXbl1vhxyUn53kxJiyah8nQ9q/B8xH3zeb8gWvfkX
	zzLzCvJeq4lp0Vpx9mOU7avCZDASET06+2HeOHhVvLoeWC8AYESQeYAPxBa7CAWuEXhY8Dgci58
	UYWlM5J3Zf4rXtuFiiBdp8U5wJ3HsHHYI/gCaXdaXWxD0RslUUHX14MVAJWxA6eo8ay+SN/6RX1
	LKm5cmJ0janOXDuqHojCilalmU24QLwUOUVPse3X5qOZ0CcERzHnhrvaYOynY040BPhApzk+27E
	A==
X-Received: by 2002:a05:690c:97:b0:7bd:6129:f245 with SMTP id 00721157ae682-7bd6129f547mr15443587b3.14.1777571683712;
        Thu, 30 Apr 2026 10:54:43 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6686ead7sm327347b3.39.2026.04.30.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:54:43 -0700 (PDT)
From: Bentley Blacketer <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bentley Blacketer <sonionwhat@gmail.com>
Subject: [PATCH v4] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
Date: Thu, 30 Apr 2026 13:54:36 -0400
Message-ID: <20260430175437.3699-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
Changes in v4:
 - Fixed duplicate Signed-off-by
 - Fixed missing tab on snprintf line
Changes in v3:
 - Fixed author name mismatch
Changes in v2:
 - Fixed whitespace issues
 - Moved testing note below --- line

 drivers/staging/greybus/bootrom.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..9e0f24d6d 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -168,13 +168,8 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

