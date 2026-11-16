Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848917;
	b=bUYUIDKtVcdnsqbw7/xdBoxS886W2vBs9cGd+homnvGKLMihAa4JQf4LkivJKO50aDzT
	 j6cAmYGOZ39ZYbLzcUXz3mK6aCX5S00NdZ7VENSW44xwPtAecalft2ITtj6eQtpp6szpw
	 p2GKSpZcY++/qhRR3ILxVtxzIYsgoRxUL1fKcarh8kPHSeCHaxSsfFZQMNLu8Lr5FdFOf
	 t2NS5tM1Tz4HEaT1q9cvAedxo9KjZTTSjXNw+OQTx6ERDyY4W/Rz9Y2QpnLW0lJFMvZZV
	 iqwTVbaIPXRqcbecwkLLum9kXswVRRg/uuNTjvQf2WdxoBFVTBnunraOJYYqPfjigow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
	b=MdMrAzqVi0BghPC10h1MjonvoAp51eseEWxPx3BQk5pOemkTXEXv/zYkPjhso1oIJt8C
	 2m5eZAViuHcDh1eODRNkg0mxv1d9wiPaxS9vc68CUestXYRkd7s9rOynkwkS4gsa4LbAn
	 p+YYyueWLqiGMxnLRNU2U0kwCymoEtXtuyrEcfA+CKQDkSMZdEzBJ8UD2w2e6noGUr07Z
	 ahSsYYCRnPjoGg/vfxAD6ayZ9ELE3IJ1m66nWm5MpiawbAPezRXrQ2lz8JTJlWdz6RqHM
	 LGqVjKRhUcBJ7hQaGMzdFyZoxqfm3R5cN6vNmKZRJMWgO8WBybC+4bLoS9mKBNCPDOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frdg2n5r;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F400606A8A3
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F400606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frdg2n5r
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddff772fffso327037a12.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848915; x=1795453715; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=frdg2n5ri3CcoaZ84cq9xM3r0uba8kVJYhDczyzvwWK2p+FoVDbJNx0akCVf828yR8
         5Od3HGWJwEWr0oX42BpU+wzLjwwhAj+uUUyOqrM631OK3qcb5YY2z9AtX6OXlaZSla+I
         BOPoB8VfOFQZrRQ1hej9cZp8WOotCOAQ9XrEbVgnsvw4rztq40MtV5lfjYjZoQqqYJq8
         nEJ89y9eQdi+7k2ULzl1NhN9xSzptyqxWh7dDEFEdw3WZmNLpduQyQ9JFuyKCpeje25l
         611zkrKTs+ptznVilSZqpfBbheie4HREPplgp08C/NiaAJI9XizEy4x+mM06LknPVIob
         DxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848915; x=1795453715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyCAJqbOKleGpgFRMJoCvGXwTdjbSq8dLcDtNLIxJcA=;
        b=qu060vqWecrTgY5nzMms/FGiOaMhiZ/COs+poYN9Ejg2FpYt2M1am4aGxJOjTiuUIg
         ZRRufhuUpdxiswITDWPdT290K1V9pV59oHOMvyBoJRXLwCpR9rX7CIqjql3hWghCtrLN
         A/SAdffjDaroiFEtuwYI/jr571q9CA5jFOEwdUPOTLM9HqKidfHxaDUyhry08HT0dW4d
         XS03NOiwgMf5a2f+K1ZD/zVXgc9CQv4YK1yTe0vTlWV9wo8u0zWtZyamVMHX5p4ef8fQ
         HvvHurn7Sx/TuiEb/P6MVjsdI/nLHiIw1/s+LTquQ8dceMLAeex8nWLLY0GWiCPdxOEz
         wAJA==
X-Forwarded-Encrypted: i=1; AL+hErHBT693QrQ8wNQwnkmeBCffJJ6V94erLHtvEAGwh+PETPvIYkM0R1x3KbeleBPxLBIKYlgVGbILVRmgU4sM@lists.linux.dev
X-Gm-Message-State: APuU4Z8JLls9MTs9yYiOR5OSNEip/qlGnbNb6dbk7a8xjBmuFdZ5zQDT
	BXfrAhEFkoCIqsHX/VQ252Mx9xegsKKhG8tqgn9jS3LDixY/t1oLyDQa
X-Gm-Gg: AZFdTZfn32H0CCWcDc/JK4VP24AAnPJGMRcVU4x+zld19IUBw12Mbne9uVWp22zPBKa
	3TPcMhpYEWcSxKXJs3t2qPAhK5yLO7F+BldJV/Z5WtRmjvEQu0b7prC5UUBhde6B0GcMXGNdkID
	BkLN8WhiXTnPZZ7ymmYlYRMDW33sJ2gS436u0/iRPQyjmaiLVDFywOVCgvt5mUb+AesxFrgEWhY
	qbZVj+th/ryifRcx9r76msJ/AYz8TdvtpaD6OBP6JM4TJVFwlSKKowP403yR6e0G27j5quo7SiR
	CdhVY1yc7Cnq9QFFzXvf8Sl7PjQXOkLwmEVg62fYkVnEqYYbqAme/7Zo/a2iN/jh9Q+giwbffhf
	0fEwZkbByxUNBsKGOSHqZ2Sig5pRhaxb60JYS5SulYa388xd0YS0wYdt1dSi84AUpC56AHATJPv
	EIjPuj9OQAquiBE/lTt9hKIx9huRbG+SB8pkhpBb6c023lyfCIFN5aMYqWxP+ZXD6Zg50LLf1lz
	+r7kSWt8+OZlJOur/Wx6vbje2eVHcWn10+fYS1UKv4V+4TD7yNnLB1lNkdv+3Yw7kV9VB4IKlLf
	VP0OVlObR92QGAzYyg4BECS3xu/RwlQOXdE2IlVMekJqiGP2TgJYbnez4NcH6JSI3fcGtq2u8w=
	=
X-Received: by 2002:a17:90b:4a88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3b1b09f37b1mr9809235a91.12.1794848915345;
        Mon, 16 Nov 2026 09:08:35 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:34 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 17:08:11 +0000
Message-ID: <ab38fba11a3d7c38f50c5bd4751494b4f6281d6e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 6 ------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..b487b7f31 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -103,12 +103,6 @@ void irq_raise(
     const irq_ID_t				ID,
     const irq_sw_channel_id_t	irq_id);
 
-/*! Test if any IRQ channel of the virtual super IRQ has raised a signal
-
- \return any(VIRQ.channel[irq_ID] != 0)
- */
-bool any_virq_signal(void);
-
 /*! Enable an IRQ channel of the virtual super IRQ
 
  \param	irq[in]				IRQ (channel) identifier
-- 
2.43.0

