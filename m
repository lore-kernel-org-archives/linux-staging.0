Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7CA2E6CAB
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892338; cv=none; b=FP7hglpv843wzYxMhLQwGmixv94kAtB5K6I9F/svW7po1uBrVQ6jHrFiGqisCWvSAVcb2DR5MirPrt/OSLMjM86g9M4YgTalb7Scf0e82wYvxz3m34LyTLVyFTYKkfd9K6uU22k96qsIyKbkW8cLZzgCTgLOTXX0dTiBo6H1cl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892338; c=relaxed/simple;
	bh=UnFQI/xZ2NN2/3G0kANv0nIIcQhsiP71t+jtp73+Has=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=raceCb26yIysIA15lIwUdEposgXfUDIULCz9N+gHaqViYxygtNrwDBh/hZxHMppT02zpTKHFfaIe3YlMgK6bSVrB/TMJOR4vj11IvUbXmHI72xIqpHpsdnTQgcf6MZBROV3QtZqXnc0Kl1/wA2OtgW1pKifCM5Z8x1zMRjZzktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGHKL5GA; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGHKL5GA"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso1944274b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775892336; x=1776497136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QadZHnC1xiEz3wsZd5m0aD9GF8EBS7dTGAYQPe3wNUk=;
        b=aGHKL5GAAp0Gky2+sGaXv57/Rehzzl/GGF6yWb7doJHbVm90w9kwU2ObZyjKmXdetY
         hE06lIgDGUgnBWYvdF9lSCRrE5No0ijp4ExdAvS/uvAZ7cQamtIw+ORYVOrmcxbsjQps
         uNAJiS6vizaQP6khCRDgVF51PO9X27zza1OKdlOx5kiMntGYqPT7tk6wEbR98MDuyvlW
         miKId1/pH+B/s86BUAKarvKmQ48CwqIusVqpdvx2Ge8/I556M2IzgKZBG6ZCu9pryvgX
         35Iivk8vdsRCVJXrzK7NHc+FW4i3EP4LxN+wbl1CLzh/UPeECLb33DuELnBHJkQePY++
         9Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775892336; x=1776497136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QadZHnC1xiEz3wsZd5m0aD9GF8EBS7dTGAYQPe3wNUk=;
        b=hDbDLAg06HAH20SSRKTnXq58SR84gAZ66r5Prx0E2Wt6axqbVxmV6Bnlz+bkOLEjxb
         ByI/khj2hKVTJqgwtx3vVNIfXluLMBNr8/p4DkBuJQ7vaJ3QPt3UjkGkDtQBug8571xN
         AdqD5+1xYnuVLqw6rRM5hGPKYntprwslztgH5JlCfSB/48Xcy/YlGVxMWY0iVA5SxFQA
         ftvyW7bxpY7pt475nz3IDNsHhHrstEmbjJTlllxQxflykBOxSKkXWn8bBgM5bcFUh4fX
         5KNyF5IBFb/YAAmf5PCP2ytEVpCP4aNUB94l36CcrAIFUBnEKH3PNGtQ9bRhJPkXJqSk
         myMA==
X-Forwarded-Encrypted: i=1; AJvYcCWovHMGSQK3LbWroeg9fxJd/AkfU+J5g4eGJiklj6qYjE2joRInW+TeQS8D1CrGw4DzMEa1jOqKcwyxjWNi@lists.linux.dev
X-Gm-Message-State: AOJu0Yw03/dhbQ+81V/GjV4SqdQYl33uGJrMR2dOIAQ0qJVPH7avYllh
	vcwX+Xgl2+gonAI1OicVPr0ZeaX5EfA2SYXbzM+24WYr5eRFJbCWMJi0
X-Gm-Gg: AeBDieux9gUSmA7Jh6El5ll3cZW29oqd+oxDyxFJgXfbcQgt5t46Whg/PGyCN9w74xo
	BCnyzwNOOM2FggP3f1Bv+hwFPEVWcBNc+FV3muGR/J+Tn5BX9wi1cz3hJA5yohEqlblMenEBfzv
	O7L2mud7mHRJvteQSUrPMPb/u+F+t3COXAPBK2jCXqOmZykK68d+b4YhYTlB/csxL5UyVWabGPP
	vBiKoD9wujyGGFMKNqc6zniOIB9X2/X9PSftPuxzjtnMQLlidU4imYbh6ah4iVc3l71Fn2VWWsE
	wyv8y0T5Pe5OtX2FqmLQX9JK1KMjOumyz9rGLHC8RvMrISGfbC2ruCpnCxkcZXQJ6gr7kFnHWqv
	wlAZMODlLIaVRVfSZ5obspMu6b57FLw3RZ+T+SCtHSoYrInZ8okUsY9Z00EP8mQSqkgUmEYc26V
	edPE8PUsIwToNlkCB3GVI0MmknXhbufF0+tg/Jy+EHXmfd3VIDFJGo2eOr
X-Received: by 2002:a05:6a00:6c88:b0:829:9c5d:4342 with SMTP id d2e1a72fcca58-82f0c2ec133mr6088159b3a.54.1775892336610;
        Sat, 11 Apr 2026 00:25:36 -0700 (PDT)
Received: from kubuntu.bits-hyderabad.ac.in ([182.75.45.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee6csm4880898b3a.4.2026.04.11.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 00:25:36 -0700 (PDT)
From: Advaith Neelacantan <advaith.neelacantan@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Advaith Neelacantan <advaith.neelacantan@gmail.com>
Subject: [PATCH] staging: iio: frequency: ad9832:  use guard(mutex) for locking
Date: Sat, 11 Apr 2026 12:55:04 +0530
Message-ID: <20260411072503.106621-2-advaith.neelacantan@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace mutex lock/unlock pairs with

guard(mutex) for automatic scope-based locking.

Simplifies code by removing need to manually unlock.

Signed-off-by: Advaith Neelacantan <advaith.neelacantan@gmail.com>
---
 drivers/staging/iio/frequency/ad9832.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781..73c47a049 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -181,7 +181,7 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		goto error_ret;
 
-	mutex_lock(&st->lock);
+	guard(mutex)(&st->lock);
 	switch ((u32)this_attr->address) {
 	case AD9832_FREQ0HM:
 	case AD9832_FREQ1HM:
@@ -239,7 +239,6 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
 	default:
 		ret = -ENODEV;
 	}
-	mutex_unlock(&st->lock);
 
 error_ret:
 	return ret ? ret : len;
-- 
2.51.0

