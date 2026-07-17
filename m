Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F634EF0D
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257563; cv=none; b=u4o+MeVWCvycDWGkfjZSntiXOZJE+g88AMCXowVrSBz8pXCJSbPBOyIQDyPI7dLVqkB9XVEGOsnQDJqHSF1QqCoCVOVzR4xGxQn0pJYFIyexYV1d7B7U54fNbvZ8uLDSOpYph0PRF49n8hyBPV6P7pkqMfAAg/4+mNYE+cyL66I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257563; c=relaxed/simple;
	bh=IVQpi5kOsSjc6nbKgnNr4wTB7eZdYdNqamQ1aOhbGM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuzT1g4lJzEF3HpAGQi+aoBD/9f9b6cjpzlraT1Ypk5UwTyYE1oeZ83rt2tgYHKFUFpn7MGfhey+DrExeyXOx/oB/dAykP3OwP6col87pOJaPNw32/tnfEIs+qyQjQrG4kDMV/CPUQNVybEcrAnNRzJ4t1Rw8B9QR3sV18xGpH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPHSzj8M; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPHSzj8M"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e08baf860so4922983a91.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784257561; x=1784862361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=PPHSzj8MY9wtlE3gvSffV69darXwwaspGyRC1jpj3bgWBfKaJr0YPEiRMLA90sR8t1
         QAEGk+kMuaNlR99X+uYP2T0yo+EnCm3YeyVkKNDsSrszJxZedc+XPDL0qkrkU2ub90zB
         IvBqILZs2+RxwFscRCLzq/cEgXfWVru0cKWW80VtsloRIhnunPLZu9bGn5CT0ss6X1Sd
         yBBQp/L/Mv5MbCJKurhKsOqvSaD7JfzyJiy8soWNPR9fqbgHW+N/KWLn2n6rkfHuOo6d
         K7jGpOcU3h7ge92twNuH6gKSk1VNA5pA2Ff2pIGXp/tCvqbVf3ikl+ONAP54CLW4A4pZ
         CWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257561; x=1784862361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=P64plDL466xu+MMd7hKcr5hNkpqSuq83i78xCJWIjP7kW0emk4Euxd5eYl+Ux4QIy8
         yQKUm/x3BcvZS3P4UJ704d62YFEpBidX7N5M63wLz2d+U0WctsVoXwIf1yhBpeXQJirg
         rrLihKtIosrrHbzMzju7LQXSdTl3uhhnHfJMYIAYvgaWNhqrYXhciyBpCUSfyy3JC5A9
         0nWGr3ciWO0s9FjDXg6U1eoaKvnBSi2lQ/TbmDs/dkkxZhVD8px8LBt76R8+vWDl+EFb
         QyxaK0gnO/nrntrSFlKIPFYNo30TtORsVQrIJB8I+HX15GiRanihWJYgIOGXpwbAACBI
         8pJw==
X-Forwarded-Encrypted: i=1; AHgh+RrXPdd+I3Q91U9Av1qvfhBMkHYL4ZY7MofV08IRJZQvh+nM4uE1xyEHaaeubs4W0EDpI60E5FEAg5mM2DHu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7sdG+b1DlGrghMBzCqsO1vWP7taRsyflKCRJZvrj11p62tRes
	IdK/DL1R4Zm8PTRlPd/JAJ9wHhfHAmy/AYpaD7bVnUzae/vaFpftMAy0
X-Gm-Gg: AfdE7clAF+WLfxfZu9MZ4g12XJoaEsCw3wdne5nWgteiRDt4WtQLG3VC/2w0U3DAnoM
	G9RBS1Mm5wVLJ2ihtsQspmrywh9FWkg9g6V9GzM8QqGeaJpfBDlD93Rhez2tuyMFod2CKxSlMwB
	pc3cT0DiICGTUYGlPdZeO6rVdauPRD87vk2CGW6b3hvqpyd/xRE/0U6jr8prFbQkn+aId7uFBDw
	tt/2sGkbKeE0imacpOG3X5/T6Au05E18DtZNxSI3mryMOY9V7Iy0ZKpLVliYbTF9Bo/LR9E3SZq
	L62mto/zh21hCiDGC9sh6oEQD3lLUqfkKfw+ZJk/AZp/QzQtYyz12jqgTjrabQMraE4CEbvrQQm
	4ccwW9MAAxlGhXr7uOnPpuZ9kf/GTJgJfZSTEY9y5CyV3jdrSKa9/HQ7spKagGG5xZOC2y/8BAo
	E7Zez3Ejrv5ll4tTRTbf5z313OMGkqD5zUI0qLM3VOJ8B7Yq77eqxIpFqj5o6fdczerLw591J+H
	PmfbSbZ6stSm+iG7LelH2yBhZFAZ8yBJSFA
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr715137a91.18.1784257561268;
        Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
Received: from OMEN ([103.184.238.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm1424650eec.7.2026.07.16.20.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:06:00 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Fri, 17 Jul 2026 08:35:58 +0530
Message-ID: <20260717030559.167-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
This masks the actual error code returned by the clock framework, such
as -ENOENT when a clock is not registered or -ENOMEM on allocation
failure.

Return PTR_ERR() instead to propagate the real error to the caller.

Reviewed-by: Dan Carpenter <error27@gmail.com>
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
-- 
2.54.0.windows.1

