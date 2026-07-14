Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A719247CC97
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037910; cv=none; b=SkpSszpRu3Cg60TNmzfbaUtO2w4TKBsTUUOOq3vAD3H28YQ0XFFw8kpGmelPhHllzUldkx891CQ+hrMiaX6K92TDYhqJ/pEUj7I81tWwV6onNfsLywdQ9WaeADSuvNz5pHCPVzuq9HNwMtuUcJIT/oBtr1ay9AdPC0npC1IfwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037910; c=relaxed/simple;
	bh=ggzyTfjEV0/9dpcpFtZ9kFFL7YcUs8Yp4tvAlAGWUbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9AKvYcSyMQTKyLVfVeBHrNamXDm8nprODye6uUUv1NycGOvU32Kl9QB5zC252fAPaLJtP2Nc2U2BntjhyyMMKHXc+yCaZAEJU8z8G0W4GaRdinhTCFaEVXrZdbXiQ+TnSKalOwEeTBqxktJ8qknmu8r7Ne0RR8qGHZhFc/wI+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlvYsboB; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlvYsboB"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso1532786a91.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037905; x=1784642705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=JlvYsboBcF1XgA41Ik06fvePTTrkTa5xIZX1Q92MkktKcPNIZWeol0IXx5kLoPDmYy
         CmxIgidWN1mTx5QZWla84NvQa0NIM7NGUbm74qBgRdstoQxOfbPkvqc2fxXUMm8Mg9aW
         DFu9xvRP6xMuY22oShs+5Xs59OrAhAM6WZjdGexTP2YRVt1TxofrkkLrk/3tB9elcqzA
         t1FV7hMnrXJtS93l/4PkOEhw9yLS6duM/EXFffhgKy/b4gG89X7Wx3MyrH6P+aOCj3QI
         4nurwDiuVHQuj8lqrEFA6GOM6kQZGSmPQzIMlQrr8FnUwfa/hUoSVKyTDoRSuq0vS/Js
         Kf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037905; x=1784642705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCS+xhHigKk4Qit1FS738ySqpbHn6h48fVzGRxbPZzk=;
        b=rbIYZ5cilixOA/eVJta2CLbe15Zi4OSSpXu6m6ScUCKROSn6yDg7/eGh9IKEJKSL2k
         qIbDHcElPuiydz+EuN0jwAUCGKRk/6060t++jali7SsVB81YmxP//l17+CHqmvspLnhj
         H8MxuEsiik3y8o2czwqJBrHk4Wzpkdern74Dbk6qaa0usXAFR8qrtiFayKdbVQ8OXsaV
         f+NedCUiJLBjM3dcQH1xn1J+JbK40YqRC9THVzNTF/JwMuFoAlzGXOdFqiWxg5X427cf
         jlVTEd+7EXHYBI6+iuJ4V0he4u2dm7BtLPd4CUDEeFLYZWSJELCm7Q/fDEoMdYGjjgUE
         /bug==
X-Forwarded-Encrypted: i=1; AHgh+Rqt12/HqrdfazE3AruX7faZQg82kd9NbLdpKG44EE4L6oPQkwOX9BLNwJIhVrnlgQJDFWuyk11rFLrJmm+r@lists.linux.dev
X-Gm-Message-State: AOJu0YxcHA9jzAgB6AH5S4iIBVuCPajbFwXkudxTRRVbAIdGHIieg3K5
	OGVV2e/f6OFu+YetLktiMkZOppOUBCDkXIN1juxkcoeUmNrumNKI0rGV
X-Gm-Gg: AfdE7cmomry12kgmos+HuYUTTK6MtF0yrX9VEVOXXYZBwPCobdC42xIJ5szqUOYVC13
	HZzWDCr2LRPQTB6RnzYHH8ZL8KW1Vf9Vzn71CKMu6W9gw37iV59pwejsVM61QOhbKKQ9zQNNs3E
	zowIeATWvYqWLQL/8iEM/swVafK97AlnVzSK8RF1OwKZJWbxutmttVOx1PeNc3LLu22Sz3yGY+2
	rybxfi/573OjrBUCtMslx7psl2MHG6Y8vTBon6O6EBRo0fFiPRpjh3/yJBE7sWtaY4lEVGzGujy
	sofDhXFRlPC6HonE2vHsrb+k1Wm9HrttDjJqk16S1HmsjD1HD5FZ2ZilLHpZoh3/UKjHjzjvF+/
	qrkrvk4rBaWkbgSktvsTrQOboMsLg4GchJB8WlL7cJv4IFKVXjSnQTWsUuIUgfmfIdKWhcfPsTR
	rbv9/7Co3XoYbFZgO/HFeZt4du5o51kFeguGuwXCihxnoW6jUUB07pvK1FETuOdDQYqjNVK22by
	CMjKhqWhbuMOQo9niX08myKTnvrTeCqgi6Vp/CCj/kW1YA=
X-Received: by 2002:a17:90b:3c8a:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38dc7605e7dmr12912747a91.18.1784037904733;
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm86964943eec.27.2026.07.14.07.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:05:04 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Tue, 14 Jul 2026 19:34:58 +0530
Message-ID: <20260714140458.1276-1-alfievarghese22@gmail.com>
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

Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
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

