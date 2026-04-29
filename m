Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E13815CC
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485000; cv=none; b=MZoolz2mbtN4yuCJmXaRRtMIRlc+H1Ds5J8QtcG8h3+fDF73igcmtHG4cd3/3vqijULOHNoFbGIdZpO+MKG2essck77aPTo1MeSYM4PGk2SmtBgyyb8mb8KrBXpZ3Ssmf5+V2SPJmli5A5eccP3vz8TpY9Fj9S91RnoON30qjTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485000; c=relaxed/simple;
	bh=GXDy2EPWSVIeOj61/oWjBf0bAkD5nNMFZ37O68A7Nfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ACBbB1DHfpcrD7ERYYrtY/777TeAGSfQKSGSalHdNC+hwGLuLtNEGXuvL4EDhVpvYcVDiqV8dZtXFi8NdB+TOrZ877NCTjQdVaMJ2/g7eguJgdzjbrOZwtM1V9zYKjAb0eTyGb+rcwcZVMvkTYI4adOKmWNRJKPn3ul2yanAtSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7XY4Ohy; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7XY4Ohy"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8acb3dab8dfso776286d6.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777484998; x=1778089798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=r7XY4OhyicVyXntHYyvw6QPbXMLnXd1aAHwR89I4F0vSesuEn6I8d1cVNZ6zRW45Vx
         V1DtoDkKhnvm1433WYQYh/0AeybNx6Rz4wTi9+T3aoWj8OJ/fa01GWpO0yeI2loAgF/c
         Qvm9AJNEF2AUabSp/Zvdava4wGWXSU17rPtGZPaphvJ9Khv4GfJqj64BLTpmr5Kfdl1R
         bJ/ZEvaw5as4lOfrQUzVDxk9rudqchiKCvp//WmHbKr699KloG8B6wtXe5FWokk/EbpP
         poDlXJKPPOkt9R5mtiKfZRcY6CQr4ToZYdJiuZZmH7WOs0G2Fa4hEgkAMlHVv3DYpyPT
         VraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777484998; x=1778089798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=OO0uDd8AKxsczQ6wmZx4rcf7yD67VsJhBz5hX5mLq1UErZgfiz1AZV1m8yNvp3O0GQ
         PoObM+MCxkxVZbLXzzlvhwB7uxmqWVYXRomzJa4TvTkNZyWowR3VCrdmSCHjn+aKCS44
         GW4tZPfhyfYvhi3hP83l4ChS6sQcT6ZOrs3Ey851HdR4r3Ug6Ki5Iv+BHzluf09JPksb
         ZsSAVAb/+8YO5RpOMIrrh6Ya2whA7pCJr+V/lc9a7Ji9PLYesGYfaOMeCf1JAjap7Wdf
         grfShIMgL53K7o6ni8XQWxtXUqOqjM/1oRH5JJVyqDfeV3hefYeDdbHXIv67OVlH8+t+
         SGEg==
X-Forwarded-Encrypted: i=1; AFNElJ+jv2c806W8yxCDKyAJh5mrS0d5+UZseYmiQDSmJITUPKjnea7bjpwvKEtLStKbEnGFeb3aCXq1UIwgU6RA@lists.linux.dev
X-Gm-Message-State: AOJu0YxtN0bFZUFMm64NA+VKJlDoPxNrVCQkRTqKtWMIypGRHLqE3Jc9
	ZWCAtZzr7xG1/ioy1iKgQqt6ZoZUmBH8qFMffCV84DFuip2NkY+C4Ohn
X-Gm-Gg: AeBDiestetfqF9KJYUr+NiQAj0wUNqIykQIkBcO51KIyM0Hz39S4XYsWlx7kGkqXmpF
	qYXModpIsK2OIBg2pALfGE0kotnUyPhGxeCcTVZfKFY9476+7C2KCgdPTWYWonDy8ceR9UXSkch
	XlxjgCfHqp3hXVLIEK/QTuExSYkTN2+7fxGBUyjMug7feGOdtA4Vy2gA/PMsD1TO0LZ+T/4xLmd
	FlnzrzKYPumzYi6LiR9+kw/wQtgyuD1NCQyLNOwkbJqrYRXKcyH9xeDb2YTu06Eb61JjFgiu1pA
	MGxtZoruUeEAKodtdTqxBgYcUZctud9A7MGPdzjr0hSOtNE5DJCjx4iLIIuWD+tKk8fRwK0MRJi
	uaoj9osxs37obq9G5DVU6eRE98af1nya9uvJsjh/GV6uy7ciyT3c8flkEgnlsFRhL/tknTz39Oh
	bafl8ydoc+sm4Ntmk/jn026hqlQpx7ZOlTOIK3fW96ySnhl358CHhxX9pg30QGKUxVs+E+
X-Received: by 2002:a05:6214:5e0a:b0:8ae:6460:c550 with SMTP id 6a1803df08f44-8b3eddd9217mr74858746d6.36.1777484998234;
        Wed, 29 Apr 2026 10:49:58 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef81f156sm24021166d6.37.2026.04.29.10.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:49:57 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Date: Wed, 29 Apr 2026 13:48:52 -0400
Message-Id: <20260429174852.6059-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: Suppres -> Suppress

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6e52..f2838e40617a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -25,7 +25,7 @@ ia_css_mmu_invalidate_cache(void)
 	if (sh_css_sp_is_running()) {
 		HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
 
-		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppres warnings in CRUN */
+		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppress warnings in CRUN */
 
 		sp_dmem_store_uint32(SP0_ID,
 				     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
-- 
2.34.1

