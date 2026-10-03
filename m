Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B21441D127
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791028087; cv=none; b=DAxTyi5BOe3loS7Ic7HKwYbjEwnO0ovRcy6fbK3iMz4MTRyJZcGpUc/YSXvm7uZLpr2JwM1eAJJ0YOKhC7k24rY4+UDXx8VDJLHYMvnnQBQOEQ2R6CjAAhljStBL+Iod5XZnCdtlPnBgIKWMdWdiwFIhlcakOuEP8y37icf2pD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791028087; c=relaxed/simple;
	bh=IHTDjO5WIqUK7V7fitFO28OjUL+8J51v2bNHeHUdOhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXVDU6UI8ZNdX4Jt5OsuIKdccOp+05Ebez4s4Xeioo9B6h/4znXmKGdFEUfhPNk4jAhmEsuA9/3m2xYSk93vOvzug13Ii7uZlsNb5sl5vEZou6eXmWaqMRkMqlGdQtPo/HeHD1ikJ5QgFR7ZHkxic7AIFSd8oBsXEDyB4AYView=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sdi0sXUx; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sdi0sXUx"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so146213e87.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Oct 2026 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791028081; x=1791632881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWokyEz4Bt3D9UY753kLyTpGkMOXSDWvaQDmsEwpG6k=;
        b=Sdi0sXUxdhjejSO9c3Yo88D1Vcvk//iveLnMezA8duy1OnwLokJw6lX/osFR5PjfPD
         1QfdsUMIeicmDtRcKwMx0xcTr2ipaWOsqEqP7WvVtTRyFWtyM1oxvefKjwFnV5EsDiI0
         E+TImmh/ESK+eyCsa5jz3qXwfpmeOZCMJdsemNivFfw2rHyNpjWtzX4P3Y8qTTeiWyR6
         pwtnOfsMIHuGYmG4fY2pMqqRQdteGeEZBSiTFyL1zXgZkWZ04PCqpwPoigXLdfb6hL6u
         tz9iAUZ7C0KIhoy9vDfOWDJUO3uYtaWzS6aVUgPV7wv6/sJY4MQnnqgCOA+3iCGvKaO1
         ZSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791028081; x=1791632881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWokyEz4Bt3D9UY753kLyTpGkMOXSDWvaQDmsEwpG6k=;
        b=mn2KGwE0wL831UlqbxhE9eGOcokL01y8Sb0Fgy9jt8sDZB3iz8Xk/1rl3BbP5/NVCW
         3Z7N6uCg6G4JS8hI5iQtnZaZDGaTqQAXujNK0AC+nW+GDrtTz7LXaBvCTqYg9JYO8ZQ6
         irkMedH2jvIVlXAh+5cjjxEt1T4wZPdZq9cMhFkKXCFVdrlnpH3HM5/d2fEpvcTkZGXK
         AyDmzYDtjaGS0d/ubRoUJwy7oFPbTAB1datvr7UJspdCjP1YLhAkpzzj9LPeRNYi+uDV
         sV/e0vXhR2qbLlRYB7N8+lm+oE0qq/3k1qykf57qba5Qzwnyl98g8+up3NQsQDd2WCEU
         vbWA==
X-Gm-Message-State: AFuF++kxGuvCYouOHNBERQvgmAxHkRejI3t56TyzBREC5s+9T9NAC7/Q
	9r1b9frkgzwOQx0/nRrafSc8ecBjf+BFrr1nyHF7JI+lfYNpK7I5Ngdk
X-Gm-Gg: AYBFou3Xxp8pN29kgNyHvhGcfTQV/V7idPng+FftXgvG6wnR4ZGw9CY3I2hGCDPqLlo
	+PWJGpoK3VSKSN9faDKSJa5VZ5w5I+fnW7ihFmyqbk9qaBdmMz75/sF/vIQB98xyrwxWzDu8y7e
	zzEgVcrm4L9NfkQKKt1BS4pId6jnETkSZQg6GjrdaWdAJk1wCvyCbMZNxcIpT7UcyBOI6bfW7Vj
	tRu3yu09D3meC58Y6oMdsdCzs5Bni2wWWVcf3Mt4eQJVReMUZ9PRqZLYi0tL50pZEVcJUgwUKp3
	Z36Jy6kW+V3Ub9I9RNuzJT7YChc5gtnhPmYVrZguM9VLSLajmf3xhzw8HTta1BbD4fp87q99LTQ
	yZFbNjg1VXMymzljcdw0J+r5wS1EkGSlBYrdtoSv1UlcIb29od/rR3xQ71JdWogqDnO4+c4Tpiy
	rMchYoSqNejxiNkF/rcVimFEO5YPDlE34rkUuL22zQ9DQQjWElarxpspx8z3TVPPYa++IUfWUe1
	APwtQKJ9GfuOblnvU8HKCKqBA==
X-Received: by 2002:a05:6512:838e:b0:5ba:37c1:645c with SMTP id 2adb3069b0e04-5bb9bc36e12mr1578982e87.40.1791028080716;
        Sat, 03 Oct 2026 04:48:00 -0700 (PDT)
Received: from TimPc ([31.40.208.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79f212sm1493296e87.56.2026.10.03.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:48:00 -0700 (PDT)
From: Tymofiy Zakharchuk <timgooffical@gmail.com>
X-Google-Original-From: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
Subject: [PATCH] staging: sm750fb: fix resource leaks on probe error
Date: Sat,  3 Oct 2026 14:47:58 +0300
Message-ID: <20261003114758.1427-1-timofey.zakharchuk.research@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If sm750fb_framebuffer_alloc() fails during lynxfb_pci_probe(), only
the framebuffer structures are released. The write-combining MTRR,
the MMIO and VRAM mappings, and PCI region 1 remain allocated.

Call arch_phys_wc_del(), iounmap(), and pci_release_region() on the
release_fb error exit path to prevent leaking resources.

Signed-off-by: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb2..456b3da86 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1023,6 +1023,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 
 release_fb:
 	sm750fb_framebuffer_release(sm750_dev);
+	arch_phys_wc_del(sm750_dev->mtrr.vram);
+	iounmap(sm750_dev->vmem);
+	iounmap(sm750_dev->mmio);
+	pci_release_region(pdev, 1);
 	return err;
 }
 
-- 
2.53.0.windows.1

