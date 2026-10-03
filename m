Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA7534B1B0
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049862; cv=none; b=n7VhWYFKCbDHoohQNlldAJjCxvRlYJGrIKFrfiU1UMO2wpRPnmNbXsFjiqdgaAkc4Ghc0LN+mmfMtM95HHAYdOUbNp0meTibxYuzT/FsFgCpnrtiA0Q8cPiLDBQFNM+xBs4z58fIcbC3VyrIZn6V6rhGOnDzfX8lgG0xIa8dTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049862; c=relaxed/simple;
	bh=0lwap9DKEBiENCxqK7nP6ClnmKUmkNATd2fjK2J/Ass=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMezjlSR5adPS03QadtSZLArlG7/EAQRP9UooRpbUxWdWpu3HFjPf5Bci4F46ajZmXvmQ1DIrmSzhaFguOdjn7X/Mogdjy5zxRt0vvqxT2X5jhIAyCvCsSGdA2cBUqmOOm47PSl+SuiHoDZ4NXMFBjeZU7mf6qa0JUi9iRjwfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwZsE7V/; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwZsE7V/"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7847d8aadso8393141fa.2
        for <linux-staging@lists.linux.dev>; Sat, 03 Oct 2026 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049859; x=1791654659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA6hiYoF92Tn1xdU1KASH845xIvpyOszlv16DcmfFrc=;
        b=jwZsE7V/wZN7n2Hmij3YLLyszEZxHQqd8bKZZG0+LfUckqCfMXsTasxVM0uViqd0pI
         9tmzDrsglywlnKPj9jtzU3LXbdtbc7VMIxqE1kcg5QxrfBRgN+aEKAAQ4rpvtc9rkmpg
         MFSgqOVgHsFVNAxF4WdQUNlSwSQzyhQleU1zP3qjAP3hQoG6YFaPIwOGYpaiyZVcXJU3
         B5L4IPW97bvB5/jhSwAJhd2aF1/F+itATNZKumOiJuCwxGE4XhYgBdM6CfXhkT8AmMkf
         SziOGeeWPrflpA/UguixmzmXK/6QCZFYClpRkRqA1N2N+f7n8tdIgGSV6xwUnzLRyJyi
         sUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049859; x=1791654659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA6hiYoF92Tn1xdU1KASH845xIvpyOszlv16DcmfFrc=;
        b=S1+Ab0NmMGHGzlk0F57LhYarm0hM1d/b6bLhnaHozjKVHBv1QKN3+VSSHSSx0ulQcF
         bwosWx4HDxGxEMHg4TfChLcNTLxCwV2LlyFS8IMmpdubOCcQqL/ElEIBAzNqrMB/DHdg
         a6R7hIlAYtVi9mOHEaHzP5ErExV9NPJOVnP1CEaUNe47x+ybYuSKiprMY5glvBeA8SH7
         Gk59e9TI/xdCF6XjqOC4+HxLo1jZoQkb17QbClwUHVjbYXZXyFg0Y+8kZmN9p/+H3wJU
         f4t2UC6Lpa32+R9Wbj9TQY1d44ygNrv0JESYuTtblOivjqC7pbmgLo9sQHrqkm+LfW+a
         Z50Q==
X-Gm-Message-State: AFq9FYIsQ972Mfm9NBZIzBJz/UQ3I/Vag/NP00WHzlkyNQrjjDmj7zwA
	gjX+zoYxspdZ3ANXs/9Ullpvj7oTm1HTsIhszLsLxa8FbA2mllpv44gS
X-Gm-Gg: AYBFou1eck1FeQlm2CB60TiigGhzwebDbVxG5h3bezQdPoq6ST8iAeDF07Uw2n8LOiA
	Mo7dG81xJ4delAZIW8fuUeAK+VD05A0yZoQwV7SQgB91xzTsYVaYKZNQEB9j9u8MvZoXUpqzsvP
	OWd+HrWCVyhiFIkjqG47b5gviqNaBYAlzTQ7jAWqVzSpSku7+IUiS85dNhxIVTJMzVpjIWQhLKX
	BoKHpmJeSavtaDhHHaAGA/d4BrElc7Iv2SZjihS25s3aZfd/9Xlia5Pfe5KIVhuvq5SHcCGaAOd
	wkwXvRcmuhfysfJ79y9H/xuewMOhy516wSoY+8lmiu1riEYwIBvY7Mmo/V7kxUmpcGPIl/XKg0x
	2VkNFxImn1lcnBqfi050AHoxQPBPI8XDDog4w2MHFSB87YWe4fyHNbOkXA7OxGLrKyAWbswrjM8
	l7h9qaRzXHTcRFdYhvZWz6liq9S+zB/ViHEHNlXz6DvOl+sEDbwUH/uTEbdmPi6i2LOdD05p86L
	erbWdJEI09I/8hCXq7WuxVe4XinHlJBS4Qf
X-Received: by 2002:a05:651c:2123:b0:3a7:81c4:1906 with SMTP id 38308e7fff4ca-3a88767cfb2mr15478751fa.8.1791049858771;
        Sat, 03 Oct 2026 10:50:58 -0700 (PDT)
Received: from TimPc ([31.40.208.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e32c6ccsm21993201fa.38.2026.10.03.10.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:50:58 -0700 (PDT)
From: Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>,
	Tymofiy Zakharchuk <timofey.zakharchuk.research@gmail.com>
Subject: [PATCH v2] staging: sm750fb: fix resource leaks on probe error
Date: Sat,  3 Oct 2026 20:50:55 +0300
Message-ID: <20261003175055.1511-1-timofey.zakharchuk.research@gmail.com>
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
v2:
 - Fix From and Signed-off-by email mismatch.

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

