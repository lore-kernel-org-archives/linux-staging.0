Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBD3A7F48
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513002; cv=none; b=S/caQSVTOvZj+aO9SRTRlSnvmE6dyNxUy7NrOnuKc9A2F1SnCH5nilgs3r3VWFAFDmxw9oYVlXZz8lPgeXBqn9uijw6DTxjUuZa9tcOKWJluQ3Csz9M2716UWXwv6kKamn6AyUshCsXi2+UxkAf9MTJ1A6PtHKXi7ZiV/knaztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513002; c=relaxed/simple;
	bh=UoObvnnZRPgdvTgqoymjmAp+D17szqmEHwzVj+aDlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7ZtpoA/HtsRNT7LRQ/kHlSgzLXB2YSRSLkA+J2DLakYE2OZuLf6egOoSRvulbbWOi8GJHsyyiR93SluH5gxhmPPMkGbBuSnt9aNKRxn/ROFlxsqXkn/o0EOMcSPZoLz1+Pp6bNwTzapfnWM7Efv9mB4g4++kI+/IYpZVo7IaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT/g1Boh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT/g1Boh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b96760easo6978105e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774512999; x=1775117799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=ZT/g1BohxeC1fkoyqItukVSjHPXWEvkgrEufwcI2e91OyLhZlrIgM6c0QGB1FdsPa3
         gK37TqlEH/qK+7pCS0szMiwmRrBLAmLB16YfqaGJN+hTL5KtZasSCyZmhkMZh+g08335
         7alpV2lSoLowrFmawnK7Alfhon823ycBNFTu6qiBqYm0qMeGNn3dIYoAoOaNVZqNhq21
         h7LzPB4oacbrQp9bc+frZ8tGS2sjiuBM9qfZZw0vHK9lJKRT66xO6CUzM3cnj6Zoaabm
         mKYJCBOBzYuPIkEpaJJLiP6MpRSzDFluQU+nhRIo1LAH/rmuAQVy5dEHzY/yncsPfzmI
         Aisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512999; x=1775117799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxfMVpIjXpWEhI2DEdBaY44M11aQ1DT160hMDVvL9os=;
        b=i79Bt2VcLPP3sgC9uwh045wWV1nNiLJUsLjzCF452wZIBOBMBOgdVd1ixTqxWGr+X7
         kccahrgtEEOb7U2OHx5xlHYmXNA+o9yQZ+4KSjhyLmg2l3yVBC2JQebEfRb77lhbMDh6
         VgV7ObCRcQ8Rf+rgmhr+5t+KauGIxF0H36a3ZaM3ivMIiL2LnPE3AYzT5DfMENIxQSXb
         G/PaUhmFPLB+/+u6m+x3gLnpnJDbWM2LNgtSeyzzp2Pmt0RbEKQAHobLI7LlcdPL0I9h
         44HILOXUv9A5LoUz2cp30PXR2FzwC9WLc6+D/pDnZxMvu0c06zH0+X8k1TyNWNhCWw5Y
         8qvg==
X-Gm-Message-State: AOJu0YxLUNVpXdtNfRcKTwS2FFNSmi1hTFzbwfMEe5eOmplZ/wiQt4Sc
	Yf5euDCydNPXf8VU2wJNdDMynJl7EmBjudNGZGl0E6xt6EAUZzeLw5ua
X-Gm-Gg: ATEYQzwKMwGtjYmigTfRn5CazHjo4HNrUFnYp7GcfqPo7qB6wCm6A4BSsaGLAMtSR2I
	gNmZWD4SfW0KOaBVcdOmXqEwB4YtF6qJ7M3zr9fS5cAqW+73DtLllox1AJqXxeUeQncFbz5GFXc
	IpaEAmecobsaxX3dhlWjKvG51NMXpdJxghSqKyDAqgS02RbZ/fGEb3xxaPp6qZ4mymtK1lPUKUu
	pRu2qjcpwRU2lhxbnKEMPPwML0RTNnap/wBcxFuipzJnqXKAE+jMg7MILtfvELQ1k0V8AZGQlzn
	S5RAQJW70f55rugfQDXEjtU2XARKYsjvIjBuufSiQNW/uPrFOQPkEbLBjbG+CHNv/mUqCxapMEo
	nHic5K85jXMz46zHfIWjwn9er5WML+z3/u7T8gW3mBOf6btlxhLWB+OUHtc9jvxevaJsooM+rzJ
	r3O7fAsGiUUivEN9roYTPRlxhekoTOw9kmcQ==
X-Received: by 2002:a05:600c:4f89:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-48715fd4667mr89614655e9.6.1774512999121;
        Thu, 26 Mar 2026 01:16:39 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm32886045e9.2.2026.03.26.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:16:38 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 2/4] staging: rtl8723bs: cleanup return in sdio_init()
Date: Thu, 26 Mar 2026 09:16:24 +0100
Message-ID: <20260326081627.5841-3-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081627.5841-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081627.5841-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_init() return errno from sdio_enable_func or
sdio_set_block_size instead of _SUCCESS/_FAIL vendor-defined
macros.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 358eac0837cf..01b5d8a70072 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 release:
 	sdio_release_host(func);
 
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
+	return err;
 }
 
 static void sdio_deinit(struct dvobj_priv *dvobj)
-- 
2.51.0

