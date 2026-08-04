Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457A2459AEE
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842156; cv=none; b=PkaeHe6oMdrleikMytlU3TymsCol4z2vgaWEvoPXPw1mXCndAJ8aClc5LXRG7PhzkfDf2BjyApCZp02fmBHp/jzbWeLXXOxIzfrmzaR4r8W0egRP/SKtoNMEtiOV4z5HvToTtVvcDuZGHOy4gRfiZ9TAodxmuVgtSiC6kGCgaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842156; c=relaxed/simple;
	bh=IUwU/nLGHeCRsSHhulF9+tBrCHQUzPIiNTn1o7uFxQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgGKj1JLfO4GJmCFMarPOW3q9ETcVizw1mo2a5Uv6IHNugt4Uddklc+zLXxsbne2vUgpbMTHPPsMzQF6q/YNvDGUkUtzzmTd7/D7QVFE9cXhP06U9PCH5e4hhF7MZNJtTFMQvE1QY9CVE/eL2J25mFxCPWQ/OUDXLYQj+oNn5DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TItKe1Mf; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TItKe1Mf"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3414247a91.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842154; x=1786446954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFND/opO8GqY6sjWo2/QuYyoYB46IVuPSxGS5+qnPKw=;
        b=TItKe1Mf0z31L+Kn0sej5KYMcHTCsHmoFi1d744+0OO9Wxz/DP3gPuoA7XLfHmNW39
         PQYQhEuPxp3GGppvlgC7LBIixhtd6ZgMhOOec15Uc/VWe+HsxBSjlnJ+ANKHTtJVsSJf
         d6INKJkArrLGb//GBARvFaJaocyjZNV2ZFNioAeTR5z9BiLLfwgITcs0HW5jbious65c
         hQWIe+sN2mKkZ842znJ56XOLTBcAKe4X/AZ88V0vm/MVnIAUJv19S9wI9P6whfY/YsUW
         psvCof30o7CKtb8kWoTsIs8noK0sjXeJI4Edrp4ArXVplmblG8bRTjThEIS+JwKwft7G
         We2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842154; x=1786446954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFND/opO8GqY6sjWo2/QuYyoYB46IVuPSxGS5+qnPKw=;
        b=tOluNqn6gNntSEW8fi1qZ9Sc9IRU5+6bI5g6+ekzvc4BHEiMemDlawUt/wLDenzdv5
         qZc7OhU2GPas8bKvWXbsDCVo8XWJ+dGgSskcyGUfmtYUVMLkjjkpiBplIbiLtPgBRcJw
         fy2nH6/8DYw/Ui4ijg3X4LjeJ39w97OHB++lakw2cYTqWS8q+wylz4+FWGvK+rircgYQ
         f4+MtTAx77U1QOX2l++X2gE2/NZPiCZOdtNWvTzJnDw63k1KydSEblm4AY07M2wDgGvl
         EfQ4Y9c6/G1HGztunYQGnilcKUZfA3fBtmnnL4mf0LGkUGNBSFVxlBWtNchpMrR63s4s
         hXGA==
X-Gm-Message-State: AOJu0Yxoo04L0GG1SqemSZI/daEx16beWf66dS9/MRAoQYiZnsuhzZY6
	DFUD8YHXfZb5L0/9IEPuMu3IhWH/6I5QgrAwRMIrT73sh9Xrda8SClVc
X-Gm-Gg: AR+sD12cU60gA84f8sqa/zcd7dUDNvgk49BLX/bPG3V/JCYptiIH2MjsmsxE+SBuAfS
	AjZ+ul8EIgjoI+oK+qB5rUZjknON+Af9mbcnKKGbUsm89BdTH3yd431ivT2l8G54e0MVzeFeHUb
	dL9UXab9TzJKl2j67lasN8r+tU6mQ/M0PNCBNket5ZHjcrWjiw5rZ2Xo4Bx89n/42zNvR+lkR5l
	EGaAsUXfK3fSXhauCfmQquW2HLPvF7hWNJPeGwbeBjVVysSyYcMjFQcEMDz8VPpFXrqdEmV3vmx
	ertVETDqt9X7/M8UBfhDS7NkTd4SrYBpcbEGVjl32cWEkhhi0gf+/YofdkwjM19JWkcsrkFCoka
	LpOiBaoz321I/MmJwm1tu2cMSK3yr1ZNE27E/O8EJWJvufBMM2HSgt4GyNbWZapR+OH7yHdGNEC
	Gx440qkqxA5kB2Smg/7UsgHfF9wkTLWaTd3lg1Kb5kPDAiNzP9llC6XBa1n5PXvMVboYBbLoCJF
	ujGOdM=
X-Received: by 2002:a17:90b:1dc3:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38fbc555340mr12128687a91.36.1785842154278;
        Tue, 04 Aug 2026 04:15:54 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0c61sm4200044eec.6.2026.08.04.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:15:53 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: media: ipu3: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 11:15:38 +0000
Message-ID: <20260804111538.22300-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Formatted as a standalone patch (removed 3/3 series numbering).

 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.51.0.windows.1

