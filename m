Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F451A239A
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775910953; cv=none; b=gwwcJzDYo0GBCWun2X8XeRRD3xWh55il0GdHtZOYAJX3lyiZm5ckOsHIqSuHPb4ZRwYDSZP6OJ5RT9kxRn1f5KXBybtLupos7XdO1zropgVpMHAnEGJv0hfo8VI6V40SzbGoxdZ4IShjG4UZgSYNWZ+RJEFb9M1uORWdGZpsG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775910953; c=relaxed/simple;
	bh=jglBWZpM6gb6r4jnk+50+pDuOMLGeUPfxSTArYCfDN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nhXAGVQuJC7XTQQoHGrzZoSScV/NYu9/H6taSt2lH3kZpXRd7+V1ALmZ6OsFORAc1P9HN+e2TP9rTlhLt33KzqqfSi6jJt874wResp99jkbEVx/pzyjYBw4M4/viGhg1Rnyrg9nvSDweNTSwyHLOIlm3lE51acyQ9lLe3UIyEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sZSacmjC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZSacmjC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso43883055e9.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775910950; x=1776515750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqmzVUPIgrnm/cJHXSiJKFWklEbsgCfd4TNnk6J9pOM=;
        b=sZSacmjCRtRuioZoo8I90XTgRaBlFa3Fg1UpiDTy/qlHcfJEPp+gZntLmp84S4RaTY
         IZfU3RPxhVpKi84MGoIij/GlTysHrfbmtgtUmAXNrnTXmkT2jkbH83m7FNGQD3aI0Kdy
         R4Au35bRCcqXo4AbrEKPzVLwQmFAHTRiUm7YKYaJSC6WqMlF/cPl2DNz/lplvpt5SuTW
         YvEI4qnbSBNtUINLPrsgRYaLJNrJ4IdKwdZ2oSYKbtfwB4BsUhEAtSxi3ZQbPF9UEr+b
         JAsoPta1VuPmsvikuwg4p01H3D+0QqV6jzB8VQpZtY8g0bYbeYZyAFE7yOqEpDiAl8IM
         1AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775910950; x=1776515750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqmzVUPIgrnm/cJHXSiJKFWklEbsgCfd4TNnk6J9pOM=;
        b=T25Z1rbSIv7Vi2qjS0uiEtPg4UXA164aPwneh2b7m8LS5JdZHH2IcPJcDzMSQ7YTcQ
         lfvfWnLl9hq/gJc/9Z+m1hAi5pwkYpEadaJTAkWzBYyKS+jmJVdWzqeGZqGLMojfaA9c
         3yztnnj4vznuzJ3A33viRMGiXRBZWkAA7+avrzc68E7208lRgE835jePcMkzaCyZVfM1
         phsM4+rUcrrHTMcloE3qcN9M3VKKLRFYEGW1uABEw+SIqX32w7dbRWJjoFkDtV2WqZnj
         Q2/taBRiBGVvsHAfA2XimDn9obZciL+CIgo9IPm9m+6S8yciyZQO15ByfytxlctJs0Cd
         4z1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWHYGRbPFz8ePiF8/Y1S2YO4Ukj8qfGDz3xgOGYEJNRk+jfEA2rF60NzA324MLQZ6V+E2zIYbPkHsJUHou@lists.linux.dev
X-Gm-Message-State: AOJu0YzuO1U4IZSGKXV5pbxQ4p60X2t+CSgKb9p2/h+qsr3hnZNVOnwt
	COwR1GnOZz6RX2IdpzDCMVsfrzkc9ccoc6ogZ7neEqPDd4Q90nAzt/zg
X-Gm-Gg: AeBDieslqSrXpZR0LZWsminlwHF9jlR+cahG6kw2zp8TddguXjaX/AHdvx2u9UOyL7U
	BdL4XNeYVExl7viUOCUvxk/rpfwiguMWfjm2eFcF9whT6iiu4XUOaHYUXnZxYLq09fGIy/3QLPg
	g0LxW+GPGxygF8O8LMWkZLcuidO0arzRbn8TT5WLsrvTQ3kCrzlGY8x7No+DaDPJ4iYgcDZcu6U
	vDynPqMDVKArS53t6cF9tkpgWzUSAhchYzSZH5zpDQn3FyQ+2XJruJWYj5RWuPdEmdFuTZHxFW7
	0/rf4b6hH/lmkJ7PSFiTw/mbpJk9eH7SrywxtSK4Qrzvszuw5XM5O2taas+cBYz8TBCd74P+I8N
	KAFOGGIu06h42eF2udsWombAIMh5fbuJSBDujyurNrZgtwZy2shT9TrnZggGrOngtnMSpfHCdul
	xiELM2ho4boNbWgU+3fZCqv9TdROcIBuChyG+0nvuDKbEj44z2HohsP/IDCZLsCKwkoZVIKPT2K
	KmivgEWtpJpGmwceO1n81882XJRszQq5g0Y/rnOAqMnb1XDWyQyrWTTSvdCyqlAXQq5YPWd49fw
	FZu+VAUodPbah2EnNh6Qpt2MpdMPR6fYx7N+4ydghFzs8Oi3tpFEYr9M8oWlA4nlyk5eM264CwO
	GH2KK46WGGA==
X-Received: by 2002:a05:600c:5298:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-488d68820abmr97898505e9.27.1775910950228;
        Sat, 11 Apr 2026 05:35:50 -0700 (PDT)
Received: from localhost.localdomain (ip-86-49-246-182.bb.vodafone.cz. [86.49.246.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm103104385e9.5.2026.04.11.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:35:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v3 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
Date: Sat, 11 Apr 2026 14:35:11 +0200
Message-Id: <20260411123512.84739-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260411123512.84739-1-joshua.crofts1@gmail.com>
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove kernel.h proxy header and add bitops.h for
better dependency control and code clarity.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
 - removed redundant bits.h header

 drivers/staging/iio/frequency/ad9832.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
index b87ea1781b..8873a6d11e 100644
--- a/drivers/staging/iio/frequency/ad9832.c
+++ b/drivers/staging/iio/frequency/ad9832.c
@@ -8,11 +8,10 @@
 #include <asm/div64.h>
 
 #include <linux/bitfield.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-- 
2.34.1

