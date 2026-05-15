Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDFE44B68E
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 10:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841513; cv=none; b=b8Kwkg8GH4mcXCX+0uNDVsDif7YsYClpKwRqZTJvqvzqpzmoO1UkW0+CXH+JeRFgn8c10erJHfyNYQJzspxDrD/bZ8/DMLEECowL+ZWKOVRPXs65J2NwThBpekRZzqeVUtH9m+MLQhI6Ge+UpulqQEhuovTuIGZQlioJKXiDOL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841513; c=relaxed/simple;
	bh=JXO9K/UWrd7JiYU4CmF3JCr1nL+D3hpSGREU/uqsNxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jf4Fb4H8+1sia5TcaeTMz2cGVSPXU6P0c8KWDo3YoGh4Fpyl5K6s9qPUXjncAJm5waapF2NN7BZp2UsxCIsgSCvZKB9BK3hksJ4NIPLdRIJ2LakvmxQUdktZ20dDVOo4aIGiSQzIY4GyoHPmlc0erSe+C6EunyxSwejTh4ktOtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO4+szV/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO4+szV/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so9164989e87.3
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778841511; x=1779446311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRJKWy1O4nl3i01yN37op8R09tvKSwOIAS8zqvO/8bY=;
        b=cO4+szV/KOgwKJ7WsAlQsZaytebw096fkg+sNSKWgDmhLxwTitsnQDA4D8Bzejsu3B
         PUQz5j9piga3gnRy0/tMT+JEk4DAtESdg5Jsc8Z4HBdHlJU5HTU33HtTiCuZJRbtbQLN
         m4nhB4LY+8kxDEp/5DNjeiJlGYJYt9eVB+08arzBV13ThDNE+MWpXeGKvYA2rFr2MmJo
         s25PNSrCxjHazh59out2+PO3DJoKTfVCAcSOLRdBh05eRzmhSBhBOCzS5oNjy9eZGQ5W
         i27EBGHSpbgk2/3D7Y8kqimEH+tlIojtRYynB/+4jTp4Sg2oHKtCs9OAclVPdguhiGqb
         k+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841511; x=1779446311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRJKWy1O4nl3i01yN37op8R09tvKSwOIAS8zqvO/8bY=;
        b=SLahpNBLuiQvh5xsymm7fDMh17+6lZwDKN6bHQsvyOVBRwGD/WsgxJNWUJVNiHYODt
         S+o0XKcJ+hwZaZAxzRuWBLMTJ00hrU7IEZutiYN0w4nJ1fPhlCWd3W5y0eqstd0IMIM7
         +3ioDqsqPgWjFl5ZIXTv6/ynkLkb9W+zkPZNuiM4/WOBGUmYx33/p3J5CZcSB9Y/T46a
         AcDRnidSaPJ4kKzKGH3CRVh/BNDnJ7N9yo1NH6MdLBFOFzc/bZOM2mL1TmOYOgwCdgTR
         Z093BDDqYTbtA9DLy51x3PkNsFLeFa3vy3XHh1bKh/JFB8H8M4H7vsg855uh/D70qg5d
         ZKFw==
X-Forwarded-Encrypted: i=1; AFNElJ8yRoAWrNTJ2u5BY+ROFrMYiLThGHFxAGe84Oo/+0y0o8ybx+OxVn+KGo9+Y7y8Z5VgexCfkPey0dR/cdWW@lists.linux.dev
X-Gm-Message-State: AOJu0YyHV+lGFV+BiiSyxfHW+bKJzbeD1I16+XBXonlBINiQBJEyNs40
	M5+eeP3/Fee/Ntnooqozp5R55loKKvp1yW3rJ3t8wt+mXF3Bu86D4iLC
X-Gm-Gg: Acq92OF9TJwOhhEZZ75PZ/RxxyoJ6aoBpNc5arRdJf0hbGOmkLGKjcc+sTtSJRcr/FL
	GaueWUDlTMmFg5eRSTtLORBU233BuVhCNMwS54uqa0w3G5yS7Xw9vOQSjZscO8aK21MMO410vwB
	lWl4benKa7Kps3IikQ6kec2r95+Dr5PfIXu9iHanD34bhrunmmjYq219NHptc0fOXKraThxKPXw
	+N7w7B6XA1W37lK2Fea8a12dXieu6RdXIPt8dSCBz59ttuFhPgyzAjsJ/HdkgsHBCaib3CrZAox
	gytvLTZwol7AePj2ZuHjAxYLk7V/r4GIrOUxf6o1pr7Gunn7rPYICQv6ckYHn4qia2hKH/EeS8W
	erNJ4YJqW5RUfKCFRx29kZZh6u9Lln5UIBQK5ChvTcBGBplep+upXzQHeUwHLT/3KM2JeWLmVPt
	WONgF8xiAXavAco2BVjHpLd5gvl2guTC1b9XS5+5hKLSvBdRpI8Ma/wSg6tq0ePzQIsEeMigBAx
	mnP3JF/pteyLggf9QTN23E=
X-Received: by 2002:a05:6512:695:b0:5a8:f984:1541 with SMTP id 2adb3069b0e04-5aa0e7640c7mr843728e87.37.1778841510306;
        Fri, 15 May 2026 03:38:30 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7c2sm1210663e87.32.2026.05.15.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:38:29 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] staging: sm750: rename CamelCase variable in sm750.c
Date: Fri, 15 May 2026 13:38:11 +0300
Message-ID: <20260515103811.2808620-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed the following CamelCase variables to snake_case to comply
with Linux kernel coding style:
- pvReg -> pv_reg
- setAllEngOff -> set_all_eng_off

Issue found by checkpatch.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 996a586a3727..9b30627a19d0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -755,7 +755,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * must be set after crtc member initialized
 	 */
 	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	crtc->cursor.max_h = 64;
@@ -860,7 +860,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
@@ -1059,7 +1059,7 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
+	iounmap(sm750_dev->pv_reg);
 	iounmap(sm750_dev->vmem);
 	pci_release_region(pdev, 1);
 	kfree(g_settings);
-- 
2.43.0

