Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FB324B22
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963009; cv=none; b=hQGa48lVxKaHtESX46XqbdMNBXkl/Tw/ckNg/NhJg47wJfy8iwtpOyiaNX1N00N0YMWp/Ot3Eo6YciRtHEuKUgwchH7AghQvKlt/KqlKqrQGFCUM2pKtXZfxr+tLRZQpP0cBMS+cTDGrjokOcwIVRxeJkHDAfs4/OCMNPY6eNh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963009; c=relaxed/simple;
	bh=DtDlb4T/GlICkbzrC4fhGZYL7BcVSaw/4uXDAPCLN2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssVIYXNYM2mLaXPh2D2GkRwpTHCNLZtcRSiBonL6wpeWhQacCpNWJTeM9NFFBgk76XUSo0YZVDJ34RqTU3ZTEjs2RMuL9e9AiFqoJPfGERM7q3eRFuKG+t07ogj7A6irn2xjBO4Pt31ijiTQGjgXp4XLO6+ds+Zrm+147l3k3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHYvAQRR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHYvAQRR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381216921aaso3778621a91.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963006; x=1784567806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=eHYvAQRRKZqzzDLvRtKC5zdkoaT6vSdy9umu5/4MrNnrg156IK6zfRRJn3+buBflJh
         f9xd3k5rj7gwbEKnjYPGoBiULaVUzHBYr3hwlDLD8yMCxpwQg+IukeUKF6GoD38QqrGK
         9XHRVSBqDJnEfsQzs9QKGoK2S77w9DrDJ4V9drJDo8Lq8sykvuo1vzoni0gtRFk3jiTH
         Gra3WIm35vEUaBeQasLX1tZcMJdtDizwbEza2YjJ4mjkWu6pxkmRhB/vosbSlr5QpFbf
         TVIK6PZUNl3l6AjxtOicTrcLR6X/BED6QRMKzIbLaBzzAWxn/Vv27+1RYowywdS01boZ
         NSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963006; x=1784567806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=Q6zaYTWhOSKLGwv50gg1W8uQJtSyt4kcs//SKPMT6BK+7PXYfRSFy3qiyGtWoLP8zS
         TdIkfFoKr2stsIjYpJfNesxO23d9nqhVAMylwSY1upzKRvd6YUWmM7d+iEB/hzeGUniV
         KKdr4BXc/y5J7ET2iDmUaNieWcNwoL4nuRKTqdouWMU5bdSB79pd2RU4FHREgPm0HyV6
         qNsC/pt5f50wXYVml4G8U7IIPT6CRheSv97CAdOWoddy15ylyV+KoXKVm804+HpJSxTA
         7TbXvPkS9aAVnxQtfejaJcLVO2VCKluuh7hWUp6uX4FFARadhg0KppTSbbWxNT0ssPvX
         4FjA==
X-Forwarded-Encrypted: i=1; AHgh+RoK37H9LfgKd598Fh4j3hl2JxfR2FKutqmKgVTTxsp4EVePgdo4lWLbizTrldLkGSqAuCBdSSpQ+/wRgiwM@lists.linux.dev
X-Gm-Message-State: AOJu0YzS3SQnOWwTNUArk7aaCxjMgsmJ26NIR4nz14+vx+3FEg1An6ev
	KeHeMgJzi2aHcsYo7mCM2c9Ad0L4V9F6ngRru3kXtUEDTCdyvzVP7/1tHseWoudv
X-Gm-Gg: AfdE7cl693+3BoOjy2/SJ1UYrwLJqoYDhI3m/RqLs2UVTE9SXUEebCfiQE3Zzv5GCuX
	Zxf47KgILowu1K+xIcGNEupufjSo+jhbDY0JbfTbmC7gSwK/l182DMSaGdz9i+sQ/i+IKly/eSO
	UPMWIdmzd7KT7gJ+gjiwJfGaY3NI8kN91AliozDUWYZ1F1St6sHOIqKJZvCnCmpLiyZj/zz3Uoq
	5yA7xGTmf23+7F+BV1HB1ke/LJ6lCILOby5ClRQqsVesY80sf6XoaLYAc+c0s+PCvgr1kSLJd/v
	gCN6AmK7N5AubzQbrpFcZPHhkYxkh0PEyxoB8jFZysiWlNH2eeh+VngAgnGHYWZAXhzBhM6hB9K
	DNHku3QU9MI6zEhXO5tCyun62m5w50wL7RyvLocp4CqmgA+2xaBhOnWtrv9nHF9+i2+xSFZWyzD
	gYdU3sJUvuTKmO2AXnSRWl7qtjZtzDqzbFsM89hktv0rdYzPjkJ1joDkJkdHBoJjgDgsomahSH4
	cIKlLpP0SxmD/rb1Yy/0D1D1AGPCFQS59XAKe2gN9sRbiI=
X-Received: by 2002:a17:90b:58ce:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38dc74cff62mr9789745a91.11.1783963006364;
        Mon, 13 Jul 2026 10:16:46 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm55281016eec.22.2026.07.13.10.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:45 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Mon, 13 Jul 2026 22:46:44 +0530
Message-ID: <20260713171644.691-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
incorrect because devm_clk_get() can fail with other error codes like
-ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
masks these real errors, causing the driver core to retry probing
indefinitely instead of failing early.

Propagate the actual error value using PTR_ERR() instead.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
