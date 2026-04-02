Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529CC1DD0EF
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106721; cv=none; b=AlU0ubnzSKLYcQIIKaeoz9PEdad4An830OPpIa+y109aPd3sicSDdEzNITUvWk2y052AX2KruOwST9a6PhWW/7tGun8qT6Y02RTFEfbnVqbrQNOKkRj5nuO/3IuZ94Ta+S1LeJZQ9LuGSPIRONE3xLC2jWiMRuGVa8hp0S7PpDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106721; c=relaxed/simple;
	bh=mr21ss2nsKL5n4YsogAoKWnHfGUma9/dWyL28XcO4/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YtAmW7Htxzhkcdrx/qMGoUG7lhBFrSzK2cKZMWEXlI33lQv0TIXiH0/p+aL8PltpwM5WKxVAhV2c70E9MFIQh8YNHXmp+0q4zdBhSbNsFiomEL2frRA9oz6k7gCyiBlwP9auXMW0w5qDd9AkADYTgybe7xH9fQlFuutiIZgk6iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwebDvgn; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwebDvgn"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c206f0481so406157a91.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775106720; x=1775711520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGR82kGYzGlH/A5fjJKTpbsPbkO6bEvdVL/ff0kNtwY=;
        b=ZwebDvgnjP/qnGb3b8tBBBrtwWSf/IaSCdYtLvy+maX8MefPkbDILDoHiehI4ulX1c
         ZxY8Kkrou62SqVFGysAjCsvUmVT12ixkG19I2+Q04PuDp7TxSVUNTWCKEUGCUZDeSBiZ
         2gOXaCWJBMlTcCQ4L3DMjdfNHUnTGwqQp9EQWeYAerOA9rAB4CCyukU28JOk3qbu4LHv
         eguvesPQ9aIu5F4ABG9AZusMQSAsGL0emI5+cPMfyQH8bzWNoMlDFbHOIzuDpKrM/Ffl
         QTHZ3m3jXapHGBlY/+lha6f7NJ6s5TnCUCxEnCx8iC+DOGm5qqOR/MEtZ6+GakaP1tfq
         Iiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106720; x=1775711520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GGR82kGYzGlH/A5fjJKTpbsPbkO6bEvdVL/ff0kNtwY=;
        b=Th3EWrH+UVXKiEcXrfgw9d4XGZ5TMHS+Jm4rdGSDDdwA8f43/kFiRSMDPkm6UBxOLg
         vLzHeOjL4Xc7AIqUZ4mhhFkdyje2q9x3ALapDTh8NOCVqFzcBsJn7hefBJKPrzEdfB26
         LgRZk1kHINu+5EfixnMa3gd5/U8nVN43+aVm2WXBcRLSJ1cZiU0Zv1Q8aTdysIS+5YfH
         l5c9gRPqOKLwWOjicTJ2fMCj5T9CsxHSMak5Fe1D7rEKrZKvTyoyMIcL/t4QMY+K9pAW
         fkBvZPSj3EJC49NlCqKZs9KXXkHWkRfy5nf2uHpQt4izDUcyGOjyLxd93eue60HE7UW5
         gt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPa7g121t9eK9sYtau6cWlyw3EBdwPJ7yHvTxfOKfBzbFsXGIi/76WAFQbYxT6CQbXtzBKWbt4whhdk3F3@lists.linux.dev
X-Gm-Message-State: AOJu0YzeL0sbwxM1R9ezZ3Pa1Ve3jDT/KpkUUypBg8sW+fret9NNjmxZ
	U18RBEqGJK/mZkgHG7naoc+FHc46I8yfHBmVmIImbZiHRZsiSyaWk3yA
X-Gm-Gg: AeBDievUcJVGlpjNPfqsPWE68Z1khK8esjbqGS5qJEq4IQkD8FjWsad1KVYkqqpq0yO
	eL75DIIkkYfUhQl7vQVlHDbCnaiumtBYIC3TGhr7K8ZA7gPP/k7zhrB6fbDcqc16d8+AhM6QhjB
	HYxee2iSVG2dJG39yJ4WYMWEq7uAIFB6Yv5IDa2ZSsdI5S1MTGdDJA+rPU61sqlCTkvIx2Np7P6
	1NhLAQeGn8n1rVT+kpHXb3nU+mEloV2Q6sJ/Dh6/cGeRZKR0bvU/5WwfwTPYUCkjU/xq4qzsKSW
	opr9zOriEF0dbfy7bWy0fvfgAB9KDDOx1YS2LLGLYujwM0DpB5i2rRlgsTCOJx6L9L9G6LKX6et
	isUjJTmdYsb3bZSAAQzeLrwqiTMsULMfRH1ZX3IeNFMc+5yEPQF09sW8SFBB2eeKtGUmSMSJ1KK
	z9I7rbVpZvoGlhXx5cs93quhdxHAhkOc65lu4ClIHoWKMzVvVCQz7cqW7r2V68OpJLJngqHWW8D
	Ls=
X-Received: by 2002:a17:902:f642:b0:2b0:c451:ae8a with SMTP id d9443c01a7336-2b2758933a0mr18884395ad.13.1775106719694;
        Wed, 01 Apr 2026 22:11:59 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:a459:5c89:eaa2:f305])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d54bsm14652405ad.1.2026.04.01.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:11:59 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v2 2/2] staging: greybus: fix alignment to match open parenthesis
Date: Thu,  2 Apr 2026 14:11:24 +0900
Message-ID: <20260402051124.101197-3-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402051124.101197-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260402051124.101197-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 0ef88b7d24de0..ba4b16b045571 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);
-- 
2.43.0

