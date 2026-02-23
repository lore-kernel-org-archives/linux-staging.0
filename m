Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9949E3783D6
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879242; cv=none; b=PygTuTLHAr23Dc6Sn+Gw77EnKrLqSjg7zvzHZw6bEq/6BqUBgB+12x1C++VKjk8CeTOBthIXL3skFYecFGu9anwhqpjsKCz3aIwdFjlroLXm5g5tZjcUVWoqEGKEAcm7f3NmH25U0QAeOOA38M+W2LKcY/lAZ2H4tQ0niHX6ng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879242; c=relaxed/simple;
	bh=NRQwI6TmL2IKeWIAx7S2S2wqR/TNZfIFLvA1ahBVnVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1h2B6aEIOOs6xDbPyCdzuZCbKcUOEgb4Mz0UDeL9lJu2hM+SYq+JIGGwwk+hT1uP61hVUbTA9WFBMOl2QK5bdUSIPcJRlfYzIww+Hwk1/iruSsxXSDV8xwgvJbrDF1l+OGxNS+HDg0EDcQgmPiKt6crjQE6l07mVzZIJ+catAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVnNMuVV; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVnNMuVV"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c187dfc82so5719324a12.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 12:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771879239; x=1772484039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ELquU/BaaymPivUHfKf5zJ61qrSoMhbuyB3hLAdp2A=;
        b=eVnNMuVVTwawY9Ablb64vF4Wu52ABFYF2v4vwNtmRb9/LvZaC9LmaCt9KE6EucyHMv
         W5FCjJIj5MHX3h7uZUwJ+3TuschpmtQjSEp/oDzvm2ytsoL4TNAzvdpjz45+/78Nm5x6
         UOc8B3/T8NTv1a5KtUsCnWZj4Hz6TXHOooUD5ItVhcHB98RO25vchLS6e51xLlCYKFnF
         wPajYxqHbBd7OtWhKkasTuXJdQk4dwj/bN0mXQPuReg7uwOP5yxmizIvG0RWa9t0w3jx
         tOAvT8xnCnrAXMIdKF3/O1Wgd9yx1Ux+3rlDKA0ccVoAFCToDrBIygqZApPpbjLlJ/EX
         t9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879239; x=1772484039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ELquU/BaaymPivUHfKf5zJ61qrSoMhbuyB3hLAdp2A=;
        b=g+W2d2ph39CaOb/nTpOMkzMSm8wU2atV8apy2PK3SCWoSbkLENs5HrxazIN2jDAzd5
         aALHA3C3BL353LFF07G06rVbx2bmwC+GrSNXDYrit9z1S1yo7fQkxprovJI8fGE6HZ+0
         p1DgAkRP6HLdkHO55m8lufKMve2Vt8HVEfI1wZ7VecJPmjGEzjbmJvE/Rn47X1ZyNF+N
         h3c+iIMI09tOMBWfIHSUe0hxlmvYR9ChM4V6xwDEAwCdGJhyyg0VJsZmDu1vN1Se0tJm
         m//ZkNSP7clTfsNNltWKSDlzsT89xjapFOvgA656dt/kil8PUZOA/0E/D2921dJew9nJ
         TsSg==
X-Forwarded-Encrypted: i=1; AJvYcCUVSjRBvFjc/pyG2hHgr5UxHXQk7Cma2qvia/AnTMOprTwsI4Guu78VOSOUd7CcuLgJYRUvt7w8QCASguUy@lists.linux.dev
X-Gm-Message-State: AOJu0YwzbuK2NHK3hxHE5aDAOqpBKHJ/v/YtPxAjE6t7lEyZ7Py143XO
	9hO7x3LQRKY2E697KVL1OsBfNa7EUffiHc0KiUsA4eZtABkWC8ELNM+z
X-Gm-Gg: ATEYQzyVWlMjpMQTBoHUMUFo1+mS1MYGxYubinN6LPE9GPjxHABoDkSWstY6t67hWrv
	oyWUkBHymLmyteXxEkYvkgKZ3bwcQQhkowsT7o2rjrL7VjzWfddmb+jWvSJbhJAFV4Wp+69uRVG
	wd+8JXOvCbP94qRpBiIqeIo/7b0tW716vhMg33KFrNGaIVWB5bf8p+DQZworRL4lMqo/8tlwxJ9
	K4TvJY6t3SB6YjQmQGYQHJHgl03jWz1lQZKXUqdc56bhezPvF3HnH9mf671u20EEsEYm0Pi7tHc
	5FyQ6DE3+d04Q42CEKN5FY6PdcLc28bNS/OaBGLtXzhhYroaiaDxoLGL6s1UwptPC6HKYOYIqTQ
	tDxWYVxf5xX/EJX/pSeeCV9g680x8riKdIb4NbBDthwaTB2rZBni/BJjrfob5sljsOBgiDS/+6e
	aip9iN545D0CqAMX8WC7sApe4vvLIcvwBXL7YxV1yG9A98Ah/u1J0SlPDzHfFOAZofNRMba8gcu
	NHr0ZUxPSUAQ8dPl+8lJW/ZAEbbdbFi45RSs+4/Z8lg4MvXFyLXkrfXtc0UD2rR+PkX0zPdNB01
X-Received: by 2002:a05:6402:2707:b0:65a:39ad:d647 with SMTP id 4fb4d7f45d1cf-65ea4ef7bc2mr5998253a12.17.1771879238825;
        Mon, 23 Feb 2026 12:40:38 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (186.209.141.34.bc.googleusercontent.com. [34.141.209.186])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9aae0csm2818662a12.10.2026.02.23.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:40:38 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v5 2/2] staging: sm750fb: convert logging to device-based in sm750_hw.c
Date: Mon, 23 Feb 2026 20:40:36 +0000
Message-ID: <20260223204036.1780-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223204036.1780-1-iprintercanon@gmail.com>
References: <20260223204036.1780-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() calls with dev_err() using &pdev->dev or
&sm750_dev->pdev->dev to provide proper device context in log
messages. This makes it easier to identify which device generated
the message when multiple framebuffer devices are present.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a5c2dbca00ec..666ab76a1d32 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -42,7 +42,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	 */
 	ret = pci_request_region(pdev, 1, "sm750fb");
 	if (ret) {
-		pr_err("Can not request PCI regions.\n");
+		dev_err(&pdev->dev, "Can not request PCI regions.\n");
 		goto exit;
 	}
 
@@ -50,7 +50,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	sm750_dev->pvReg =
 		ioremap(sm750_dev->vidreg_start, sm750_dev->vidreg_size);
 	if (!sm750_dev->pvReg) {
-		pr_err("mmio failed\n");
+		dev_err(&pdev->dev, "mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
@@ -75,7 +75,7 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		ioremap_wc(sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 	if (!sm750_dev->pvMem) {
 		iounmap(sm750_dev->pvReg);
-		pr_err("Map video memory failed\n");
+		dev_err(&pdev->dev, "Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	}
@@ -291,7 +291,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
-		pr_err("Set mode timing failed\n");
+		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
 		goto exit;
 	}
 
-- 
2.43.0

